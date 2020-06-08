package services;

import dao.*;
import enums.Result;
import enums.TypeType;
import ext.declare.DbContextBase;
import ext.exception.OperationFailedException;
import models.*;
import requests.UserLogin;
import util.StringTools;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.Duration;
import java.time.Instant;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * 用户仓储类，由{@link ext.ServiceContainerBase#getService(Class)}自动创建
 */
public class UserRepository implements IUserRepository {
    private final DbContext context;
    private String msg;
    private final long eachPage = 20;
    public UserRepository(DbContextBase context){
        this.context = (DbContext) context;
    }

    public String getMsg(){
        return this.msg;
    }

    @Override
    public UserDao get(long id) {
        try {
            UserDao userDao = new UserDao();
            userDao.setAdmin(false);

            userDao.setType(context.users.get(id).getUserType());

            IStudentTeacherUnion user;
            user = context.teachers.query("userId = ?", id).unique();
            if(user != null){
                AdminUser adminUser = context.adminUsers.query("teacherId = ?", ((Teacher)user).getTeacherId()).unique();
                if(adminUser != null){
                    userDao.setAdmin(true);
                    userDao.setRole(adminUser.getRole());
                }
                userDao.setName(user.getName());
                userDao.setNumber(user.getNumber());
            }
            user = context.students.query("userId = ?",id).unique();
            if(user != null){
                userDao.setName(user.getName());
                userDao.setNumber(user.getNumber());
            }

            Info info = context.infos.query("userId = ?",id).unique();
            if(info == null){
                userDao.setAcquired(false);
            } else {
                userDao.setAcquired(true);
                userDao.setResult(info.getResult());
                userDao.setDate(info.getDate());
            }

            return userDao;
        } catch (OperationFailedException e){
            return null;
        }
    }

    public UserAccess login(UserLogin login, HttpServletResponse response){
        try {
            IStudentTeacherUnion user;
            if(login.type == UserLogin.ADMIN){
                user = context.teachers.query("number = ?", login.number).unique();
                if(user == null){
                    msg = "不存在该用户";
                    return null;
                }

                AdminUser adminUser = context.adminUsers.query("teacherId = ?",user.getId()).unique();
                if(adminUser == null){
                    msg = "该用户不是管理员";
                    return null;
                }

                if(!adminUser.getPassword().equals(StringTools.md5(login.passport))){
                    msg = "密码错误";
                    return null;
                }
            } else {
                if(login.type == UserLogin.STUDENT){
                    user = context.students.query("number = ?",login.number).unique();
                } else {
                    user = context.teachers.query("number = ?",login.number).unique();
                }
                if(user == null){
                    msg = "不存在该用户";
                    return null;
                }


                System.out.println("user:" + user.getUserId() + " idCard:" + user.getIdCard().substring(user.getIdCard().length() - 6));
                if(!user.getName().equals(login.name)){
                    msg = "姓名错误";
                    return null;
                }
                if(!user.getIdCard().substring(user.getIdCard().length() - 6).equals(login.passport))
                {
                    msg = "密码错误";
                    return null;
                }

            }
            // 此时执行登录操作
            context.executeNoQuery("update useraccess set expired = null where userId = ?",user.getUserId());
            UserAccess access = createUserAccess(user.getUserId());
            context.userAccesses.add(access);
            response.addCookie(new Cookie("_token", access.getToken()));

            return access;
        } catch (OperationFailedException e) {
            e.printStackTrace();
            return null;
        }
    }

    public UserAccess active(HttpServletRequest request){
        try {
            String token = null;
            Cookie[] cookies = request.getCookies();
            Cookie tokenCookie = null;
            if(cookies == null)
                return null;
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("_token")) {
                    token = cookie.getValue();
                    tokenCookie = cookie;
                    break;
                }
            }

            if(token == null)
                return null;
            UserAccess access = context.userAccesses.query("token = ?",token).unique();
            if(access == null)
                return null;
            if(access.getExpired() == null)
                return null;
            if(access.getExpired().before(Timestamp.valueOf(LocalDateTime.now()))){
                return null;
            }

            return access;
        } catch (OperationFailedException e){
            e.printStackTrace();
            return null;
        }
    }

