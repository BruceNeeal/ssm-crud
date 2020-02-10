package com.nzy.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.nzy.crud.bean.Employee;
import com.nzy.crud.dao.DepartmentMapper;
import com.nzy.crud.dao.EmployeeMapper;

/**
 * @author YESNHSLY@outlook.com 1.导入Spring模块
 *         2.@ContextConfiguration指定Spring配置文件位置 3.直接autowired要使用的组件即可
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	EmployeeMapper employeeMapper;
	@Autowired
	SqlSession sqlSession;
	@Test
	public void testCRUD() {
		System.out.println(departmentMapper);
		// 1.添加部门
		//departmentMapper.insertSelective(new Department(1, "Development Department"));
		//departmentMapper.insertSelective(new Department(2, "Testing Department"));
		
		//2.生成员工数据，测试员工插入
		//employeeMapper.insertSelective(new Employee(null,"Bruce","M","YESNHSLY@outlook.com",1));
		
		//3.批量插入多个员工，使用可以执行批量操作的sqlSession
		EmployeeMapper mapper=sqlSession.getMapper(EmployeeMapper.class);
		for(int i=0;i<100;i++) {
			String uid=UUID.randomUUID().toString().substring(0, 5)+i;
			mapper.insertSelective(new Employee(null,uid,"M",uid+"@qq.com",1));
		}
		System.out.println("批量完成");
	}
}
