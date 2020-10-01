package com.yedam.erp.GPS;

public class GpsVO {
	private String employee_id;
	private String location_x;
	private String location_y;
	private String location_date;
	private String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	public String getLocation_x() {
		return location_x;
	}
	public void setLocation_x(String location_x) {
		this.location_x = location_x;
	}
	public String getLocation_y() {
		return location_y;
	}
	public void setLocation_y(String location_y) {
		this.location_y = location_y;
	}
	public String getLocation_date() {
		return location_date;
	}
	public void setLocation_date(String location_date) {
		this.location_date = location_date;
	}
	@Override
	public String toString() {
		return "GpsVO [employee_id=" + employee_id + ", location_x=" + location_x + ", location_y=" + location_y
				+ ", location_date=" + location_date + "]";
	}	
	
}
