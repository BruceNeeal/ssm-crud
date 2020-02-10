package com.nzy.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nzy.crud.bean.Employee;
import com.nzy.crud.bean.Msg;
import com.nzy.crud.service.EmployeeService;

/**
 * 处理员工CRUD请求
 * 
 * @author YESNHSLY@outlook.com
 *
 */
@Controller
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;
	
	/**
	 * 单个批量二合一
	 * 批量1-2-3
	 * 单个1
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
	public Msg deleteEmp(@PathVariable("ids")String ids) {
		//批量删除
		if(ids.contains("-")) {
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			//组装id的集合
			for(String string : str_ids ) {
				del_ids.add(Integer.parseInt(string));
			}
			employeeService.deleteBatch(del_ids);
		}
		//单个删除
		else{
			Integer id = Integer.parseInt(ids);
			employeeService.deleteEmp(id);
		}
		return Msg.success();
	}
	
	
	/**
	 * 如果直接发送ajax=PUT请求
	 * 员工更新方法
	 * 问题:请求体有数据,但Employee对象封装不上
	 * 原因:tomcat
	 *     1.将请求体中数据,封装一个map
	 *     2.request.getParameter("empName")会从map中取值
	 *     3.SpringMVC封装POJO对象的时候会把POJO每个属性的值
	 *         通过如request.getParameter("email")拿到
	 * ajax发送PUT请求引发的血案:
	 *     PUT请求,请求体中的数据,request.getParameter("empName")拿不到
	 *     Tomcat一看是PUT请求不会封装请求体中的数据为map,只有POST请求才会封装请求体为map
	 *     
	 *     
	 * 要能支持直接发送PUT之类的请求还要封装请求体中的数据
	 * 配置上HttpPutFormContentFilter,将请求体中的数据包装为map
	 * request被重新包装,request.getParameter()被重写,就会从自己封装的map中取数据
	 * @param employee
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	public Msg saveEmp(Employee employee) {
		employeeService.updateEmp(employee);
		return Msg.success();
	}
	
	/**
	 * 根据id查询员工
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id")Integer id) {
		Employee employee=employeeService.getEmp(id);
		return Msg.success().add("emp", employee);
	}
	
	/**
	 * 
	 * 检查用户名是否可用
	 * 
	 * @param empName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkuser(@RequestParam("empName") String empName) {
		// 先判断用户名是否是合法的表达式;
		String regx = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		if (!empName.matches(regx)) {
			return Msg.fail().add("va_msg", "用户名必须是2-5位汉字或者3-16位英文字母或下划线或数字组合");
		}

		// 数据库用户名重复校验
		boolean b = employeeService.checkUser(empName);
		if (b) {
			return Msg.success();
		} else {
			return Msg.fail().add("va_msg", "用户名不可用");
		}
	}

	/**
	 * 员工保存
	 * 1.支持JSR303校验 ,绕过前端校验还能后端进行校验
	 * 2.导入Hibernate-Validator
	 * 
	 * 
	 * @return
	 */
	@RequestMapping(value = "/emp", method = RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee, BindingResult result) {
		if (result.hasErrors()) {
			//校验失败应该返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map=new HashMap<String, Object>();
			List<FieldError> errors = result.getFieldErrors();
			for(FieldError fieldError:errors) {
				System.out.println("错误字段名:"+fieldError.getField());
				System.out.println("错误信息:"+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		} else {
			employeeService.saveEmp(employee);
			return Msg.success();
		}
	}

	// 使用ResponseBody自动将返回对象转换为json字符串
	/**
	 * ResponseBody需要导入jackson包
	 * 
	 * @param pn
	 * @return
	 */
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 5);
		PageHelper.orderBy("emp_id asc");
		// startPage后紧跟查询就是分页查询
		List<Employee> emps = employeeService.getAll();
		// 使用pageInfo包装查询后的结果,只需将pageInfo交给页面就行,封装详细信息包括查询出来的数据,传入连续显示的页数
		PageInfo page = new PageInfo(emps, 5);
		return Msg.success().add("pageInfo", page);
	}

	/**
	 * 查询员工数据(分页)
	 * 
	 * @return
	 */
	// 旧方式返回数据@RequestMapping("/emps")
	public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		// 引入PageHelper分页插件
		// 查询前只需调用,传入页码,以及每页大小
		PageHelper.startPage(pn, 5);
		// startPage后紧跟查询就是分页查询
		List<Employee> emps = employeeService.getAll();
		// 使用pageInfo包装查询后的结果,只需将pageInfo交给页面就行,封装详细信息包括查询出来的数据,传入连续显示的页数
		PageInfo page = new PageInfo(emps, 5);
		model.addAttribute("pageInfo", page);
		//转发到list页面
		return "list";
	}
}
