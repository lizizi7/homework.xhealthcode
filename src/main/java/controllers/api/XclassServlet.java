package controllers.api;

import dao.XclassDao;
import enums.RoleType;
import ext.exception.ServiceConstructException;
import models.Xclass;
import services.ICache;
import services.ICollegeRepository;
import services.ServiceContainer;
import util.Web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name= "XclassServlet", urlPatterns = "/api/xclass")
public class XclassServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            int profession = Integer.parseInt(request.getParameter("profession"));
            if(action == null){
                Web.sendError(response, 403, "未指定action或profession");
                return;
            }

            ICache cache = ServiceContainer.get().cache();
            ICollegeRepository collegeRepository = ServiceContainer.get().collegeRepository();


            if(action.equals("get")){
                Web.adminPass(request, RoleType.ALL, null);

                ArrayList<XclassDao> xclassDaos = cache.xclassDaos(profession);
                if(xclassDaos == null){
                    Web.sendError(response, 403, "不存在指定的college");
                    return;
                }

                Web.sendOK(response, xclassDaos);
                return;
            }
            //TODO 对college是否进行验证
            if(action.equals("add")) {
                Web.adminPass(request, RoleType.SYSTEM, null);

                String name = request.getParameter("name");
                // TODO 对name的合法性进行验证
                if(name == null){
                    Web.sendError(response, 403, "name不符合要求");
                    return;
                }

                Xclass xclass = new Xclass();
                xclass.setProfessionId(profession);
                xclass.setName(name);
                XclassDao xclassDao = collegeRepository.addXclass(xclass);
                if(xclassDao == null){
                    Web.sendError(response, 403, "插入profession失败");
                    return;
                }
                Web.sendOK(response, xclassDao);
                return;
            }
            if(action.equals("update")) {
                Web.adminPass(request, RoleType.SYSTEM, null);

                String id = request.getParameter("id");
                String name = request.getParameter("name");
                // TODO 对id和name的合法性进行验证
                if(id == null || name == null){
                    Web.sendError(response, 403, "id或name不符合要求");
                    return;
                }

                Xclass xclass = new Xclass();
                xclass.setProfessionId(profession);
                xclass.setXclassId(Long.parseLong(id));
                xclass.setName(name);

                XclassDao xclassDao = collegeRepository.updateXclass(xclass);
                if(xclassDao == null){
                    Web.sendError(response, 403, "更新college失败");
                    return;
                }
                Web.sendOK(response, xclassDao);
                return;
            }
            if(action.equals("delete")){
                Web.adminPass(request, RoleType.SYSTEM, null);

                String ids = request.getParameter("ids");
                //TODO 对ids的合法性进行验证
                if(ids == null){
                    Web.sendError(response, 403, "ids不符合要求");
                    return;
                }

                for (String id: ids.split(",")) {
                    collegeRepository.deleteXclass(Long.parseLong(id));
                }
                Web.sendOK(response,null);
                return;
            }

            Web.sendError(response, 403, "不支持action");

        } catch (ServiceConstructException e) {
            e.printStackTrace();
        }
    }
}
