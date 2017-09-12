package com.acorn.blog.others.dto;

public class othersDto {
	private String user_id, name, email, phone, gender;
	
	public othersDto(){}

	public othersDto(String user_id, String name, String email, String phone, String gender) {
		super();
		this.user_id = user_id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	};
	
	
}
