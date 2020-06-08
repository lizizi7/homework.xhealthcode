package util;

import com.google.gson.Gson;
import dao.ApiResponse;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Web {
    public static <T> void sendOK(HttpServletResponse response, T object) throws IOException {
        response.setContentType("text/json;charset=utf-8");
        response.getWriter().write(new Gson().toJson(new ApiResponse<>(200,"ok",object) ));
    }

    public static <T> void sendError(HttpServletResponse response, int code, String msg) throws IOException{
        response.setContentType("text/json;charset=utf-8");
        response.setStatus(code);
        response.getWriter().write(new Gson().toJson(new ApiResponse<>(code, msg, null)));
    }

    public static <T> void sendRedirect(HttpServletResponse response, ServletContext context, String url) throws IOException {
        response.sendRedirect(context.getContextPath() + url);

    }

    public static <T> void page(HttpServletResponse response, HttpServletRequest request, ServletContext context, String url) throws ServletException, IOException {
        context.getRequestDispatcher(url).forward(request, response);
    }
}