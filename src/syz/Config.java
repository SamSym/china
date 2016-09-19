package syz;

import com.jfinal.config.*;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.render.ViewType;
import syz.api.*;
import syz.common.LoginInterceptor;
import syz.controller.*;
import syz.model._MappingKit;

/**
 * Created by 宋亚周 on 2016/9/16 0016 15:45.
 */
public class Config extends JFinalConfig {
    public static final String USER_IN_SESSION_KEY = "user_in_session_key";

    /**
     * 配置常量
     */
    public void configConstant(Constants me) {
        // 加载少量必要配置，随后可用PropKit.get(...)获取值
        PropKit.use("config.properties");
        me.setDevMode(PropKit.getBoolean("devMode", false));
        me.setEncoding("utf-8");
        me.setViewType(ViewType.JSP);
        me.setBaseViewPath("/WEB-INF");
    }

    /**
     * 配置路由
     */
    public void configRoute(Routes me) {
        //第三个参数为该Controller的视图存放路径，省略时默认与第一个参数值相同。
        me.add("/", IndexController.class);
        me.add("/user", UserController.class, "/");
        me.add("/message", MessageController.class, "/");
        me.add("/collection", CollectionController.class, "/");
        me.add("/distribution", DistributionController.class, "/");
        me.add("/myInfo", MyInfoController.class, "/");
        me.add("/myDh", MyDhController.class, "/");
        me.add("/myOrder", MyOrderController.class, "/");

        me.add("/api/myuser", UserApi.class);
        me.add("/api/myinfoadvice", MyInfoApi.class);
        me.add("/api/mess", MessageApi.class);
        me.add("/api/diss", DistributionApi.class);
        me.add("/api/mycoll", CollectionApi.class);
    }

    /**
     * 配置插件
     */
    public void configPlugin(Plugins me) {
        // 配置数据库连接池插件
        DruidPlugin druidPlugin = new DruidPlugin(PropKit.get("jdbcUrl"), PropKit.get("user"), PropKit.get("password"));
        me.add(druidPlugin);

        // 配置ActiveRecord插件
        ActiveRecordPlugin arp = new ActiveRecordPlugin(druidPlugin);
        arp.setShowSql(true);
        me.add(arp);

        // 所有配置在 MappingKit 中搞定
        _MappingKit.mapping(arp);
    }

    /**
     * 配置全局拦截器
     */
    public void configInterceptor(Interceptors me) {
        me.addGlobalActionInterceptor(new LoginInterceptor());
    }

    /**
     * 配置处理器
     */
    public void configHandler(Handlers me) {

    }
}
