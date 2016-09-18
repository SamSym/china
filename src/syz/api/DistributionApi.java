package syz.api;

import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import syz.common.JsonResult;
import syz.common.LoginInterceptor;
import syz.model.Distribution;

import java.util.Collections;
import java.util.List;

/**
 * Created by 宋亚周 on 2016/9/16 0016 19:34.
 * diss
 */
@Clear(LoginInterceptor.class)
public class DistributionApi extends Controller {

    public void getAllDistribution() {
        List<Distribution> list = Distribution.dao.findAll();
        if (list.size() > 0) {
            renderJson(JsonResult.result(true, "200", "成功！", list));
        } else {
            renderJson(JsonResult.result(false, "201", "未查询到数据！", Collections.emptyList()));
        }
    }

}
