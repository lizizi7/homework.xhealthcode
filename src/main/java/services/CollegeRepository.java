package services;

import dao.*;
import ext.declare.DbContextBase;
import ext.exception.OperationFailedException;
import models.*;
import util.ResultType;

import java.util.ArrayList;

public class CollegeRepository implements ICollegeRepository {
    private DbContext context;
    private IUserRepository userRepository;

    public CollegeRepository(DbContextBase context, IUserRepository userRepository){
        this.context = (DbContext)context;
        this.userRepository = userRepository;
    }

    @Override
    public ArrayList<CollegeDao> getColleges() {
        try {
            ArrayList<CollegeDao> collegeDaos = new ArrayList<>();
            for (College college : context.colleges.all()){
                CollegeDao collegeDao = CollegeDao.fromCollege(college);
                collegeDao.setProfessions(getProfessions(collegeDao.getId()));
                //collegeDao.setStudentSummary(summaryOfCollegeOfStudent(collegeDao.getId()));
                collegeDaos.add(collegeDao);
            }
            return collegeDaos;
        } catch (OperationFailedException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public CollegeDao getCollege(long collegeId) {
        try {
            College college = context.colleges.get(collegeId);
            if(college == null)
                return null;
            return CollegeDao.fromCollege(college);
        } catch (OperationFailedException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public CollegeDao addCollege(College college) {
        try {
            College c = context.colleges.query("name = ?", college.getName()).unique();
            if(c != null){
                return null;
            }
            context.colleges.add(college);
            return CollegeDao.fromCollege(college);
        } catch (OperationFailedException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public CollegeDao updateCollege(College college) {
        try {
            College c = context.colleges.query("name = ?", college.getName()).unique();
            if(c != null){
                return null;
            }
            context.colleges.update(college);
            return CollegeDao.fromCollege(college);
        } catch (OperationFailedException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void deleteCollege(long id){
        try {
            for (Profession profession: context.professions.query("collegeId = ?", id)){
                deleteProfession(id);
            }
            context.colleges.delete(id);
        } catch (OperationFailedException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteProfession(long id) {
        try {
            for (Xclass xClass: context.xClasses.query("professionId = ?", id)){
                deleteXclass(id);
            }
            context.professions.delete(id);
        } catch (OperationFailedException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteXclass(long id) {
        try {
            context.xClasses.delete(id);
        } catch (OperationFailedException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ArrayList<ProfessionDao> getProfessions(long collegeId) {
        try {
            ArrayList<ProfessionDao> professionDaos = new ArrayList<>();
            for (Profession profession: context.professions.query("collegeId = ?", collegeId)){
                ProfessionDao professionDao = ProfessionDao.fromProfession(profession);
                professionDao.setXclasses(getXclasses(professionDao.getId()));
                professionDaos.add(professionDao);
            }
            return professionDaos;
        } catch (OperationFailedException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public ArrayList<XclassDao> getXclasses(long professionId) {
        try {
            ArrayList<XclassDao> xclassDaos = new ArrayList<>();
            for(Xclass xClass: context.xClasses.query("professionId = ?", professionId)){
                xclassDaos.add(XclassDao.fromXClass(xClass));
            }
            return xclassDaos;
        } catch (OperationFailedException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public College getCollege(Object infer) {

        try {
            if(infer instanceof Profession){
               return context.colleges.get(((Profession)infer).getCollegeId());
            } else if(infer instanceof Xclass){
                return getCollege(context.professions.get(((Xclass)infer).getProfessionId()));
            } else {
                return null;
            }
        } catch (OperationFailedException e) {
            e.printStackTrace();
            return null;
        }
    }


    @Override
    public CodeSummary summaryOfCollegeOfStudent(long collegeId) {
        try {
            CodeSummary summary = new CodeSummary();
            for(Student student: context.students.all()){
                if(getCollege(context.xClasses.get(student.getXClassId())).getCollegeId() == collegeId){
                    UserDao dao = userRepository.get(student.getUserId());
                    if(!dao.isAcquired()){
                        summary.increaseNo();
                    } else {
                        if(dao.getResult() == ResultType.GREEN)
                            summary.increaseGreen();
                        else if(dao.getResult() == ResultType.YELLOW)
                            summary.increaseYellow();
                        summary.increaseRed();
                    }
                }
            }
            return summary;
        } catch (OperationFailedException e) {
            e.printStackTrace();
            return null;
        }
    }
}
