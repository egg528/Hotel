package com.khotel.Controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.khotel.Util.DateData;
import com.khotel.Vo.MemberVo;
import com.khotel.Vo.ReservationVo;
import com.khotel.Vo.RoomVo;
import com.khotel.Service.MemberService;
import com.khotel.Service.ReservationService;
import com.khotel.Service.RoomService;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ReservationService reservationService;

	
	@RequestMapping(value = "/reservateAction.do", method = RequestMethod.POST)
	public @ResponseBody Map reservateAction(ReservationVo reservation, HttpServletRequest request) throws Exception {
		HashMap<String, Object> roomMap = new HashMap();
		
		String checkIn = reservation.getReservationCheckIn();
		String checkOut = reservation.getReservationCheckOut();
		String roomNo = Integer.toString(reservation.getRoomCode());
		
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

	@RequestMapping(value = "/reservationCancel", method = RequestMethod.GET)
	public String resDelete(Model model, HttpServletRequest request) throws Exception {
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
		int rno = resultVo.getRoomCode();
		if(mile == null || mile.length() ==0) {
			mile = "0";
		}
		if(originmile == null || originmile.length() ==0) {
			originmile = "0";
		}
		int totalmile = Integer.parseInt(originmile) -  Integer.parseInt(mile); 

		System.out.println("mile: " + Integer.toString(totalmile));
		
		member.setUserMile(Integer.toString(totalmile));
		memberService.updateMile(member);
		reservationService.deleteReservation(reservation);
		return "/main";
	}
	
	
	@RequestMapping(value = "/searchRoom.do")
	public String searchRoom(Locale locale, Model model, HttpServletRequest request) throws Exception {
		List<RoomVo> roomList = null;
		
		//회원 가져오기 - check
		try {
			roomList = roomService.listRoom(0, 100000, "", "");
		} catch (Exception e) {
			
		}
		model.addAttribute("roomList", roomList );
		System.out.println("roomLIst :"+roomList);
		return "/reservation/res";
	}	


	@RequestMapping(value = "/searchRoomAction.do", method = RequestMethod.GET)
	public String searchRoomAction(Model model, HttpServletRequest request) throws Exception {
		List<RoomVo> roomList = null;
		List<RoomVo> roomListCnt = null;
		ReservationVo reservation = new ReservationVo();
		String searchFrom  =  request.getParameter("searchFrom");
		String searchTo = request.getParameter("searchTo");
		String searchRoom = request.getParameter("searchRoom");
		System.out.println(searchFrom);
		System.out.println(searchTo);
		System.out.println(searchRoom);
		reservation.setReservationCheckIn(searchFrom);
		reservation.setReservationCheckOut(searchTo);
		
		try {
			if(searchRoom.equals("all")) {
				roomList = roomService.searchRoomList(reservation);
				roomListCnt = roomService.searchRoomListCnt(reservation);
			}
			else {
				reservation.setRoomType(searchRoom);
				roomList = roomService.searchSelectRoomList(reservation);
				roomListCnt = roomService.searchSelectRoomListCnt(reservation);
			}
		} catch (Exception e) {
			
		}
		System.out.println(roomList);
		System.out.println(roomListCnt);
		model.addAttribute("searchFrom",searchFrom);
		model.addAttribute("searchTo",searchTo);
		model.addAttribute("roomList", roomList );
		model.addAttribute("roomListCnt", roomListCnt );
		return "/reservation/res";
	}
	
	//예약페이지
		@RequestMapping(value = "/reservate.do", method = RequestMethod.GET)
		public String reservate(Model model, HttpServletRequest request) throws Exception {
			MemberVo member = new MemberVo();
			RoomVo room = new RoomVo();
			RoomVo roomVo = new RoomVo();
			HttpSession session = request.getSession();
			member = (MemberVo) session.getAttribute("member");

			int roomNo = Integer.parseInt(request.getParameter("rno"));
			String checkIn = request.getParameter("checkIn");
			String checkOut = request.getParameter("checkOut");
			
			room.setRoomNo(roomNo);
			roomVo = roomService.selectRoom(room);
			
			model.addAttribute("checkOut", checkOut);
			model.addAttribute("checkIn", checkIn);
			model.addAttribute("member", member);
			model.addAttribute("room", roomVo);
			return "/reservation/res2";
		}

}
