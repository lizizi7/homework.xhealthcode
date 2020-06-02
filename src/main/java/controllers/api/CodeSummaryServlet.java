package controllers.api;

import ext.exception.ServiceConstructException;
import services.ICache;
import services.ServiceContainer;
import util.Api;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CodeSummaryServlet", urlPatterns = "/api/summary")
public class CodeSummaryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ICache cache = ServiceContainer.get().cache();
            Api.sendOK(response, cache.codeSummaryCollection().get());
        } catch (ServiceConstructException e) {
            e.printStackTrace();
        }
    }
}
