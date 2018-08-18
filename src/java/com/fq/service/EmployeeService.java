package com.fq.service;

import com.fq.bean.Employee;
import com.fq.bean.EmployeeExample;
import com.fq.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 业务层
 * @author 冯庆
 */
@Service
public class EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    //查询所有员工
    public List<Employee> getAll(){
        return employeeMapper.selectByExampleWithdDept(null);
    }

    //保存员工
    public void savaEmps(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    //根据id删除员工
    public void deleteEmp(Integer empId) {
        employeeMapper.deleteByPrimaryKey(empId);
    }

    //查询员工是否重名
    public int getEmployeeCount(String empName){
        int  count = employeeMapper.selectCountByName(empName);
        return count;
    }

    //根据id查询员工
    public Employee selectEmpWithDept(Integer empId) {
        Employee employee = employeeMapper.selectByPrimaryKeyWithdDept(empId);
        return employee;
    }

    //根据id修改员工
    public int updateEmp(Employee employee) {
        int i = employeeMapper.updateByPrimaryKeySelective(employee);
        return i;
    }

    public void deleteBacth(List<Integer> list) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpIdIn(list);
        employeeMapper.deleteByExample(employeeExample);
    }
}
