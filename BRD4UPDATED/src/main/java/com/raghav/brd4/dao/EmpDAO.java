package com.raghav.brd4.dao;

import java.util.List;

import com.raghav.brd4.dto.Count;
import com.raghav.brd4.dto.Employee;

public interface EmpDAO {

	public List<Count> selectAll();

	public List<Employee> deptInfo(String dept_id);

	public List<Employee> searchList(String emp_name, String did);

	public List<Employee> sort(String name, String type, String did);

	public void deleteEmp(String employeeId);

	public void addEmp(Employee employee);

	public List<Employee> setData(String id);

	public Employee getOneRecord(String emp_id);

	public String updateRow(Employee employee);
}
