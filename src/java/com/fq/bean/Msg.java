package com.fq.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {
    //状态码,100表示成功,200表示失败
    private int stauts;
    //提示信息
    private String msg;

    //用户要返回给浏览器的信息
    private Map<String,Object> extend = new HashMap<>();

    public static Msg success(){
        Msg msg = new Msg();
        msg.setStauts(100);
        msg.setMsg("处理成功");
        return msg;
    }

    public static Msg fail(){
        Msg msg = new Msg();
        msg.setStauts(200);
        msg.setMsg("处理失败");
        return msg;
    }

    public int getStauts() {
        return stauts;
    }

    public Msg add(String key, Object value){
        this.getExtend().put(key, value);
        return this;
    }

    public void setStauts(int stauts) {
        this.stauts = stauts;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
