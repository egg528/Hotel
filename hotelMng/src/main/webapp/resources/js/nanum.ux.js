$(function(){
	// GNB
	//$(".depth2").hide();
	$(".depth1").on("mouseenter",  function(){
	  gnb("show");	
	}).on("mouseleave", function(){
	  gnb("hide");
	 $(".depth2").hide();
	});
	
	//skip nav
	$(".depth1 a").on('focusin', function (e) {
        gnb("show");
    })
	$(".depth1 li:last-child li:last-child").on('focusout', function(e){
		 gnb("hide");
		 $(".depth2").hide();
		 $('.gnb_arrow').hide();
	});
	
	//GNB arrow
	gnb_arrow();
	
	//LNB
	lnb();

	//메인비주얼
	if($('.main_visual .single-item').size() > 0) {
		$('.main_visual .single-item').slick({
			arrows: true,
			dots: false,
			autoplay: true,
		    autoplaySpeed: 2000,
		});
	}
	//메인배너
	if($('.banner_area .single-item').size() > 0) {
		$('.banner_area .single-item').slick({
			arrows: false,
			dots: true
		});
	}

	//서비스소개 > 씨티카소개 > 에티켓
	tab_menu($(".tab_menu > li > h3"), $(".tab_con"));
	//FAQ
	toggle_menu($('.toggle_menu').find('a'), $(".hide_con"));
	//메인 > 법인등록 팝업
	//popups("company_register");
	//씨티존안내
	custom_combobox($('.btn_srchtype').find('a'), $('.sel_list', $('.btn_srchtype')), '.sel_list');
	//아이디,비밀번호찾기 > 아이디찾기 팝업
	//popups("find_id");
	//아이디,비밀번호찾기 > 비밀번호찾기 팝업
	//popups("find_pw");
	//씨티존 > 씨티존안내 > 나의씨티존추가 팝업
	//popups("mycityzone");
	//예약하기 > 씨티존 상세 팝업
	//popups("cityzone_detail");
	//예약하기 > 이용약관 상세보기 팝업
	//popups("agree");
	///예약하기 > 제2운전자검색 팝업
	//popups("driver");
	//마일리지/쿠폰/선물함 > 쿠폰전환 팝업
	//popups("coupon_change");
	//마일리지/쿠폰/선물함 > 소모예정 마일리지 팝업
	//popups("mileage_extinction");
	//마일리지/쿠폰/선물함 > 마일리지내역확인 팝업
	//popups("mileage_list");
	//마일리지/쿠폰/선물함 > 야심 리프트권 팝업
	//popups("night_discount");
	//마일리지/쿠폰/선물함 > 주간 리프트권 팝업
	//popups("day_discount");
	//마일리지/쿠폰/선물함 > 장비렌탈권 팝업
	//popups("equipment_rentar");
	//마일리지/쿠폰/선물함 > 쿠폰입력 팝업
	//popups("coupon_message");
	//결제정보-준회원 > 법인카드 등록
	//popups("corporate_search");
	//티머니 카드 팝업
	//popups("tmoney");
	//popups("id_check");
		
	//티머니 카드정보 입력 마우스 올릴 시
	tmoneyOver("sel");
	tmoneyOver("num");
	//datepicker
	/*if($( ".datepicker" ).size() > 0 || $( ".datepicker-start" ).size() > 0 || $( ".datepicker-end" ).size() > 0) {
		datepicker();
	}*/
	Site_SizeCheck();
});
$(window).resize(function(){
	Site_SizeCheck();
});
//	퀵메뉴 사이즈 체크
function Site_SizeCheck(){	
	// 퀵메뉴 위치값 + 퀵메뉴 가로사이즈
	var CheckSizeMax = 1425;
	var CheckObj = $(".quick_menu");
	var bodyWidth = parseInt($(window).width());

	// 퀵메뉴 브라우저 크기에 따라서 숨김
	if(bodyWidth >= CheckSizeMax){
		CheckObj.show(); 
	}else
		CheckObj.hide();
}

// tmoney over
function tmoneyOver(popName){
	$(".over-" + popName).on("mouseenter", function(e){ 
		$(".popup-" + popName).stop().fadeIn(100); 
		e.preventDefault();
	}).on('mouseleave', function(e){
		$(".popup-" + popName).stop().fadeOut(100); 
	});

}

// 팝업 function
function popups(address){
	$(".btn_" + address).on("click", function(){
		layer_ajax("../popup/popup_" + address + ".html");
	});
}

