package com.ict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ict.db.DAO;

@RestController
public class MyAjaxController {
	@Autowired
	private DAO dao;
	
	@RequestMapping(value = "chk_del.do",produces = "text/html; charset=utf-8")
	@ResponseBody
	public String chkdelCommand(String[] chk_id) {
		int result = 0;
		for (String k : chk_id) {
			result += dao.getDelete(k);
		}
		return String.valueOf(result);
	}
}
