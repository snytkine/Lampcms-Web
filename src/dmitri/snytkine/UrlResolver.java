/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dmitri.snytkine;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author admin
 */
public class UrlResolver {

    public static String getRelativeUrl(HttpServletRequest request) {

        String res;
        String baseUrl = null;

        if ((request.getServerPort() == 80)
                || (request.getServerPort() == 443)) {
            baseUrl =
                    request.getScheme() + "://"
                    + request.getServerName()
                    + request.getContextPath();
        } else {
            baseUrl =
                    request.getScheme() + "://"
                    + request.getServerName() + ":" + request.getServerPort()
                    + request.getContextPath();
        }

        StringBuffer buf = request.getRequestURL();

        if (request.getQueryString() != null) {
            buf.append("?");
            buf.append(request.getQueryString());
        }

        res = buf.substring(baseUrl.length());

        return res.toLowerCase();
    }

    /**
     * Get url used to access the page and strip the leading slash and strip the
     * file extension part.
     * In addition will convert result to lower case
     * So a url like /Mystuff.html will return "mystuff"
     *
     * @param request
     * @param trim
     * @return
     */
    public static String getRelativeUrl(HttpServletRequest request, boolean trim) {
        String res = UrlResolver.getRelativeUrl(request);

        if (true == trim) {
            if (res.startsWith("/")) {
                res = res.substring(1);
            }

            if (res.contains(".")) {
                res = res.substring(0, res.lastIndexOf("."));
            }
        }

        return res;
    }
}