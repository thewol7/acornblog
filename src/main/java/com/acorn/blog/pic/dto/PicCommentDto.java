package com.acorn.blog.pic.dto;

public class PicCommentDto {
	private int num;
	private int user_id;
	private String writer;
	private String content;
	private int ref_group;
	private String name;
	private int comment_group;
	private String regdate;
	
	public PicCommentDto(){}

	public PicCommentDto(int num, int user_id, String writer, String content, int ref_group, String name,
			int comment_group, String regdate) {
		super();
		this.num = num;
		this.user_id = user_id;
		this.writer = writer;
		this.content = content;
		this.ref_group = ref_group;
		this.name = name;
		this.comment_group = comment_group;
		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRef_group() {
		return ref_group;
	}

	public void setRef_group(int ref_group) {
		this.ref_group = ref_group;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getComment_group() {
		return comment_group;
	}

	public void setComment_group(int comment_group) {
		this.comment_group = comment_group;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	};
	
}
