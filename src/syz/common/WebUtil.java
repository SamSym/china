package syz.common;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by 宋亚周 on 2016/1/27 0027 21:50.
 */
public class WebUtil {
    /**
     * 获取网站域名
     * @param request
     * @return
     */
    public static String getDomain(HttpServletRequest request) {
        String port = request.getServerPort() == 80 ? "" : ":" + request.getServerPort();
        return request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
    }

    public static String getUploadUrl(HttpServletRequest request){
        return getDomain(request) + "/upload/";
    }
}
