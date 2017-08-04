package com.acorn.blog.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.acorn.blog.board.dao.PriBoardDao;

@Controller
public class PriBoardController {

	@Autowired
	private PriBoardDao priboardDao;
}
