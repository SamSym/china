package syz.common;

import java.io.Serializable;

public class JsonResult implements Serializable {

    private boolean ok;
    private String code;
    private String message;
    private Object data;

    public static final JsonResult SUCCESS = new JsonResult(true, null, null, null);

    public static final JsonResult FAIL = new JsonResult(false, null, null, null);

    public static JsonResult result(Boolean ok) {
        return new JsonResult(ok, null, null, null);
    }

    public static JsonResult result(boolean ok, String code, String message, Object data) {
        return new JsonResult(ok, code, message, data);
    }

    public JsonResult(boolean ok, String code, String message, Object data) {
        this.ok = ok;
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public boolean getOk() {
        return ok;
    }

    public void setOk(boolean ok) {
        this.ok = ok;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
