package com.khotel.Controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khotel.Service.MemberService;
import com.khotel.Util.BoardPaging;
import com.khotel.Vo.MemberVo;
import com.khotel.Vo.ReservationVo;
import com.khotel.Vo.RoomVo;
import com.khotel.Service.RoomService;
import com.khotel.Service.ReservationService;

import org.springframework.ui.Model;

import com.khotel.Util.DateData;
/**
 * Handles requests for the application home page.
 */
@Controller
public class RoomController {
	
	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
	

	@RequestMapping(value = "/room_main.do", method = RequestMethod.GET)
	   public String room_main(Locale locale, Model model) {
	      logger.info("Welcome home! The client locale is {}.", locale);
	
	      Date date = new Date();
	      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	
	      String formattedDate = dateFormat.format(date);
	
	      model.addAttribute("serverTime", formattedDate );
	
	      return "/room/room_main";
	   }
	
	@RequestMapping(value = "/room_standard.do", method = RequestMethod.GET)
	   public String room_standard(Locale locale, Model model) {
	      logger.info("Welcome home! The client locale is {}.", locale);
	
	      Date date = new Date();
	      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	
	      String formattedDate = dateFormat.format(date);
	
	      model.addAttribute("serverTime", formattedDate );
	
	      return "/room/standard_room";
	   }

	@RequestMapping(value = "/room_deluxe.do", method = RequestMethod.GET)
	public String room_deluxe(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );

		return "/room/deluxe_room";
	}

	@RequestMapping(value = "/room_executive.do", method = RequestMethod.GET)
	public String room_executive(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );

		return "/room/executive_room";
	}

	@RequestMapping(value = "/room_suite.do", method = RequestMethod.GET)
	public String room_suite(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );

		return "/room/suite_room";
	}

	
}