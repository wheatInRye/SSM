package com.fq.service;

import com.fq.bean.Department;
import com.fq.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 部门业务逻辑
 */
@Service
public class DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    //查询所有部门
    public List<Department> getDepts(){

        return departmentMapper.selectByExample(null);
    }
}
