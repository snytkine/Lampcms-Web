/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dmitri.snytkine;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class LampWeb extends HttpServlet {
	
	private static final Logger log = Logger.getLogger("LampWeb");

//    MyMenu menu;
//    @Override
//    public void init(){
//        try {
//            super.init();
//        } catch (ServletException ex) {
//            System.out.println("parent init failed: " + ex);
//            Logger.getLogger(LampWeb.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        this.menu = new MyMenu();
//    }
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	log.info("LampWeb request begin.");
        
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LampWeb</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LampWeb at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	log.info("LampWeb doGet begin.");
    	
        response.setContentType("text/html; charset=UTF-8");
        String relUrl = UrlResolver.getRelativeUrl(request, true);
        String redirectJsp;
        ServletContext cx = getServletContext();
        Map navMenu = (Map<String, String>) cx.getAttribute("menu");


        request.setAttribute("currentUrl", relUrl);

        if (!navMenu.containsKey(relUrl) && !relUrl.equals("documentation")) {
            response.setStatus(404);
            relUrl = "error404";
        }

        RequestDispatcher dispatcher = cx.getRequestDispatcher("/WEB-INF/pages/" + relUrl + ".jsp");
        dispatcher.forward(request, response);

    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}