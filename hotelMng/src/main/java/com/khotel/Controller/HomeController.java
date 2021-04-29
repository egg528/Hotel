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
import org.springframework.web.servlet.ModelAndView;

import com.khotel.Service.MemberService;
import com.khotel.Service.QnaService;
import com.khotel.Util.BoardPaging;
import com.khotel.Vo.MemberVo;
import com.khotel.Vo.ReservationVo;
import com.khotel.Vo.RoomVo;
import com.khotel.Vo.StaffVo;
import com.khotel.Vo.TabletVo;
import com.khotel.Service.RoomService;
import com.khotel.Service.StaffService;
import com.khotel.Service.TabletService;
import com.khotel.ServiceImpl.Pager;
import com.khotel.Service.ReservationService;

import org.springframework.ui.Model;

import com.khotel.Util.DateData;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private StaffService staffService;
	
	@Autowired
	private TabletService tabletService;
	
	@Autowired 
	private BoardPaging boardPaging;
	
	@Autowired
	private QnaService qnaService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/main";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/login/login";
	}	
	
	//로그아웃 처리
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(Locale locale, Model model, HttpServletRequest request) {
		
		Map map = new HashMap();
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "/main";
	}
	
	//로그인에 아이디, 비밀번호를 받아서 로그인 처리하는 페이지
	@RequestMapping(value = "/memeber/loginAction.do") 
	public @ResponseBody Map join(MemberVo loginMember, HttpServletRequest request) throws Exception {
		
		MemberVo selectMemberVo = new MemberVo();
		Map map = new HashMap();
		
		HttpSession session = request.getSession();
		System.out.println(loginMember.getUserId());
		
		//loginMember에 아이디, 비밀번호 정보가 있고 db에서 그 정보에 해당하는 member를 찾아 selectMemberVo에 대입
		selectMemberVo = memberService.selectMember(loginMember);
		if(selectMemberVo == null) {
			map.put("resultMsg", "IDfail");
		}
		else if(!selectMemberVo.getUserPassword().equals(loginMember.getUserPassword())){
			map.put("resultMsg", "Passwordfail");
		}
		else if(selectMemberVo.getUserPassword().equals(loginMember.getUserPassword())){
			if(selectMemberVo.getUserLevel().equals("2")) {
				map.put("resultMsg", "Manager");
			} else if(selectMemberVo.getUserLevel().equals("3")) {
				String staff = selectMemberVo.getUserId();
				map.put("resultMsg", staff);
			} else {
				map.put("resultMsg", "Success");
			}
			session.setAttribute("member", selectMemberVo);

		}else {
			map.put("resultMsg", "fail");
		}
		System.out.println(map);
		return map;
	}
	

	//회원가입으로 넘겨주는 페이지
	@RequestMapping(value = "/memeber/regist.do", method = RequestMethod.GET)
	public String signup(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/login/register";
	}	
	
	//회원가입 처리하는 페이지
	@RequestMapping(value = "/memeber/registAction.do") 
	public @ResponseBody Map regist(MemberVo registMember, HttpServletRequest request) throws Exception {
		Map map = new HashMap();
		MemberVo selectMemberVo = new MemberVo();
		
		selectMemberVo = memberService.selectMember(registMember);
		if(selectMemberVo != null) {
			map.put("resultMsg", "IDDup");
		} else {		
			memberService.insertMember(registMember);
			map.put("resultMsg", "success");
		}
		return map;
	}
	
	//아이디 중복 체크
	@RequestMapping(value = "/memeber/idcheck.do") 
	public @ResponseBody Map check(MemberVo registMember, HttpServletRequest request) throws Exception {
		Map map = new HashMap();
		MemberVo selectMemberVo = new MemberVo();
		
		selectMemberVo = memberService.selectMember(registMember);
		if(selectMemberVo != null) {
			map.put("resultMsg", "fail");
		} else {
			map.put("resultMsg", "success");
		}
		return map;
	}
	
	
	@RequestMapping(value="/admin/qnaview.do", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int QNACODE,
			@RequestParam int curPage,
			HttpSession session) throws Exception{

		qnaService.increaseViewcnt(QNACODE);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/qnaview");
		mav.addObject("dto", qnaService.read(QNACODE));
		mav.addObject("curpage", curPage);
		return mav;

	}

	@RequestMapping(value="/admin/delete.do", method=RequestMethod.GET)
	public String updat(
			@RequestParam int QNACODE) throws Exception{
		qnaService.delete(QNACODE);
		return "redirect:/admin/qnaList";
	}
	
	
	//관리자 페이지 회원 리스트
	@RequestMapping(value = "/admin/memberList")
	public ModelAndView memberList(
			@RequestParam(defaultValue="1") int curPage,
			Locale locale, Model model, HttpServletRequest request) throws Exception {
		
		int count = memberService.selectBoardCount();
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<MemberVo> list = null;
		Map<String, Object> map = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/memberList");
		
		//회원 가져오기 - check
		try {
			list = memberService.listMember(start, end, "", "");
			map.put("list", list);
			map.put("count", count);
			map.put("pager", pager);
		} catch (Exception e) {
			
		}
		mav.addObject("list", list);
		mav.addObject("pager", pager);
		mav.addObject("count", count);
		return mav;
	}
	
	//관리자 페이지 객실 예약
	@RequestMapping(value = "/admin/reservationList")
	public ModelAndView reservationList(
			@RequestParam(defaultValue="1") int curPage,
			Locale locale, Model model, HttpServletRequest request) throws Exception {
		int count = reservationService.countReservation();
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<ReservationVo> list = null;
		Map<String, Object> map = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/reservationList");
		
		//�삁�빟 由ъ뒪�듃 媛��졇�삤湲�
		try {
			list = reservationService.listReservation(start, end, "", "");
			map.put("list", list);
			map.put("count", count);
			map.put("pager", pager);
		} catch (Exception e) {
			
		}
		mav.addObject("list", list);
		mav.addObject("pager", pager);
		mav.addObject("count", count);
		return mav;
	}
	
	/*
	 * //관리자 페이지
	 * 
	 * @RequestMapping(value = "/admin/roomList") public ModelAndView roomList(
	 * 
	 * @RequestParam("roomtype") String room,
	 * 
	 * @RequestParam(defaultValue="1") int curPage, Locale locale, Model model,
	 * HttpServletRequest request) throws Exception { int count = 100; Pager pager =
	 * new Pager(count, curPage); int start = pager.getPageBegin(); int end =
	 * pager.getPageEnd(); List<RoomVo> list = null; Map<String, Object> map = new
	 * HashMap<String, Object>(); ModelAndView mav = new ModelAndView();
	 * mav.setViewName("admin/roomList"); list = roomService.listclassRoom(room);
	 * //�쉶�썝 媛��졇�삤湲� - check try { list = roomService.listclassRoom(room);
	 * System.out.println(list); map.put("list", list); map.put("count", count);
	 * map.put("pager", pager); } catch (Exception e) {
	 * 
	 * } mav.addObject("list", list); mav.addObject("pager", pager);
	 * mav.addObject("count", count); return mav; }
	 */
	
	@RequestMapping(value = "/admin/roomList")
	public String roomList(Locale locale, Model model, HttpServletRequest request) throws Exception {
		List<RoomVo> roomList = null;
		
		//회원 가져오기 - check
		try {
			roomList = roomService.listRoom2();
		} catch (Exception e) {
			
		}
		System.out.println(roomList);
		model.addAttribute("roomList", roomList);
		return "admin/roomList";
	}
	
	@RequestMapping(value = "/admin")
	public String admin(Locale locale, Model model, HttpServletRequest request) throws Exception {
		return "/admin/admin";
	}

	//달력에 예약 현황 표시
	@RequestMapping(value = "/admin/reservation.do", method = RequestMethod.GET)
	public String reservation(Model model, HttpServletRequest request, DateData dateData){
		
		HttpSession session = request.getSession();
		
		Object member = new MemberVo();
		member = session.getAttribute("member");
		String roomNo = request.getParameter("rno");
		String resdate = request.getParameter("resdate");
		
		System.out.println("roomNo :"+roomNo);
		System.out.println("member :"+member);
		System.out.println("resdate :" + resdate);
		
		List<RoomVo> reservationList = null;
		try {
			reservationList = roomService.listRoomReservation(roomNo);
		} catch (Exception e) {
			
		}
		System.out.println("reservationList: " + reservationList);
		
		
		
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		//검색 날짜
		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
		//검색 날짜 end

		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DateData(null, null, null, null);
			dateList.add(calendarData);
		}
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
			}else{
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
		}

		//달력 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			
			for (int i = 0; i < index; i++) {
				calendarData= new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		System.out.println(dateList);
		
		//배열에 담음
		model.addAttribute("dateList", dateList);		//날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		model.addAttribute("roomNo", roomNo);
		model.addAttribute("reservationList", reservationList);
		return "/admin/reservation";
	}
	
