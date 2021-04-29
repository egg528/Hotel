package com.khotel.Controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khotel.Service.MemberService;
import com.khotel.Service.StaffService;
import com.khotel.Vo.MemberVo;
import com.khotel.Vo.StaffVo;

@Controller
public class StaffController {
	private static final Logger logger = LoggerFactory.getLogger(StaffController.class);
	
	@Autowired
	private StaffService staffService;
	
	//관리자 페이지 직원 리스트
	
		
}
