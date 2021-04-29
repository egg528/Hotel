package com.khotel.ServiceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.khotel.Controller.HomeController;
import com.khotel.Dao.ReservationDao;
import com.khotel.Service.ReservationService;
import com.khotel.Vo.ReservationVo;

@Service("reservationService")
public class ReservationServiceImpl implements ReservationService{
	private final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource(name="reservationDao")
	ReservationDao reservationDao;

	@Override
	public ReservationVo selectReservation(ReservationVo reservationVo) throws Exception {
		return reservationDao.selectReservation(reservationVo);
	}

	@Override
	public void insertReservation(ReservationVo reservationVo) throws Exception {
		reservationDao.insertReservation(reservationVo);
		
	}

	@Override
	public void updateReservation(ReservationVo reservationVo) throws Exception {
		reservationDao.updateReservation(reservationVo);
		
	}

	@Override
	public void deleteReservation(ReservationVo reservationVo) throws Exception {
		reservationDao.deleteReservation(reservationVo);
		
	}

	@Override
	public List<ReservationVo> selectReservationList(ReservationVo reservationVo) throws Exception {
		return reservationDao.selectReservationList(reservationVo);
	}

	@Override
	public List<ReservationVo> listReservation(int start, int end, String search_option, String keyword) throws Exception {
		return reservationDao.listReservation(start,  end,  search_option,  keyword);
	}

	@Override
	public int countReservation() {

		return reservationDao.countReservation();
	}
}
