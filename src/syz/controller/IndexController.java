package syz.controller;

import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.StrKit;
import syz.Config;
import syz.common.LoginInterceptor;

public class IndexController extends Controller {

    public void index() {
        render("index.jsp");
    }

    @Clear(LoginInterceptor.class)
    @Before(POST.class)
    public void login() {
        boolean result = false;
        String username = getPara("username");
        String password = getPara("password");
        if (StrKit.notBlank(username, password)) {
            Prop prop = PropKit.use("user.properties");
            result = password.equals(prop.get(username));
        }
        if (result) {
            getSession().setAttribute(Config.USER_IN_SESSION_KEY, username);
            redirect("/");
        } else {
            setAttr("username", username);
            setAttr("msg", "用户名或密码错误");
            render("login.jsp");
        }
    }

    public void logout() {
        getSession().invalidate();
        redirect("/");
    }
}





