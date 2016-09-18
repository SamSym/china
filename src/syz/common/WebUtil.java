package syz.common;

import javax.servlet.http.HttpServletRequest;
import java.util.UUID;

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

    public static String getImageUrl(HttpServletRequest request, String fileName){
        return getDomain(request) + "/upload/" + fileName;
    }

    public static String getRandomFileName(String oldName){
        return UUID.randomUUID().toString() + oldName.substring(oldName.lastIndexOf("."));
    }
}
