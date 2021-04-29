package com.khotel.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.khotel.Service.MemberService;
import com.khotel.Service.QnaService;
import com.khotel.Service.ReservationService;
import com.khotel.ServiceImpl.Pager;
import com.khotel.Vo.MemberVo;
import com.khotel.Vo.QnaVo;
import com.khotel.Vo.ReservationVo;
import com.khotel.Vo.RoomVo;

@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private MemberService memberService;
	
	@Inject
	QnaService qnaService;
	
	@RequestMapping(value = "/mypage/memberinfo")
	public String mypage(Locale locale, Model model, HttpServletRequest request) {
		MemberVo member = new MemberVo();
		HttpSession session = request.getSession();
		member = (MemberVo) session.getAttribute("member");
		
		model.addAttribute("user", member);
		return "/mypage/memberinfo";
	}
	
	@RequestMapping(value = "/mypage/memberDelete")
	public String memberDelete(Locale locale, Model model, HttpServletRequest request) throws Exception {
		MemberVo member = new MemberVo();
		HttpSession session = request.getSession();
		member = (MemberVo) session.getAttribute("member");
		memberService.deleteMember(member);
		session.invalidate();
		return "/mypage/memberinfo";
	}
	
	@RequestMapping(value = "/mypage/reservation")
	public String reservation(Locale locale, Model model, HttpServletRequest request) throws Exception{
		MemberVo member = new MemberVo();
		HttpSession session = request.getSession();
		member = (MemberVo) session.getAttribute("member");
		if(member == null) return "/mypage/reservation";
		String UserId = member.getUserId();
		
		ReservationVo reservation = new ReservationVo();
		reservation.setUserId(UserId);
		List<ReservationVo> reservationList = null;
		ReservationVo reservationVo = new ReservationVo();
		
		reservationList = reservationService.selectReservationList(reservation);
		model.addAttribute("reservation", reservationList);
		System.out.println("reservation: "+ reservationList);
		return "/mypage/reservation";
	}
	
	@RequestMapping(value = "/mypage/mylist")
	public ModelAndView mylist(
			@RequestParam(defaultValue="1") int curPage,
			HttpServletRequest request
			) throws Exception {
		MemberVo vo = new MemberVo();
		HttpSession session = request.getSession();
		vo = (MemberVo) session.getAttribute("member");
		String UserId = vo.getUserId();
		
		int count = 1;
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<QnaVo> list = qnaService.listSome(start, end, UserId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/myQnaList");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		mav.addObject("map", map);
		return mav;
	
	}
	
	@RequestMapping(value="/mypage/myreward", method = RequestMethod.GET)
	public String myreward(Locale locale, Model model) {
		return "/mypage/myreward";
	}
}
