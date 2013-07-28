package dmitri.snytkine;

import java.util.LinkedHashMap;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.logging.Logger;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * Web application lifecycle listener.
 *
 * @author admin
 */
public class Config implements ServletContextListener {

	private static final Logger log = Logger.getLogger("ServletContextListener");
	
    public void contextInitialized(ServletContextEvent sce) {
        String versionNumber = "";
        String modifiedTime = "";

        ServletContext sc = sce.getServletContext();
        System.out.println("Starting contextInitialized");

        String fileName = sc.getInitParameter("zipFile");
        //System.out.println("zip file name " + fileName);
        log.warning("zip file name " + fileName);
        String zipLocation = sc.getRealPath(fileName);

        //System.out.println("Real path to zipFile: " + zipLocation);
        log.warning("Real path to zipFile: " + zipLocation);
        
        MyMenu navMenu = new MyMenu();
        sc.setAttribute("menu", navMenu);

        try {
            //System.out.println("Trying something");
            ZipFile zf = new ZipFile(zipLocation);
            //System.out.println("opened ZipFile");
            Enumeration entries = zf.entries();
            //System.out.println("Get entries");

            //BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
            while (entries.hasMoreElements()) {
                ZipEntry ze = (ZipEntry) entries.nextElement();
                //System.out.println("ENTRY NAME: " + ze.getName());
                if ("version.ver".equals(ze.getName())) {
                    //System.out.println("GOT version.ver");
                    //System.out.println("Read " + ze.getName());
                    Long lastmod = ze.getTime();
                    //System.out.println("Modified: " + Long.toString(lastmod));
                    modifiedTime = (new Date(lastmod)).toString();
                    //String formatted = (new SimpleDateFormat("yyyy/mm/dd")).format(lastmod);
                    //System.out.println("Mod: " + modifiedTime);

                    BufferedReader br = new BufferedReader(new InputStreamReader(zf.getInputStream(ze)));
                    versionNumber = br.readLine();
                    //System.out.println("version: " + versionNumber);
                    log.warning("version: " + versionNumber);

                    break;
                }
            }

            zf.close();

        } catch (IOException e) {
            //e.printStackTrace();
        	log.severe("ERROR!!!!!!!!!!!  IOException " + e.getMessage());
            
        } finally {

        }

        //System.out.println("zipFile location: " + location);
        sc.setAttribute("versionNum", versionNumber);
        sc.setAttribute("lastMod", modifiedTime);
    }

    public void contextDestroyed(ServletContextEvent sce) {
        //throw new UnsupportedOperationException("Not supported yet.");
        //System.out.println("NOT IMPLEMENTED");
    }
}
