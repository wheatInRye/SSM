package com.fq.controller;

import com.fq.bean.Employee;
import com.fq.bean.Msg;
import com.fq.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.*;

/**
 * 处理员工CRUD请求
 * @author 冯庆
 */
@Controller
public class EmployeeController {

     @Autowired
     private EmployeeService employeeService;

    /**
     * 使用Json以字符串形式返回数据,以实现客户端跨平台
     */
    @RequestMapping(value = "/emps", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmpsByJson(@RequestParam(value = "pn",defaultValue = "1") Integer pn, @RequestParam(value = "pageShowNum",defaultValue = "7") Integer pageShowNum ,Model model){
        //引入pagehelper插件进行分页查询
        PageHelper.startPage(pn, pageShowNum);

        //查询所有员工
        List<Employee> emps = employeeService.getAll();

        //将查询结果封装到pageInfo
        PageInfo page = new PageInfo(emps, 5);
        return Msg.success().add("pageInfo", page);
    }


    /**
     * 查询员工是否存在
     */
    @RequestMapping(value = "/checkUser", method = RequestMethod.GET)
    @ResponseBody
    public Msg checlUser(@RequestParam("empName") String empName){
        //查询数据库是否重名
        int count = employeeService.getEmployeeCount(empName);

        if(count != 0){
            return Msg.fail();
        }
        return Msg.success();
    }


    /**
     * 保存员工
     */
    @RequestMapping(value = "/emps", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmps(@Valid Employee employee, BindingResult result){
        System.out.println(employee.getEmpName()+"========================");
        Map<String,Object> map = new HashMap<>();
        List<FieldError> fieldErrors = result.getFieldErrors();
        //如果校验出问题
        if(result.hasErrors()){
            //遍历
            for (FieldError fieldError: fieldErrors){
                //封装到Map
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
                System.out.println(fieldError.getField()+"          "+fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errors",map);
        }
        //没错就保存
        employeeService.savaEmps(employee);
        return Msg.success();
    }


    /**
     *查询一位员工的信息
     */
    @RequestMapping(value = "/selectEmp", method = RequestMethod.GET)
    @ResponseBody
    public Msg selectEmp(@RequestParam("empId") Integer empId){
        Employee employee = employeeService.selectEmpWithDept(empId);
        return Msg.success().add("employee", employee);
    }


    /**
     *修改员工的信息
     */
    @RequestMapping(value = "/emps", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(Employee employee, @RequestParam("empId") Integer empId){

        System.out.println(employee);
        int i = employeeService.updateEmp(employee);
        if(i == 0){
            return Msg.fail();
        }
        return Msg.success();
    }


    /**
     * 删除一个员工或者批量删除
     */
    @RequestMapping(value = "/emps", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmp(@RequestParam("empId") String str){
        //解析string
        String[] split = str.split("-");
        List<Integer> list = new ArrayList<>();
        for (String s : split){
            list.add(Integer.parseInt(s));
        }
        employeeService.deleteBacth(list);

        return Msg.success();
    }

}
