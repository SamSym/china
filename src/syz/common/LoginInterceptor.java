package syz.common;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import syz.Config;

/**
 * Created by 宋亚周 on 2016/9/16 0016 18:09.
 */
public class LoginInterceptor implements Interceptor {
    @Override
    public void intercept(Invocation inv) {
        Object object = inv.getController().getSession().getAttribute(Config.USER_IN_SESSION_KEY);
        if (object == null) {
            inv.getController().render("/WEB-INF/login.jsp");
        } else
            inv.invoke();
    }
}