/*
	//예약이 가능한 방인지 확인
	@RequestMapping(value = "/admin/reservationCheck.do") 
	public @ResponseBody Map reservation(@RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception {
		HashMap<String, Object> roomMap = new HashMap();
		
		MemberVo member = new MemberVo();
		HttpSession session = request.getSession();
		member = (MemberVo) session.getAttribute("member");
		String UserId = member.getUserId();
		String roomNo = map.get("roomNo").toString();
		String resdate = map.get("resdate").toString();
		roomMap.put("roomNo", roomNo);
		roomMap.put("resdate", resdate);
		roomMap.put("UserID", UserId);
		
		int resCnt = roomService.findRoomReservation(roomMap);
		
		System.out.println("resCnt :"+resCnt);
		Map resultMap = new HashMap();
		resultMap.put("resultMsg", resCnt);
		
		return resultMap;
	}

	
	//예약화면에서 예약이 가능한지 확인
		@RequestMapping(value = "/admin/datecheck.do") 
		public @ResponseBody Map datecheck(@RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception {
			HashMap<String, Object> roomMap = new HashMap();
			
			ReservationVo reservation = new ReservationVo();
			HttpSession session = request.getSession();
			
			String checkIn = map.get("ReservationCheckIn").toString();
			String checkOut = map.get("ReservationCheckOut").toString();
			String roomNo = map.get("roomNo").toString();
			
			roomMap.put("ReservationCheckIn", checkIn);
			roomMap.put("ReservationCheckOut", checkOut);
			roomMap.put("roomNo", roomNo);
			
			int resCnt = roomService.findRoom(roomMap);
			
			Map resultmap = new HashMap();
			if(resCnt == 0) {
				reservationService.insertReservation(reservation);
				resultmap.put("resultMsg", "success");
			} else {
				resultmap.put("resultMsg", "fail");
			}
			
			return resultmap;
		}
*/	
	
	
	//예약페이지
	@RequestMapping(value = "/admin/reservate.do", method = RequestMethod.GET)
	public String reservate(Model model, HttpServletRequest request) throws Exception {
		MemberVo member = new MemberVo();
		RoomVo room = new RoomVo();
		RoomVo roomVo = new RoomVo();
		HttpSession session = request.getSession();
		member = (MemberVo) session.getAttribute("member");
		
		String UserName = member.getUserName();
		String UserId = member.getUserId();
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		String resdate = request.getParameter("resdate");
		room.setRoomNo(roomNo);
		roomVo = roomService.selectRoom(room);
		System.out.println("roomNo:" + roomNo);
		System.out.println("resdate:" + resdate);
		System.out.println("room" + roomVo);
		model.addAttribute("roomNo", roomNo);
		model.addAttribute("resdate", resdate);
		model.addAttribute("member", member);
		model.addAttribute("room", roomVo);
		return "/admin/reservation2";
	}

	//예약페이지
	@RequestMapping(value = "/admin/reservateAction.do")
	public @ResponseBody Map reservateAction(ReservationVo reservation, HttpServletRequest request) throws Exception {
		HashMap<String, Object> roomMap = new HashMap();
		MemberVo member = new MemberVo();
		HttpSession session = request.getSession();
		member = (MemberVo) session.getAttribute("member");
		
		String checkIn = reservation.getReservationCheckIn();
		String checkOut = reservation.getReservationCheckOut();
		String roomNo = Integer.toString(reservation.getRoomCode());
		
		String mile = reservation.getMileage();
		String originmile = member.getUserMile();
		int totalmile = Integer.parseInt(mile) + Integer.parseInt(originmile);
		
		String grade = "";
		if(totalmile == 0) {
			grade = "NEW";
		} else if(totalmile < 10000) {
			grade = "SILVER";
		} else if(totalmile < 30000) {
			grade = "GOLD";
		} else if(totalmile < 60000) {
			grade = "PLATINUM";
		} else if(totalmile < 100000) {
			grade = "DIAMOND";
		} else if(totalmile < 150000) {
			grade = "VIP";
		} else {
			grade = "VVIP";
		}
		System.out.println("mile: " + Integer.toString(totalmile));
		System.out.println("getReservationCheckIn: " + reservation.getReservationCheckIn());
		System.out.println("getReservationCheckOut: " + reservation.getReservationCheckOut());
		System.out.println("getReservationPeopleNumber: " + reservation.getReservationPeopleNumber());
		System.out.println("getReservationDays: " + reservation.getReservationDays());
		System.out.println("getReservationMemo: " + reservation.getReservationMemo());
		System.out.println("getUserId: " + reservation.getUserId());
		System.out.println("getRoomCode: " + reservation.getRoomCode());
		System.out.println("getReservationDays: " + reservation.getReservationDays());
		System.out.println("getBreakfast: " + reservation.getBreakfast());
		System.out.println("getTotalPrice: " + reservation.getTotalPrice());
		System.out.println("getMileage: " + reservation.getMileage());
		System.out.println("getCard: " + reservation.getCard());
		System.out.println("getCardNum: " + reservation.getCardNum());
		System.out.println("getCardValid: " + reservation.getCardValid());
		System.out.println("getRoomType: " + reservation.getRoomType());

		roomMap.put("ReservationCheckIn", checkIn);
		roomMap.put("ReservationCheckOut", checkOut);
		roomMap.put("roomNo", roomNo);
		
		int resCnt = roomService.findRoom(roomMap);
		
		Map resultmap = new HashMap();
		if(resCnt == 0) {
			member.setUserMile(Integer.toString(totalmile));
			member.setUserGrade(grade);
			memberService.updateMile(member);
			memberService.updateGrade(member);
			reservationService.insertReservation(reservation);
			resultmap.put("resultMsg", "success");
		} else {
			resultmap.put("resultMsg", "fail");
		}
		
		return resultmap;
	}
	
	//예약 상세 페이지
	@RequestMapping(value = "/admin/reservationDetailAction.do", method = RequestMethod.GET) 
	public String reservationDetailAction(Model model, HttpServletRequest request) throws Exception { 
		ReservationVo reservation = new ReservationVo();
		ReservationVo resultVo = new ReservationVo();
		
		String ReservationCode = request.getParameter("reservationCode");
		
		reservation.setReservationCode(ReservationCode);
		resultVo = reservationService.selectReservation(reservation);
		
		System.out.println("result: " + resultVo);
		
		model.addAttribute("reservationVo", resultVo);
		
		return "/admin/reservationDetail"; 
	}
	
	@RequestMapping(value = "/admin/reservationDelete.do")
	public @ResponseBody Map resDelete(Model model, HttpServletRequest request) throws Exception {
		Map map = new HashMap();
		ReservationVo reservation = new ReservationVo();
		ReservationVo resultVo = new ReservationVo();
		
		String ReservationCode = request.getParameter("rcode");
		reservation.setReservationCode(ReservationCode);
		resultVo = reservationService.selectReservation(reservation);
		
		MemberVo member = new MemberVo();
		HttpSession session = request.getSession();
		member = (MemberVo) session.getAttribute("member");
		
		String mile = resultVo.getMileage();
		String originmile = member.getUserMile();
		int totalmile = Integer.parseInt(originmile) -  Integer.parseInt(mile); 

		System.out.println("mile: " + Integer.toString(totalmile));
		
		member.setUserMile(Integer.toString(totalmile));
		memberService.updateMile(member);
		reservationService.deleteReservation(reservation);
		map.put("resultMsg", "Success");
		return map;
	}

	@RequestMapping(value = "/admin/memberDelete")
	public String memberDelete(Model model, HttpServletRequest request) throws Exception {
		MemberVo member = new MemberVo();
		String userId = request.getParameter("userId");
		member.setUserId(userId);
		memberService.deleteMember(member);
		return "/admin/memberList";
	}
		
	//관리자 페이지에서 member에서 update버튼을 누르면 memberlevel을 바꿔줌
	@RequestMapping(value = "/admin/levelAction.do")
	public @ResponseBody Map level(MemberVo updateMember, HttpServletRequest request) throws Exception {
		Map map = new HashMap();
		memberService.updateLevel(updateMember);
		map.put("resultMsg", "Success");
		return map;
	}
	
	//관리자 페이지에서 member에서 해당 회원 정보와 예약 정보 가져옴
	@RequestMapping(value = "/admin/memberDetail.do")
	public String memberDetail(Model model, HttpServletRequest request) throws Exception {
		MemberVo member = new MemberVo();
		MemberVo memberDetail = new MemberVo();
		ReservationVo reservation = new ReservationVo();
		List <ReservationVo> resDetail = null;
		String UserId = request.getParameter("userId");
		member.setUserId(UserId);
		reservation.setUserId(UserId);
		
		memberDetail = memberService.selectMember(member);
		resDetail = reservationService.selectReservationList(reservation);
		model.addAttribute("memberDetail", memberDetail);
		model.addAttribute("resDetail", resDetail);
		System.out.println(memberDetail);
		
		return "/admin/memberDetail";
	}
	
	//관리자 페이지에서 객실 정보 가져옴
	@RequestMapping(value = "/admin/roomDetail.do")
	public String roomDetail(Model model, HttpServletRequest request) throws Exception {
		RoomVo room = new RoomVo();
		int roomNo = Integer.parseInt(request.getParameter("rno"));
		room.setRoomNo(roomNo);
		RoomVo roomdetail = new RoomVo();
		roomdetail = roomService.selectRoom(room);
		model.addAttribute("roomDetail", roomdetail);
		
		return "/admin/roomDetail";
	}
	
	//관리자 페이지에서 직원 정보 가져옴
	@RequestMapping(value = "/admin/staffDetail.do")
	public String staffDetail(Model model, HttpServletRequest request) throws Exception {
		StaffVo staff = new StaffVo();
		String id = request.getParameter("staff");
		staff.setStaffId(id);
		StaffVo staffdetail = new StaffVo();
		staffdetail = staffService.selectStaff(staff);
		model.addAttribute("staffDetail", staffdetail);
		
		return "/admin/staffDetail";
	}
	
	//메인화면(홈화면)
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/main";
	}
	
	

	@RequestMapping(value = "/intro.do", method = RequestMethod.GET)
	public String intro(Locale locale, Model model) {
      logger.info("Welcome home! The client locale is {}.", locale);

      Date date = new Date();
      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

      String formattedDate = dateFormat.format(date);

      model.addAttribute("serverTime", formattedDate );

      return "/intro/introduction";
   }


	@RequestMapping(value = "/intro_hotel.do", method = RequestMethod.GET)
	   public String intro_hotel(Locale locale, Model model) {
	      logger.info("Welcome home! The client locale is {}.", locale);
	
	      Date date = new Date();
	      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	
	      String formattedDate = dateFormat.format(date);
	
	      model.addAttribute("serverTime", formattedDate );
	
	      return "/intro/introduction_hotel";
	   }
	
	@RequestMapping(value = "/admin/staffList")
	public String staffList(Locale locale, Model model, HttpServletRequest request) throws Exception {
		List<StaffVo> staffList = null;
		//회원 가져오기
		try {
			staffList = staffService.listStaff();
		} catch (Exception e) {
			
		}
		model.addAttribute("staffList", staffList );
		System.out.println(staffList);
		return "/admin/staffList";
	}
	
	@RequestMapping(value = "/tablet/room101")
	public String tablet(Locale locale, Model model, HttpServletRequest request) throws Exception {
		return "/tablet/tablet";
	}
	
	
	@RequestMapping(value = "/tabletAction", method = RequestMethod.POST)
	public @ResponseBody Map tab(TabletVo usertab, HttpServletRequest request) throws Exception {
		
		tabletService.insertTablet(usertab);

		Map resultmap = new HashMap();
		resultmap.put("resultMsg", "success");
		return resultmap;
	}

	@RequestMapping(value = "/staff01", method = RequestMethod.GET)
	public String staff(Model model, HttpServletRequest request) throws Exception {
		List<TabletVo> tabletList = null;
		tabletList = tabletService.listTablet();
		model.addAttribute("List", tabletList);
		return "/tablet/staffTablet";
	}
	
	@RequestMapping(value = "/staff01/update", method = RequestMethod.POST)
	public @ResponseBody Map update(TabletVo usertab, HttpServletRequest request) throws Exception {
		
		tabletService.updateTablet(usertab);
		Map resultmap = new HashMap();
		resultmap.put("resultMsg", "success");
		return resultmap;
	}
}