function gnb(type){
	var pos = 0;
	if(type=="show")
		pos = 150;
	else{
		$(".depth2").stop();
        $(".bg_depth2").stop();
	}
	$(".depth2").animate({
		height:pos
	},{duration:100, queue:false, complete:function(){
			if(type=="show" && $(this).css("height")=="150px")
				$(".depth2").stop().fadeIn(500);			
		}
	}
	); 
    $(".bg_depth2").animate({
          height:pos
      },{duration:300, queue:false, complete:function(){
              if(type=="show" && $(this).css("height")=="150px")
                  $(".bg_depth2").stop().show();				
          }
      }
      );
}

function gnb_arrow(){
	
	//$('.gnb_arrow').hide();
	$(".depth1 > li ").on('focusin mouseenter', function(e) {
		
		var $this = $(this);

		if(!$this.hasClass('on')) {
			$('.gnb_arrow').show();
			var href = $this.attr('class');
			var collapse;
			switch(href) {  
				case 'menu1 depth1_li':
					$('.gnb_arrow').stop().animate({left: 30}, 300, 'easeOutSine');
				break;
				case 'menu2 depth1_li': 
					$('.gnb_arrow').stop().animate({left: 240}, 300, 'easeOutSine');
				break;
				case 'menu3 depth1_li': 
					$('.gnb_arrow').stop().animate({left: 450}, 300, 'easeOutSine');
				break;
				case 'menu4 depth1_li': 
					$('.gnb_arrow').stop().animate({left: 670}, 300, 'easeOutSine');
				break;
				case 'menu5 depth1_li': 
					$('.gnb_arrow').stop().animate({left: 880}, 300, 'easeOutSine');
				break;
				case 'menu6 depth1_li': 
					$('.gnb_arrow').stop().animate({left: 1060}, 300, 'easeOutSine');
				break;
				default: break;
			}
		}
		e.preventDefault();
	}).on('mouseleave', function(e){
		$('.gnb_arrow').hide();
	});
}
function lnb(){
	//3 depth를 가지고 있는 li에 클래스추가
	$("li", $('.lnb_menu')).has("ul").addClass("has_dep3");

	$(".has_dep3 a.lnb_dep1").on('click', function(e) {
		$(this).parent().parent().find("ul").slideUp(300);
		$(this).parent().find("ul").stop().slideDown(300);
		$(this).parent().parent().find("li").removeClass("arrow");
		$(this).parent().find("li:first-child").addClass("arrow");
		$(this).parent("li").addClass("arrow");
		e.preventDefault();
	});
	
	/*$(".lnb_dep2 a").on('click', function(e) {
		$(this).parent().parent().find("li").removeClass("on");
		$(this).parent("li").addClass("on");
	});*/
	
}
// layer
function layer_ajax(file, layer_class, param){
	$("#layer_contents").html("");

	if(typeof param == "undefined")
		param = "none";

	$.ajax({
		type : 'GET',
		data : param,
		url : file,
		dataType : 'html',
		success : function(data) {
			$("#layer_contents").html(data);
			$("#layer_background").fadeIn();
			layer_fix($("#layer_contents"));
			$("#layer_contents").fadeIn();			
			$("#layer_contents").attr("class",layer_class);
			if(!data){
				alert("데이터가 없습니다.");
			}else
				$("#layer_contents").attr("class",layer_class);

		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"\n"+"error:"+error+" message:"+request.responseText);
	   }
	});
}

//	layer close
function layer_close(){
	$("#layer_background").fadeOut(100);
	$("#layer_contents").fadeOut(100);
	$("#layer_contents").html("");
}

//	layer 위치
function layer_fix(obj){
	var posY = $(window).height();
	var posX = $(window).width();
	var itemW = obj.width();
	var itemH = obj.height();
	var scrolls = 0;

	if(posX>itemW)
		posX = (posX / 2) - (itemW / 2);
	else
		posX = 0;

	if(posY > itemH)
		posY = (posY / 2) - (itemH / 2) + scrolls;
	else
		posY = 0 +scrolls;
	
	obj.css("top",posY+"px");
	obj.css("left",posX+"px");
}

