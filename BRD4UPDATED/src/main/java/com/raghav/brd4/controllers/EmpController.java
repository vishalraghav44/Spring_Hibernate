package com.raghav.brd4.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.raghav.brd4.dao.EmpDAO;
import com.raghav.brd4.dto.Count;
import com.raghav.brd4.dto.Department;
import com.raghav.brd4.dto.Employee;

@Controller
public class EmpController {

	@Autowired
	EmpDAO edi;
	Department department = new Department();
	Employee empl = new Employee();
	String dept_id=null;
	String id = null;
	
// function for view
	@RequestMapping("/viewemp/{id}")
	public ModelAndView viewemp(@PathVariable("id") String id) {
		List<Count> list = edi.selectAll();
		this.id = id;
		System.out.println("------I am in View----@Controller");
		if (id.equals("ab"))
		return new ModelAndView("viewemp", "list", list);
		else if (id.equals("cd"))
			return new ModelAndView("viewadmin", "list", list);
		return null;
	}
//function on click
	@RequestMapping("/empdept/{dept_id}")
	public String empByDept(@PathVariable("dept_id") String emp, ModelMap map) {
		map.addAttribute("list", edi.selectAll());
		department.setDept_id(emp);
		map.addAttribute("employee", edi.deptInfo(emp));
		System.out.println("------I am in OnCLick----@Controller");
		if (id.equals("ab"))
		   return "viewemp";
		else if (id.equals("cd"))
			return "viewadmin";
		return null;
	}
	// Function for search
	@RequestMapping("/search")
	public String search(@RequestParam(value = "emp") String emp, ModelMap map) {
		map.addAttribute("list", edi.selectAll());
	String did = department.getDept_id();
		map.addAttribute("employee", edi.searchList(emp, did));
		System.out.println("------I am in Search----@Controller");
		if (id.equals("ab"))
		return "viewemp";
		else if (id.equals("cd"))
			return "viewadmin";
		return null;
	}
	// function for sorting
	@RequestMapping("/sort")
	public String sort(@RequestParam(value = "name") String name,
			@RequestParam(value = "type") String type, ModelMap map) {
		map.addAttribute("list", edi.selectAll());
		String did = department.getDept_id();
		System.out.println("------Sort----@Controller");
		
		map.addAttribute("employee", edi.sort(name, type, did));
		if (id.equals("ab"))
		return "viewemp";
		else if (id.equals("cd"))
			return "viewadmin";
		return null;
	}
	
	//function for add
	// add
		@RequestMapping("/addemp")
		public String addpage() {
			
			return "add";
		}

		@RequestMapping(value = "/add")
		public ModelAndView addemp(@ModelAttribute(value="command") Employee employee) 
		{
			edi.addEmp(employee);
			List<Count> list = edi.selectAll();
			this.id = id;
			System.out.println(id);
			return new ModelAndView("viewadmin", "list", list);
				}

	// function for delete
	@RequestMapping("/delete/{emp_id}")
	public ModelAndView deleteEmployee(@PathVariable("emp_id") String employeeId)
	{
				
		
		edi.deleteEmp(employeeId);
		List<Count> list = edi.selectAll();
		System.out.println("-------------delete------@controller");
		return new ModelAndView("viewadmin", "list", list);
		
	}
    // function for edit
	
	@RequestMapping("/edit/{emp_id}")
	public ModelAndView editEmployee(@PathVariable("emp_id") String emp_id,
			   @ModelAttribute Employee employee) {
		employee = edi.getOneRecord(emp_id);
		System.out.println("-------------edit------"+employee);
		return new ModelAndView("Edit", "employee", employee);

	}

	@RequestMapping("/update")
	public String updateUser(@ModelAttribute Employee employee, ModelMap map) {
		edi.updateRow(employee);
		map.addAttribute("list", edi.selectAll());
		map.addAttribute("employee", edi.deptInfo(dept_id));
		System.out.println("-------------update------"+employee);
		if (id.equals("ab"))
			return "viewemp";
		else if (id.equals("cd"))
			return "viewadmin";
		return null;
	}

	
	// ------spring security--------
		@RequestMapping(value = { "/", "/index", "/hello", "/back"  }, method = RequestMethod.GET)
		public ModelAndView defaultPage() {
			
			ModelAndView model = new ModelAndView();
			model.addObject("title",
					"Spring Security Login Form - Database Authentication");
			model.addObject("message", "This is default page!");
			model.setViewName("hello");
			return model;

		}
		//---------Back Buttons---------

		@RequestMapping(value = "/viewadmin", method = RequestMethod.GET)
		public ModelAndView adminPage() {

			ModelAndView model = new ModelAndView();
			model.addObject("title",
					"Login Form -Spring Security Database Authentication");
			model.addObject("message", "This page is for ROLE_ADMIN only!");
			model.setViewName("admin");
			return model;
		}
		
		

		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public ModelAndView login(
				@RequestParam(value = "error", required = false) String error,
				@RequestParam(value = "logout", required = false) String logout) {

			ModelAndView model = new ModelAndView();
			if (error != null) {
				model.addObject("error", "Invalid username and password.....!");
			}

			if (logout != null) {
				model.addObject("msg", "You've been logged out successfully....!");
			}
			model.setViewName("login");

			return model;

		}

		// for 403 access denied page
		@RequestMapping(value = "/403", method = RequestMethod.GET)
		public ModelAndView accesssDenied() {

			ModelAndView model = new ModelAndView();

			// check if user is login
			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			if (!(auth instanceof AnonymousAuthenticationToken)) {
				UserDetails userDetail = (UserDetails) auth.getPrincipal();
				System.out.println(userDetail);

				model.addObject("username", userDetail.getUsername());

			}

			model.setViewName("403");
			return model;
		}

	
}