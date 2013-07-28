/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dmitri.snytkine;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet for streaming contents of phptest.php file so user can download it
 * instead of just seeing it
 *
 * @author admin
 */
public class DownloadStream extends HttpServlet {

    private static final int DEFAULT_BUFFER_SIZE = 1024; // 10KB.
    
    private static final Logger log = Logger.getLogger("DownloadStream");
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ServletContext cx = getServletContext();
        PrintWriter out = response.getWriter();
        String fileName = this.getInitParameter("file");

        String location = cx.getRealPath(fileName);//cx.getR"/WEB-INF/phptest.php";
        //System.out.println("Location: " + location);
        log.warning("Location: " + location);

        File file = new File(location);

        if (!file.exists()) {
        	log.severe("Not found file: " + location);
            
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);

            RequestDispatcher dispatcher = cx.getRequestDispatcher("/WEB-INF/pages/error404.jsp");
            dispatcher.forward(request, response);
            return;
        }

        response.reset();
        response.setBufferSize(DEFAULT_BUFFER_SIZE);
        //response.setContentType(contentType);
        response.setHeader("Content-Length", String.valueOf(file.length()));
        response.setHeader("Content-Disposition", "attachment; filename=\"phptest.php\"");

        // Prepare streams.
        BufferedInputStream input = null;
        BufferedOutputStream output = null;

        try {
            // Open streams.
            input = new BufferedInputStream(new FileInputStream(file), DEFAULT_BUFFER_SIZE);
            output = new BufferedOutputStream(response.getOutputStream(), DEFAULT_BUFFER_SIZE);

            // Write file contents to response.
            byte[] buffer = new byte[DEFAULT_BUFFER_SIZE];
            int length;
            while ((length = input.read(buffer)) > 0) {
                output.write(buffer, 0, length);
            }
        } catch (Exception e) {
        	log.severe("Error. Unable to send phptest.php " + e.getMessage());
            
        } finally {
            // Gently close streams.
            //close(output);
            close(input);
        }

        return;
    }

    // Helpers
    private static void close(Closeable resource) {
        if (resource != null) {
            try {
                resource.close();
            } catch (IOException e) {
                // Do your thing with the exception. Print it, log it or mail it.
                e.printStackTrace();
            }
        }
    }
}