//    @Override
//    public ArrayList<UserDao> fromCollege(long college) {
//        try {
//            ArrayList<UserDao> userDaos = new ArrayList<>();
//            for(User user: context.users.query("collegeId = ?", college)){
//                userDaos.add(get(user.getUserId()));
//            }
//            return userDaos;
//        } catch (OperationFailedException e) {
//            e.printStackTrace();
//            return null;
//        }
//    }

    @Override
    public void logout(HttpServletRequest request, HttpServletResponse response) {
        UserAccess access = active(request);
        if(access != null){
            access.setExpired(null);
            response.addCookie(new Cookie("_token", null));
        }
    }

    @Deprecated
    @Override
    public UserResult result(User user) {
        try {
            //User user = context.users.get(id);
            if(user == null)
                return null;
            UserResult result = new UserResult();
            result.setId(user.getUserId());
            result.setType(user.getUserType());
            Info info = context.infos.query("userId = ?", user.getUserId()).unique();
            if(info == null){
                result.setResult(Result.No);
            } else {
                result.setResult(info.getResult() + 1);
//                if(result.getResult() != Result.GREEN){
                //TODO 获取近期打卡的情况
                HashMap<Integer, Integer> summary = new HashMap<>();
                for (int i = 0; i < 7; ++i){
                    summary.put(i, Result.No);
                }

                for(DailyCard dailyCard: context.dailyCards.query("userId = ? order by date desc limit 7", user.getUserId())){
                    Duration duration = Duration.between(dailyCard.getDate().toInstant(), Date.from( Instant.now()).toInstant());
                    int days = (int)duration.toDays();
                    if(days < 7){
                        summary.put(days, dailyCard.getResult() + 1);
                    }
                }

                int leaves = 7;
                for (int i = 6; i> 0; --i){
                    if(summary.get(i) == Result.GREEN){
                        leaves--;
                    } else {
                        break;
                    }
                }

                result.setSummary(new ArrayList<>(summary.values()));
                result.setRemainDays(leaves);
            }
//            }

            if(result.getType() == TypeType.STUDENT){
                Student student = context.students.query("userId = ?", user.getUserId()).unique();
                result.setFieldId(student.getXClassId());
                result.setName(student.getName());
                result.setNumber(student.getNumber());
                result.setIdCard(student.getIdCard());
                if(student.getXClassId() != null){
                    result.setPath(CollegeDao.getPathFromXclass(student.getXClassId()));
                }
            } else {
                Teacher teacher = context.teachers.query("userId =?", user.getUserId()).unique();
                result.setFieldId(teacher.getCollegeId());
                result.setName(teacher.getName());
                result.setNumber(teacher.getNumber());
                result.setIdCard(teacher.getIdCard());
                if(teacher.getCollegeId()!=null){
                    result.setPath(CollegeDao.getPathFromCollege(teacher.getCollegeId()));
                }


                AdminUser adminUser = context.adminUsers.query("teacherId = ?", teacher.getTeacherId()).unique();
                if(adminUser != null){
                    result.setType(TypeType.ADMIN);
                }
            }

            return result;
        } catch (OperationFailedException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public UserResult getResultByLocator(User user, ResourceLocator locator){
        //TODO: 代码过于冗长，急需简化代码。
        try {
            //User user = context.users.get(id);
            if(user == null)
                return null;
            UserResult result = new UserResult();
            result.setId(user.getUserId());
            result.setType(user.getUserType());
            Info info = context.infos.query("userId = ?", user.getUserId()).unique();

            if(result.getType() == TypeType.STUDENT){
                if(locator.getType() != TypeType.STUDENT){ // 筛选
                    return null;
                }
                Student student = context.students.query("userId = ?", user.getUserId()).unique();
                if(student.getXClassId() != null){
                    PathDao path = CollegeDao.getPathFromXclass(student.getXClassId());
                    if (locator.equals(ResourceLocator.studentsOfCollege())){
                        if(locator.getTag() != path.getCollegeId()){
                            return null;
                        }
                    } else if(locator.equals(ResourceLocator.studentsOfProfession())) {
                        if(locator.getTag() != path.getProfessionId()){
                            return null;
                        }
                    } else if(locator.equals(ResourceLocator.studentsOfXclass())){
                        if (locator.getTag() != path.getXclassId()){
                            return null;
                        }
                    }
                    result.setPath(path);
                } else if(!locator.equals(ResourceLocator.students())) {
                    return null;
                }
                result.setFieldId(student.getXClassId());
                result.setName(student.getName());
                result.setNumber(student.getNumber());
                result.setIdCard(student.getIdCard());

            } else {
                if(locator.getType() == TypeType.STUDENT){ // 筛选
                    return null;
                }
                Teacher teacher = context.teachers.query("userId =?", user.getUserId()).unique();
                if(teacher.getCollegeId()!=null){
                    result.setPath(CollegeDao.getPathFromCollege(teacher.getCollegeId()));
                } else if(!locator.equals(ResourceLocator.teachers()) && !locator.equals(ResourceLocator.ofAdmin())) {
                    return null;
                }
                result.setFieldId(teacher.getCollegeId());
                result.setName(teacher.getName());
                result.setNumber(teacher.getNumber());
                result.setIdCard(teacher.getIdCard());


                AdminUser adminUser = context.adminUsers.query("teacherId = ?", teacher.getTeacherId()).unique();
                if(adminUser == null){
                    if(locator.getType() == TypeType.ADMIN){
                        return null;
                    }
                } else {
                    if(locator.getType() != TypeType.ADMIN){
                        return null;
                    }
                    result.setType(TypeType.ADMIN);
                    result.setAdminType(adminUser.getRole());
                }
            }

            if(info == null){
                result.setResult(Result.No);
            } else {
                result.setResult(info.getResult() + 1);
//                if(result.getResult() != Result.GREEN){
                //TODO 获取近期打卡的情况
                HashMap<Integer, Integer> summary = new HashMap<>();
                for (int i = 0; i < 7; ++i){
                    summary.put(i, Result.No);
                }

                for(DailyCard dailyCard: context.dailyCards.query("userId = ? order by date desc limit 7", user.getUserId())){
                    Duration duration = Duration.between(dailyCard.getDate().toInstant(), Date.from( Instant.now()).toInstant());
                    int days = (int)duration.toDays();
                    if(days < 7){
                        summary.put(days, dailyCard.getResult() + 1);
                    }
                }

                int leaves = 7;
                for (int i = 6; i> 0; --i){
                    if(summary.get(i) == Result.GREEN){
                        leaves--;
                    } else {
                        break;
                    }
                }

                result.setSummary(new ArrayList<>(summary.values()));
                result.setRemainDays(leaves);
            }
//            }

            return result;
        } catch (OperationFailedException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public long count() {
        return context.users.count();
    }

    @Override
    public ArrayList<UserResult> page(long start, long count) {
        try {
            ArrayList<UserResult> userResults = new ArrayList<>();
            for (User user: context.users.page(start, count)) {
                userResults.add(result(user));
            }
            return userResults;
        } catch (OperationFailedException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public PageDao<UserResult> fromLocator(ResourceLocator locator){
        try {
            int pageIndex = locator.getPageIndex();
            ArrayList<UserResult> userResults = new ArrayList<>();
            if(locator.getType() != TypeType.STUDENT){
                long count = context.users.queryCount("userType = ?", TypeType.TEACHER);
                long pageCount = (count - 1)/eachPage + 1;
                for (User user: context.users.queryPage("userType = ?", pageIndex * eachPage, eachPage , TypeType.TEACHER)){
                    UserResult result = getResultByLocator(user, locator);
                    if (result != null){
                        userResults.add(result);
                    }
                }
                return new PageDao<>((int)pageCount,pageIndex,userResults);
            } else if(locator.getType() == TypeType.STUDENT){
                long count = context.users.queryCount("userType = ?", TypeType.STUDENT);
                long pageCount = (count - 1)/eachPage + 1;
                for (User user: context.users.queryPage("userType = ?", pageIndex * eachPage, eachPage , TypeType.STUDENT)){
                    UserResult result = getResultByLocator(user, locator);
                    if (result != null){
                        userResults.add(result);
                    }
                }
                return new PageDao<>((int)pageCount,pageIndex,userResults);
            }
            return null;
        } catch (OperationFailedException e) {
            e.printStackTrace();
            return null;
        }
    }

    private UserAccess createUserAccess(long userId){
        UserAccess access = new UserAccess();
        access.setUserId(userId);
        access.setToken(StringTools.makeToken());
        access.setExpired(Timestamp.valueOf(LocalDateTime.now().plusDays(3)));
        return access;
    }
}
