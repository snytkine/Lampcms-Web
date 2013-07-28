package dmitri.snytkine;

import java.util.LinkedHashMap;

/**
 *
 * @author admin
 */
public class MyMenu extends LinkedHashMap<String, String> {

    public MyMenu() {
        this.put("about", "About");
        this.put("features", "Features");
        this.put("license", "License");
        this.put("examples", "Examples");
        this.put("support", "Support Forum");
        this.put("download", "Download");
    }
}
