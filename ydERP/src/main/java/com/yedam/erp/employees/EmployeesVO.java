package com.yedam.erp.employees;

public class EmployeesVO {
	private String id;
	private String name;
	private String gender;
	private String birthday;
	private String phone;
	private String grade;
	private String hireDate;
	private String workDay;
	private String salary;
	private String hireStatus;
	private String job;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getHireDate() {
		return hireDate;
	}

	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}

	public String getWorkDay() {
		return workDay;
	}

	public void setWorkDay(String workDay) {
		this.workDay = workDay;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getHireStatus() {
		return hireStatus;
	}

	public void setHireStatus(String hireStatus) {
		this.hireStatus = hireStatus;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	@Override
	public String toString() {
		return "EmployeesVO [id=" + id + ", name=" + name + ", gender=" + gender + ", birthday=" + birthday + ", phone="
				+ phone + ", grade=" + grade + ", hireDate=" + hireDate + ", workDay=" + workDay + ", salary=" + salary
				+ ", hireStatus=" + hireStatus + ", job=" + job + "]";
	}

}