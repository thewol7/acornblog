package com.acorn.blog.users.dto;

public class UsersDto {
	private int user_id;
	private String id;
	private String pwd;
	private String name;
	private String gender;
	private String phone;
	private String email;
	private String create_date;
	private int today;
	private String profile_img;
	private String profile_cmt;

	public UsersDto() {
	}

	public UsersDto(int user_id, String id, String pwd, String name, String gender, String phone, String email,
			String create_date, int today, String profile_img, String profile_cmt) {
		super();
		this.user_id = user_id;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.create_date = create_date;
		this.today = today;
		this.profile_img = profile_img;
		this.profile_cmt = profile_cmt;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	public int getToday() {
		return today;
	}

	public void setToday(int today) {
		this.today = today;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public String getProfile_cmt() {
		return profile_cmt;
	}

	public void setProfile_cmt(String profile_cmt) {
		this.profile_cmt = profile_cmt;
	}
	
	
}