function datepicker(){
	$( ".datepicker" ).datepicker({
		monthNamesShort: [ '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12' ],
		showOtherMonths: true,
		showMonthAfterYear: true,
		changeYear: true,
		changeMonth: true,
		showButtonPanel: true,
		showAnim: 'fadeIn',
		dateFormat: "yy-mm-dd",
		beforeShow: function() {
			setTimeout(function(){
					$('.ui-datepicker').css('z-index', 9999);
			}, 10);
		}
	});
	$( ".datepicker-start" ).datepicker({
		//showOn: "both",
		//buttonImage: "../images/calendar.gif",
		monthNamesShort: [ '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12' ],
		showOtherMonths: true,
		showMonthAfterYear: true,
		showButtonPanel: true,
		changeYear: true,
		dateFormat: "yy-mm-dd",
		//defaultDate: "+1w",
		//minDate: 0,
		changeMonth: true,
		beforeShow: function() {
			setTimeout(function(){
					$('.ui-datepicker').css('z-index', 9999);
			}, 10);
		},
		onClose: function( selectedDate ) {
			$(".datepicker-end").datepicker( "option", "minDate", selectedDate );
		}
	});
	 
	//끝일. 시작일보다는 길어야 되게끔
	$( ".datepicker-end" ).datepicker({
		//showOn: "both",
		monthNamesShort: [ '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12' ],
		showOtherMonths: true,
		showMonthAfterYear: true,
		showButtonPanel: true,
		changeYear: true,
		buttonImage: "../images/calendar.gif",
		dateFormat: "yy-mm-dd",
		//defaultDate: "+1w",
		changeMonth: true,
		beforeShow: function() {
			setTimeout(function(){
					$('.ui-datepicker').css('z-index', 9999);
			}, 10);
		},
		onClose: function( selectedDate ) {
			$(".datepicker-start").datepicker( "option", "maxDate", selectedDate );
		}
	});
}
function custom_combobox($link, $layer, layername) {
	$layer.hide();
	$link.on('click', function(e) {
		var $this = $(this);
		$this.next().slideDown(300, 'easeOutSine');
		$this.next().on('mouseleave', function() {
			$(this).slideUp(150, 'easeOutSine');
		});
		$this.next().find('a').on('click', function(e) {
			//console.log($(this).text()+', '+$(this).find('input').val());
			//alert($(this).find('input').val());
			$(this).parents(layername).prev().find('.text_area').text($(this).text());
			$(this).parents(layername).slideUp(150, 'easeOutSine');
			e.preventDefault();
		})
		e.preventDefault();
	});
}
function toggle_menu($obj, $obj_con){
	$obj.on('click', function(e) {
	
    if(!$(this).find($obj_con).is(".on")){
		$(this).parent().parent().parent().find(".hide_con.on").hide().removeClass("on");
		$(this).parent().parent().next("tr").stop().show().addClass("on");
	}else{
		$(this).parent().parent().next("tr").hasClass(".on").hide().removeClass("on");
	} 
	e.preventDefault();
	});
	
}
function tab_menu($obj, $obj_con) {
	$obj.on("click", function(e) {
		var tab_index = $(this).parent().index();
		if(!$(this).parent().is(".on")){
			$(this).parent().parent().find('.on').removeClass('on');
			$(this).parent().addClass('on');
		}
		$obj_con.hide();
		$obj_con.eq(tab_index).stop().fadeIn();
		e.preventDefault();
	});
}
//이용약관 상세보기 
function agree_change(){
	var agree_div = $(".select_style option:selected").val();
	$(".agree_area").hide();
	$('#'+agree_div).show();
}

 //팝업 - 그냥 기존기능에 css를 입히는걸로 이야기를 나눴습니다.
 /*

function agreePop(poptit,popcon){
	$(".pop_up_back").css({"display":"block" });

	var winHeight = document.body.clientHeight;	// 현재창의 높이
	var winWidth = document.body.clientWidth;	// 현재창의 너비
	var winX = window.screenLeft;	// 현재창의 x좌표
	var winY = window.screenTop;	// 현재창의 y좌표

	var popWidth = 700;
	var popHeight = 500;

	var popX = parseInt(winX + (winWidth - popWidth))/2
	var popY = parseInt(winY + (winHeight - popHeight))/2;

    $(".popup_layer").css("left", popX);
	$(".popup_layer").css("top", popY);

	$(".popup_layer").css({"display":"block"});
	// 타이틀입력
	$(".popup_tit").text(poptit);
	// 구분내용
	$(".popup_con").html(popcon);
	
	$(".btn_popup_close").click(function(){
		$(".pop_up_back").css({"display":"none" });
		$(".popup_layer").css({"display":"none" });
	});
}

*/
