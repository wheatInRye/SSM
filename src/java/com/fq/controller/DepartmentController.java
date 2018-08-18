package com.fq.controller;

import com.fq.bean.Department;
import com.fq.bean.Msg;
import com.fq.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 部门处理器
 */

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    /**
     *查询所有部门信息返回给下拉框
     * @return
     */
    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        //查询所有部门
        List<Department> depts = departmentService.getDepts();

        return Msg.success().add("depts",depts);
    }
}
