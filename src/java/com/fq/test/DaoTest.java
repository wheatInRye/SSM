package com.fq.test;

import com.fq.bean.Employee;
import com.fq.dao.DepartmentMapper;
import com.fq.dao.EmployeeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


/**
 * 使用spring test进行
 * dao测试
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class DaoTest {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Autowired
    private EmployeeMapper employeeMapper;

    @Test
    public void testGet(){
        List<Employee> employees = employeeMapper.selectByExampleWithdDept(null);
        for (Employee e:employees){
            System.out.println(e.getEmpName());
        }
    }

    @Test
    public void testCRud(){
        System.out.println(departmentMapper);

//        departmentMapper.insertSelective(new Department(null, "开发部"));
//        departmentMapper.insertSelective(new Department(null, "测试部"));


//         employeeMapper.insertSelective(new Employee(null, "jerry1", "男", "jerry1@email.com",1));
//         employeeMapper.insertSelective(new Employee(null, "Tom1", "男", "tom1@email.com",2));

        for (int i = 0; i < 100; i++) {
            employeeMapper.insertSelective(new Employee(null, "jerry "+i, "男", "jerry1@email.com",1));

        }
    }
}
