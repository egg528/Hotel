 
//메인 페이지로 이동
function fn_mainPage(){
	location.href = $('#contextPath').val();
}
//에러 페이지로 이동
function fn_goErrorPage(){
	location.href = $('#contextPath').val()+'/resources/error/error500.jsp';
}
//에러 페이지로 이동
function fn_goNotfoundPage(){
	location.href = $('#contextPath').val()+'/resources/error/error404.jsp';
}

//OpenAPI 주소 찾기 팝업
function fn_searchJibunPop(){
	var url = $('#contextPath').val() + '/service/common/searchJibunInit';
	window.open(url, 'subWin', 'width=1035px, height=685px, scrollbars=no, menubar=no, status=no, location=no,toolbar=no, resizable=no,fullscreen=no, channelmode=no');  
}

//OpenAPI 주소 찾기 팝업(팝업창에서 팝업 호출)
function fn_searchJibunPopPop(){
	var url = '/service/common/searchJibunInit';
	window.open(url, 'subWin', 'width=1035px, height=685px, scrollbars=no, menubar=no, status=no, location=no,toolbar=no, resizable=no,fullscreen=no, channelmode=no');  
}

//로그인 페이지 이동
function fn_loginForm(){
	location.href = $('#contextPath').val() + '/service/main';
}

//마이페이지 > 개인정보 수정 페이지 이동
function fn_memberUpdateForm(){
	location.href = $('#contextPath').val() + '/service/on/mypage/memberUpdateForm';
}

//문자열의 자리수를 byte 단위로 반환한다.
function fnGetByteLegth(str){
	
	if(str==null) return 0;

	var count = 0;

	for(var i = 0 ; i < str.length ; i++){
		if(str.charCodeAt(i) > 128){
			count += 3;
		}else{
			count += 1;
		}
	}
	
	return count;
}

//####################################################################
//# gfn_ValCheckFocus(obj, length, nextId)
//# 해당 Object의 validation check
//# @ param obj : 해당 input Object
//# @ param objName : 해당 Object 의 명칭
//# @ param lengthFix : 해당 Object의 length 고정 여부( Y가 아니면 maxlengh 보다 길경우 체크 )
//####################################################################
function gfn_ValCheckFocus(obj, objName , lengthFix)
{
	if(obj.val()=="")
	{
	
		alert(objName+'이(가) 입력되지 않았습니다.');
		obj.focus();
		return;
	}

	if(obj.attr('maxlength') != null && obj.attr('maxlength') != "undifined")
	{
		if(lengthFix == 'Y'){
			if(fnGetByteLegth(obj.val()) != obj.attr('maxlength')){
				alert(objName+'은(는) '+obj.attr('maxlength')+'자리로 입력해 주세요.');
				obj.focus();
				return false;
			}	
		}else{
			if(fnGetByteLegth(obj.val()) > obj.attr('maxlength')){
				alert(objName+'은(는) 한글 ' + Math.floor(obj.attr('maxlength')/3) + '자 , 영문 ' +obj.attr('maxlength')+'자 까지 입력이 가능합니다.');
				obj.focus();
				return false;
			}
		}
	}
	return true;
}

//####################################################################
//# gfn_valLengthCheckFocus(obj, length)
//# 해당 Object length 체크
//# @ param obj : 해당 input Object
//# @ param objName : 해당 Object 의 명칭
//####################################################################
function gfn_valLengthCheckFocus(obj , objName){
	if(fnGetByteLegth(obj.val()) > obj.attr('maxlength')){
		alert(objName+'은(는) 한글 ' + Math.floor(obj.attr('maxlength')/3) + '자 , 영문 ' +obj.attr('maxlength')+'자 까지 입력해 가능합니다.');
		obj.focus();
		return false;
	}

	return true;
}

//####################################################################
//# gfn_NextFocus(obj, length, nextId)
//# 해당 Object에 값이 다 찼을 경우 다음 Object로 자동 focus이동시킨다.
//# @ param obj : 해당 input Object
//# @ param length : 해당 input Object 의 값 length
//# @ param nextId : 포커스를 이동시킬 Object ID
//####################################################################
function gfn_NextFocus(obj, nextId)
{
	var nextObj = document.getElementById(nextId);
	if (obj.value.length == $(obj).attr('maxlength'))
	{
		nextObj.focus();
	}
}

/*****************************************************************************************
함수명   : fn_idCheck
파라메터  : obj  -   체크할 object
설명   : 회원 아이디 유효성 체크
반환값   : true/false
******************************************************************************************/
function fn_idCheck(obj){
	var firstValid = "abcdefghijklmnopqrstuvwxyz";
	var valid = firstValid + "0123456789";
	var temp;
	
	for(var i = 0 ; i < obj.val().length ; i++){
		temp = obj.val().substring(i, i+1);
		/*
		if(i == 0 && firstValid.indexOf(temp) == "-1"){
			alert('아이디 첫 문자는 영문 소문자만 입력 가능합니다.');
			obj.focus();
			return false;
		}
		*/
		if (valid.indexOf(temp) == "-1"){
			alert('아이디는 영문 소문자 또는 숫자만 입력 가능합니다.');
			obj.focus();
			return false;
		}
	}
	
	if(obj.val().length < 4 || obj.val().length > 12){
		alert('아이디는 영문(소문자) 또는 숫자 4~12자리 까지 입력 가능합니다.');
		obj.focus();
		return false;
	}else if(obj.attr('maxlength') < obj.val().length){
		alert('아이디은(는) ' + obj.attr('maxlength') + '자 까지 입력 가능합니다.');
		obj.focus();
		return false;
	}
	return true;
}

/*****************************************************************************************
함수명   : fn_pwCheck
파라메터  : obj  -   체크할 object
설명   : 비밀번호 유효성 체크
반환값   : true/false
******************************************************************************************/
function fn_pwCheck(obj){
	var alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	var number = "1234567890";
	var sChar = "-_=+\|()*&^%$#@!~`?></;,.:'";
	 
	var sChar_Count = 0;
	var alphaCheck = false;
	var numberCheck = false;
	
	if(6 <= obj.val().length || obj.val().length <= obj.attr('maxlength')){
		for( var i = 0; i < obj.val().length ; i++ ){
			if(sChar.indexOf(obj.val().charAt(i)) != -1){
				sChar_Count++;
			}else if(alpha.indexOf(obj.val().charAt(i)) != -1){
				alphaCheck = true;
			}else if(number.indexOf(obj.val().charAt(i)) != -1){
				numberCheck = true;
			}
		}
		
		if(alphaCheck != true || numberCheck != true){
			alert("비밀번호는 6~" + obj.attr('maxlength') + "자 영문,숫자 조합으로 입력해 주세요.");
			obj.focus();
			return false;
		}
	  
	}else{
		alert("비밀번호는 6~" + obj.attr('maxlength') + "자 영문,숫자 조합으로 입력해 주세요.");
		obj.focus();
		return false;
	}
	
	return true;
}

/*****************************************************************************************
함수명   : fn_emailCheck
파라메터  : obj  -   체크할 object
설명   : 이메일 주소 유효성 체크
반환값   : true/false
******************************************************************************************/
function fn_emailCheck(obj){
	var email = escape(obj.val());
	
	var sChar = "@";
	var sCharCnt = 0;
	
	for( var i = 0; i < obj.val().length ; i++ ){
		if(sChar.indexOf(obj.val().charAt(i)) != -1){
			sCharCnt = sCharCnt + 1;
		}
	}

	//if(email.match(/^[\w\-]+@(?:(?:[\w\-]{2,}\.)+[a-zA-Z]{2,})$/) == null){
	
	//if(email.match(/[-!#$%&'*+\/^_~{}|0-9a-zA-Z]+(\.[-!#$%&'*+\/^_~{}|0-9a-zA-Z]+)*@[-!#$%&'*+\/^_~{}|0-9a-zA-Z]+(\.[-!#$%&'*+\/^_~{}|0-9a-zA-Z]+)*/) == null || sCharCnt != 1){
	//	alert("이메일을 올바르게 입력해 주세요.");
	//	obj.focus();
	//	return false;
	//}
	var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if(!regExp.test(email)) {
        alert('이메일을 올바르게 입력해 주세요.');
        obj.focus();
        return false;
    }






	
	return true;
}

/*****************************************************************************************
함수명   : fn_imageFileCheck
파라메터  : obj  -   체크할 object
설명   : 운전면허증 사진 파일 유효성 체크
반환값   : true/false
******************************************************************************************/
function fn_imageFileCheck(obj){
	
}

//새로고침 방지
function gfn_closeF5(){
	if(event.keyCode==116)
	{
		alert("F5키는 사용하실 수 없습니다.");
		event.keyCode =505;
		
		event.cancelBubblue = true;
		event.returnValue=false;
		return false;
	}
	else if ((event.keyCode==78)&&(event.ctrlKey==true))
	{
		//Ctrl + N 새로고침을 막는 스크립트
		alert("Ctrl + N 키를 사용하실수 없습니다.");
		event.keyCode =505;
	}
	else if ((event.keyCode==82)&&(event.ctrlKey==true))
	{
		//Ctrl + N 새로고침을 막는 스크립트
		alert("Ctrl + R 키를 사용하실수 없습니다.");
		event.keyCode =505;
	}

	if (event.keyCode ==505)
	{
		return false;
	}
}

/* ----------------------------------------------------------------------------
 * 특정 날짜에 대해 지정한 값만큼 가감(+-)한 날짜를 반환 
 *  
 * 입력 파라미터 -----
 * pInterval : "yyyy" 는 연도 가감, "m" 은 월 가감, "d" 는 일 가감
 * pAddVal  : 가감 하고자 하는 값 (정수형)
 * pYyyymmdd : 가감의 기준이 되는 날짜
 * pDelimiter : pYyyymmdd 값에 사용된 구분자를 설정 (없으면 "" 입력) 
 *  
 * 반환값 ---- 
 * yyyymmdd 또는 함수 입력시 지정된 구분자를 가지는 yyyy?mm?dd 값
 * 
 * 사용예 --- 
 * 2008-01-01 에 3 일 더하기 ==> gfn_addDate("d", 3, "2008-08-01", "-"); 
 * 20080301 에 8 개월 더하기 ==> gfn_addDate("m", 8, "20080301", "");
 --------------------------------------------------------------------------- */
function gfn_addDate(pInterval, pAddVal, pYyyymmdd, pDelimiter)
{
	var yyyy;
	var mm;
	var dd;
	var cDate;
	var oDate;
	var cYear, cMonth, cDay;
 
	if (pDelimiter != "") {
		pYyyymmdd = pYyyymmdd.replace(eval("/\\" + pDelimiter + "/g"), "");
	}
 
 
	yyyy = pYyyymmdd.substr(0, 4);
	mm  = pYyyymmdd.substr(4, 2);
	dd  = pYyyymmdd.substr(6, 2);
 
	if (pInterval == "yyyy") {
		yyyy = (yyyy * 1) + (pAddVal * 1); 
	} else if (pInterval == "m") {
		mm  = (mm * 1) + (pAddVal * 1);
	} else if (pInterval == "d") {
		dd  = (dd * 1) + (pAddVal * 1);
	}
 
 
	cDate = new Date(yyyy, mm - 1, dd) // 12월, 31일을 초과하는 입력값에 대해 자동으로 계산된 날짜가 만들어짐.
	cYear = cDate.getFullYear();
	cMonth = cDate.getMonth() + 1;
	cDay = cDate.getDate();
 
	cMonth = cMonth < 10 ? "0" + cMonth : cMonth;
	cDay = cDay < 10 ? "0" + cDay : cDay;
 
 
 
	if (pDelimiter != "") {
		return cYear + pDelimiter + cMonth + pDelimiter + cDay;
	} else {
		return cYear + '' + cMonth + '' + cDay;
	} 
}

/**
 * 날짜 객체(Date) 반환
 * @param dateStr
 * @return Date
 */
function gfn_getDate(dateStr){
	var dateStrArr = dateStr.split('-');
	var year = parseInt(dateStrArr[0],10);
	var month = parseInt(dateStrArr[1],10) - 1;
	var day = parseInt(dateStrArr[2],10);
	
	var date = new Date(year, month, day);
	return date;
}

/**
 * 날짜 비교
 * beforDate보다 afterDate가 큰 날짜이면,
 * 즉, beforDate가 더 과거이면 
 * true 아니면 false;
 * @param beforeDate 형식 'YYYY-MM-DD'
 * @param afterDate 형식 'YYYY-MM-DD'
 * @return boolean
 */
function gfn_compareDate(beforDateStr, afterDateStr){
	var beforDate = gfn_getDate(beforDateStr);
	var afterDate = gfn_getDate(afterDateStr);
	
	if(beforDate.getTime() < afterDate.getTime()){
		return true;
	}else{
		return false;
	}
}



/**
 * 시간 더하기.
 * 
 * 입력 파라미터 -----
 * pInterval : "H" 는 시간 가감, "m" 은 분 가감
 * pAddVal  : 가감 하고자 하는 값 (정수형)
 * pDateTime : 가감의 기준이 되는 날짜  12자리 시간값 ( yyyyMMddHHmm )
 *  
 */
function gfn_addHours(pInterval, pAddVal, pDateTime)
{
	var sDate = pDateTime; 

	var yyyy = sDate.substring(0,4);
	var mm = sDate.substring(4,6);
	var dd = sDate.substring(6,8);
	var h = sDate.substring(8,10);
	var m = sDate.substring(10,12);
	mm = parseInt(mm,10)-1;
	var minEndDate = new Date(yyyy, mm, dd, h, m);
	if(pInterval=='H')
		minEndDate.setHours(minEndDate.getHours()+pAddVal); //시간 추가.
	else if(pInterval=='m')
		minEndDate.setMinutes(minEndDate.getMinutes()+pAddVal); //분 추가.

	var n_yyyy = minEndDate.getFullYear();
	var n_mm = minEndDate.getMonth()+1;
	if(parseInt(n_mm,10)<10) n_mm = '0'+n_mm;
	var n_dd = minEndDate.getDate();
	if(parseInt(n_dd,10)<10) n_dd = '0'+n_dd;
	var n_h = minEndDate.getHours();
	if(parseInt(n_h,10)<10) n_h = '0'+n_h;
	var n_m = minEndDate.getMinutes();
	if(parseInt(n_m,10)<10) n_m = '0'+n_m;
	var minEndDtm = n_yyyy+''+n_mm+''+n_dd+''+n_h+''+n_m;
	
	return minEndDtm;
}


/* ----------------------------------------------------------------------------
 * 특정 날짜의 요일까지를 포맷해서 반환
 *  
 * 입력 파라미터 -----
 * pYyyymmdd : 기준이 되는 날짜
 *  
 * 반환값 ---- 
 * 년-월-일 요일
 --------------------------------------------------------------------------- */
function gfn_getDateStr(pYyyymmdd)
{
	var yyyy;
	var mm;
	var dd;
 
	yyyy = pYyyymmdd.substr(0, 4);
	mm  = pYyyymmdd.substr(4, 2);
	dd  = pYyyymmdd.substr(6, 2);
	
	var cDate = new Date(yyyy, mm - 1, dd);

	var n_yyyy = cDate.getFullYear();
	var n_mm = cDate.getMonth()+1;
	if(parseInt(n_mm,10)<10) n_mm = '0'+n_mm;
	var n_dd = cDate.getDate();
	if(parseInt(n_dd,10)<10) n_dd = '0'+n_dd;
	
	var str1 = n_yyyy+"-"+n_mm+"-"+n_dd+" ";
	var str2 = ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'][cDate.getDay()];
	return str1+str2;
}

/**
 * NumberFormat 적용해서 리턴.
 * @param val 적용할 숫자값.
 */
function gfn_numformat(val)
{
	try	 
	{	 
		var valid = new Number(val);	 
	}catch(e)	 
	{	 
		return 0;	 
	}

	if(val.length <= 3) return val; 
	//if(val==0) return 0;
	
	try	 
	{	 
		val = new String(val); 
		var A1 = val.length - 3;
		var n   = 0;	 
		var d   = -3;	 
		n = (val.length % 3 == 0)? (val.length / 3) - 1 : (val.length / 3); 
		for(var i = 1; i <= n; i++)	 
		{	 
			var An = A1 + ((i - 1) * d);
			val = new String(val);	 
			val = val.substring(0, An) + ',' + val.substring(An, val.length);	 
		}	 
		return val;
	}catch(e)
	{	 
		return 0;	 
	}
}


//숫자 금액으로 return 
function comma(val){ 
	return gfn_numformat(val);
	/*
	if(val.length <= 3) return val; 
	var loop = Math.ceil(val.length / 3); 
	var offset = val.length % 3; 
	if((val.length % 3)==0){  
		offset = 3; 
	} 
	
	var ret = val.substring(0, offset); 
	for(var i=1;i<loop;i++){  
		ret += "," + val.substring(offset, offset+3);  
		offset += 3; 
	} 
		
	return ret;
	*/
}  

function number_format(num) { 
	num = num.replace(/,/g, ""); 
	var num_str = num.toString(); 
	return gfn_numformat(num);
	/*
	var result = ''; 
	for(var i=0; i<num_str.length; i++) {  
		var tmp = num_str.length-(i+1);  
		if(i%3==0 && i!=0) result = ',' + result;   
		result = num_str.charAt(tmp) + result 
	} 
	return result;
	*/
}

/**
 * null 이거나 undifined 값을 '' 으로 치환.
 * @param val
 * @returns {String}
 */
function gfn_nullToblank(val)
{
	if(val==null || val=='undifined') return '';
	else return val;
}


/**
 * 쿠키값 추출
 * @param cookieName 쿠키명
 */
function gfn_getCookie( cookieName )
{
	var i, x, y, ARRcookies = document.cookie.split(";");
	 
    for (i = 0; i < ARRcookies.length; i++) {

            x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));

            y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);

            x = x.replace(/^\s+|\s+$/g, "");

            if (x == cookieName) {

                    return unescape(y);

            }

    }

}

/**
 * 쿠키 설정
 * @param cookieName 쿠키명
 * @param cookieValue 쿠키값
 * @param expireDay 쿠키 유효날짜
 */
function gfn_setCookie( cookieName, cookieValue, expireDays )
{
	if (expireDays) {	 
	    var date = new Date();	
	    date.setTime(date.getTime() + (expireDays * 24 * 60 * 60 * 1000));	
	    var expires = "; expires=" + date.toGMTString();	
	} else {	
		var expires = "";	
	}

	document.cookie = cookieName + "=" + cookieValue + expires + "; path=/";

}


/**
 * 쿠키 삭제
 * @param cookieName 삭제할 쿠키명
 */
function gfn_deleteCookie( cookieName )
{
	var expireDate = new Date();
 
	//어제 날짜를 쿠키 소멸 날짜로 설정한다.
	expireDate.setDate( expireDate.getDate() - 1 );
	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString() + "; path=/";
}

//화면의 중앙으로 팝업창 띄우기
function PopUp(url, wName, width, height) {//화면의 중앙
	var LeftPosition = (screen.width/2) - (width/2);
	var TopPosition = (screen.height/2) - (height/2);
	var win = window.open(url, wName, "left="+LeftPosition+",top="+TopPosition+",width="+width+",height="+height);

	if(win == null){
		alert("팝업차단을 해제해주세요!");
	} else{
		win.focus();
	}
}

//화면의 중앙으로 팝업창 띄우기..(스크롤포함)
function PopUpWithScroll(url, wName, width, height) {//화면의 중앙
	var LeftPosition = (screen.width/2) - (width/2);
	var TopPosition = (screen.height/2) - (height/2);
	var win = window.open(url, wName, "left="+LeftPosition+",top="+TopPosition+",width="+width+",height="+height+",scrollbars=yes");

	if(win == null){
		alert("팝업차단을 해제해주세요!");
	} else{
		win.focus();
	}
}

/**
 * 문자열 계산
 * @param chr
 * @returns {Number}
 */
function chr_byte(chr)
{
    if(escape(chr).length > 4)      
    	return 2;
    else                            
    	return 1;

}

/**
 * 입력된 문자열 잘라서 문자 첨부하기
 * @param str
 * @param limit
 * @param addStr	첨부할 문자
 * @returns {String}
 */
function gfn_cutStr(str, limit, addStr)
{
    var tmpStr = str;
    var byte_count = 0;
    var len = str.length;
    var dot = "";
    for(var i=0; i<len; i++){
        byte_count += chr_byte(str.charAt(i)); 
        if(byte_count == limit-1){
            if(chr_byte(str.charAt(i+1)) == 2){
                tmpStr = str.substring(0,i+1);
                dot = addStr;
            }
            else {
                if(i+2 != len) dot = addStr;
                tmpStr = str.substring(0,i+2);
            }
            break;
        }
        else if(byte_count == limit){
            if(i+1 != len) dot = addStr;
            tmpStr = str.substring(0,i+1);
            break;
        }
    }    

    return (tmpStr+dot);
}


/**
* html 영역 display컨트롤
*/
function gfn_viewDivToggle(objId)
{
	var obj = $('#'+objId);
	if(obj.css('display')=="" || obj.css('display') == "none") obj.css('display',"");
	else obj.css('display',"none"); 
}

/**
 * 입력값에 대한 체크를 해서 한글, 숫자, 영문, 대문자, 소문자 등 어떤값을 입력받을것인지 체크한다.
 */
function gfn_addValChkEvent()
{
	var reqs = $("input:text");
	if(reqs.length>0)
	{
		$(reqs).each(function(idx)
		{
			var obj_type = $(reqs[idx]).attr("reqType");
			
			// 한글만이라면..
			if(obj_type=="K") // 한글
			{	
				// 기타 브라우저 처리를 위한 keydown 이벤트 처리. (백스페이스, delete,화살표 먹게 한다.)
				$(reqs[idx]).keydown(function(event){
					if (event.which==229||
							(event.which==8||event.which==9||event.which==13||event.which==20||event.which==35||event.which==36||event.which==37||event.which==39||event.which==45||event.which==46)) {
						return true;
					}else{
						event.returnValue = false;
						return false;
					}
				});
				// 붙여넣기 방지 테크
				$(reqs[idx]).bind('paste', function(e){ return false; });
				// ie를 위한 한글 처리
				$(reqs[idx]).css('ime-mode','active');
			}
			else if(obj_type=="KN")	//한글,숫자만 입력 가능
			{
				$(reqs[idx]).keydown(function(event){
					if ((event.which>=48&&event.which<=57)||  //숫자
						(  event.which==229 )||  //한글
						(event.which>=96&&event.which<=105)||
						(event.which==8||event.which==9||event.which==13||event.which==20||event.which==35||event.which==36||event.which==37||event.which==39||event.which==45||event.which==46)) {
						return true;
					}else{
						event.returnValue = false;
						return false;
					}
				});
				
				// 붙여넣기 방지 테크
				$(reqs[idx]).bind('paste', function(e){ return false; });
				// ie를 위한 한글 처리
				$(reqs[idx]).css('ime-mode','active');
			}
			else if(obj_type=="N")	// 숫자 (백스페이스, delete,화살표 먹게 한다.)
			{
				$(reqs[idx]).keydown(function(event){
					if ((event.which>=48&&event.which<=57)||
							(event.which>=96&&event.which<=105)||
							(event.which==8||event.which==9||event.which==13||event.which==20||event.which==35||event.which==36||event.which==37||event.which==39||event.which==45||event.which==46)) {
						return true;
					}else{
						event.returnValue = false;
						return false;
					}
				});
				// 붙여넣기 방지 테크
				$(reqs[idx]).bind('paste', function(e){ return false; });
				// ie를 위한 한글 처리( 한글 불가 )
				$(reqs[idx]).css('ime-mode','Disabled');
				
			}
			else if(obj_type=="E")	// 영문 가능 ( 대소문자 구분없이.. 백스페이스, delete,화살표 먹게 한다.)
			{
				$(reqs[idx]).keydown(function(event){
					if ((event.which>=65&&event.which<=90)||
							(event.which==8||event.which==9||event.which==13||event.which==20||event.which==35||event.which==36||event.which==37||event.which==39||event.which==45||event.which==46)) {
						return true;
					}else{
						event.returnValue = false;
						return false;
					}
				});
				// 붙여넣기 방지 테크
				$(reqs[idx]).bind('paste', function(e){ return false; });
				// ie를 위한 한글 처리 ( 한글 불가 )
				$(reqs[idx]).css('ime-mode','Disabled');
				
			}
			else if(obj_type=="NE")	// 영문+숫자 가능 ( 대소문자 구분없이.. 백스페이스, delete,화살표 먹게 한다.)
			{
				$(reqs[idx]).keydown(function(event){
					if ((event.which>=48&&event.which<=57)||
							(event.which>=65&&event.which<=90)||
							(event.which>=96&&event.which<=105)||
							(event.which==8||event.which==9||event.which==13||event.which==20||event.which==35||event.which==36||event.which==37||event.which==39||event.which==45||event.which==46)) {
						return true;
					}else{
						event.returnValue = false;
						return false;
					}
				});
				// 붙여넣기 방지 테크
				$(reqs[idx]).bind('paste', function(e){ return false; });
				// ie를 위한 한글 처리 ( 한글 불가 )
				$(reqs[idx]).css('ime-mode','Disabled');
				
			}		
			else if(obj_type=="Ne")	// 영문(소문자)+숫자 가능 ( 백스페이스, delete,화살표 먹게 한다.) - 소문자로 변환시키는 스크립트 삽입한다.
			{
				$(reqs[idx]).keydown(function(event){
					if ((event.which>=48&&event.which<=57)||
							(event.which>=65&&event.which<=90)||
							(event.which>=96&&event.which<=105)||
							(event.which==8||event.which==9||event.which==13||event.which==20||event.which==35||event.which==36||event.which==37||event.which==39||event.which==45||event.which==46)) {
						return true;
					}else{
						event.returnValue = false;
						return false;
					}
				});

				$(reqs[idx]).keyup(function(event){
					// 소문자로 변환을 시킨다.
					$(reqs[idx]).val($(reqs[idx]).val().toLowerCase());
				});
				
				// 붙여넣기 방지 테크
				$(reqs[idx]).bind('paste', function(e){ return false; });
				// ie를 위한 한글 처리 ( 한글 불가 )
				$(reqs[idx]).css('ime-mode','Disabled');
				
			}
			else if(obj_type=="NES")	// 한글+스페이스 불가능.
			{
				// 기타 브라우저 처리를 위한 keydown 이벤트 처리. (백스페이스, delete,화살표 먹게 한다.)
				$(reqs[idx]).keydown(function(event){
					if (event.which==229||event.which==32) {
						event.returnValue = false;
						return false;
					}else{
						return true;
					}
				});
				// 붙여넣기 방지 테크
				$(reqs[idx]).bind('paste', function(e){ return false; });
				// ie를 위한 한글 처리
				$(reqs[idx]).css('ime-mode','Disabled');
			}
			
			// <2016-01-14 새로 추가함>
			else if(obj_type=="KE")	// 한글+영문(대+소)(백스페이스, delete,화살표 먹게 한다.)
			{
				var keyValue;
				$(reqs[idx]).keydown(function(event){
					keyValue = event.which;
					if ( 
						(  event.which==229 )||  //한글
						(event.which>=96&&event.which<=105)||
						(event.which>=65&&event.which<=90)|| //영문(대+소)
						(event.which>=188&&event.which<=190)|| // ,-.
						(event.which==8||event.which==9||event.which==13||event.which==20||event.which==21||event.which==32||event.which==35||event.which==36||event.which==37||event.which==39||event.which==45||event.which==46)) {
						return true;
					}else{
						event.returnValue = false;
						return false;
					}
				});
				$(reqs[idx]).keyup(function(event){
					if ((keyValue>=48&&keyValue<=57)||  //숫자
							(keyValue>=96&&keyValue<=105)||
							(keyValue>=188&&keyValue<=190)|| // ,-.
							(keyValue==8||keyValue==9||keyValue==13||keyValue==20||keyValue==21||keyValue==32||keyValue==35||keyValue==36||keyValue==37||keyValue==39||keyValue==45||keyValue==46)) {
						$(reqs[idx]).val($(reqs[idx]).val().replace(/[<>!#$%^&*_]/g,""));
						}
				});
				
				// 붙여넣기 방지 테크
				$(reqs[idx]).bind('paste', function(e){ return false; });
			}
			// <2016-01-14 새로 추가함 끝>

			else if(obj_type=="F")	// 숫자 + '.'을 허용하여 소수점 표현 가능
			{
				// 기타 브라우저 처리를 위한 keydown 이벤트 처리. (백스페이스, delete, 화살표, '.' 먹게 한다.)
				$(reqs[idx]).keydown(function(event){
					if (
						(event.which>=48&&event.which<=57)||
						(event.which>=96&&event.which<=105)||
						(event.which==8||event.which==9||event.which==13||event.which==20||event.which==35||event.which==36||event.which==37||event.which==39||event.which==45||event.which==46||event.which==190)
					){
						return true;
					}else{
						event.returnValue = false;
						return false;
					}
				});
				
				// 붙여넣기 방지 테크
				$(reqs[idx]).bind('paste', function(e){ return false; });
				// ie를 위한 한글 처리
				$(reqs[idx]).css('ime-mode','Disabled');
			}
			else if(obj_type=="KNE")	// 한글+영문(대+소)+숫자 가능 (백스페이스, delete,화살표 먹게 한다.)
			{
				var keyValue;
				$(reqs[idx]).keydown(function(event){
					keyValue = event.which;
					if ((event.which>=48&&event.which<=57)||  //숫자
						(  event.which==229 )||  //한글
						(event.which>=96&&event.which<=105)||
						(event.which>=65&&event.which<=90)|| //영문(대+소)
						(event.which>=188&&event.which<=190)|| // ,-.
						(event.which==8||event.which==9||event.which==13||event.which==20||event.which==21||event.which==32||event.which==35||event.which==36||event.which==37||event.which==39||event.which==45||event.which==46)) {
						return true;
					}else{
						event.returnValue = false;
						return false;
					}
				});
				$(reqs[idx]).keyup(function(event){
					if ((keyValue>=48&&keyValue<=57)||  //숫자
							(keyValue>=96&&keyValue<=105)||
							(keyValue>=188&&keyValue<=190)|| // ,-.
							(keyValue==8||keyValue==9||keyValue==13||keyValue==20||keyValue==21||keyValue==32||keyValue==35||keyValue==36||keyValue==37||keyValue==39||keyValue==45||keyValue==46)) {
						$(reqs[idx]).val($(reqs[idx]).val().replace(/[<>!#$%^&*_]/g,""));
						}
				});
				
				// 붙여넣기 방지 테크
				$(reqs[idx]).bind('paste', function(e){ return false; });
			}

		});
	}

	var reqs2 = $("input:password");
	if(reqs2.length>0)
	{
		$(reqs2).each(function(idx)
		{
			// 기타 브라우저 처리를 위한 keydown 이벤트 처리. (백스페이스, delete,화살표 먹게 한다.)
			$(reqs2[idx]).keydown(function(event){
				if (event.which==229||event.which==32) {
					event.returnValue = false;
					return false;
				}else{
					return true;
				}
			});
			// 붙여넣기 방지 테크
			$(reqs2[idx]).bind('paste', function(e){ return false; });
			// ie를 위한 한글 처리
			$(reqs2[idx]).css('ime-mode','Disabled');
		});
	}		
			
}

//다이얼로그 닫기
function fn_dialogClose(){
	$('#dialogHolder').dialog('close');
}

//티머니 카드 소개 팝업
function fn_openTmoneyIntroPop_back(){
	var dialogContent = '';

	dialogContent += '<div class="space23"></div>';
	dialogContent += '<div class="member_title font13 gray04">';
	dialogContent += '<strong>1. 티머니 카드?</strong>';
	dialogContent += '</div>';
	dialogContent += '<div class="member_textra">';
	dialogContent += '<textarea name="" cols="" rows="" style=" width:508px; height:79px; padding:15px; border:1px solid #e1e1e1; background-color:#fafafa;">';
	dialogContent += '*티머니 카드 소개 및 입력 카드번호 입력안내 ';
	dialogContent += '</textarea>';
	dialogContent += '</div>';
	dialogContent += '<div class="member_title font13 gray04">';
	dialogContent += '<strong>2. 모바일 티머니?</strong>';
	dialogContent += '</div>';
	dialogContent += '<div class="member_textra">';
	dialogContent += '<textarea name="" cols="" rows="" style=" width:508px; height:79px; padding:15px; border:1px solid #e1e1e1; background-color:#fafafa;">';
	dialogContent += '*모바일 티머니 소개 및 카드번호 입력 안내';
	dialogContent += '</textarea>';
	dialogContent += '</div>';
	dialogContent += '<div class="member_title font13 gray04">';
	dialogContent += '<strong>스마트폰으로 QR코드를 스캔하여 바로 다운로드 받으세요   </strong>';
	dialogContent += '</div>';
	dialogContent += '<div class="member_textra01">';
	dialogContent += '<div class="member_text01">';
	dialogContent += '<div class="member_img01">';
	dialogContent += '<img src="'+$('#contextPath').val()+'/resources/images/service/useintro/member_img01.gif" />';
	dialogContent += '</div>';
	dialogContent += '<div class="member_line01"></div>';
	dialogContent += '<div class="member_img02">';
	dialogContent += '<img src="'+$('#contextPath').val()+'/resources/images/service/useintro/member_img02.gif" />';
	dialogContent += '</div>';
	dialogContent += '<div class="member_img03">';
	dialogContent += '<img src="'+$('#contextPath').val()+'/resources/images/service/useintro/member_img03.gif" />';
	dialogContent += '</div>';
	dialogContent += '<div class="member_text02 font11 gray01">';
	dialogContent += '안드로이드용';
	dialogContent += '</div>';
	dialogContent += '<div class="member_text03 font11 gray01">';
	dialogContent += '다운로드URL 문자 받기(무료)';
	dialogContent += '</div>';
	dialogContent += '</div>';
	dialogContent += '</div>';
	dialogContent += '<div class="zip_search_bt01">';
	dialogContent += '<a href="javascript:" onclick="fn_dialogClose();"><img src="'+$('#contextPath').val()+'/resources/images/service/useintro/zip_bt04.gif" /></a>';
	dialogContent += '</div>';
	
	
	$('#dialogContent').html(dialogContent);
	
	$('#dialogHolder').dialog({
		autoOpen: true,
		height : 660 ,
		width : 570 , 
		title: '티머니 카드 번호 확인방법',
		modal: true
	});
}

//티머니 카드 소개 팝업
function fn_openTmoneyIntroPop(){
	var dialogContent = '';

	dialogContent += '<div style="align:center">';
	dialogContent += '<img src="'+$('#contextPath').val()+'/resources/images/service/main/tmoney_info_popup.jpg" />';
	dialogContent += '</div>';
	dialogContent += '<div class="zip_search_bt01">';
	dialogContent += '<a href="javascript:" onclick="fn_dialogClose();"><img src="'+$('#contextPath').val()+'/resources/images/service/useintro/zip_bt04.gif" /></a>';
	dialogContent += '</div>';
	
	
	$('#dialogContent').html(dialogContent);
	
	$('#dialogHolder').dialog({
		autoOpen: true,
		height : 760 ,
		width : 475 , 
		title: '티머니 카드 번호 확인방법',
		modal: true
	});
}

function fn_showCal(calId)
{
	if ($('#'+calId).datepicker('widget').is(':hidden')) {
		$('#'+calId).datepicker("show");
	} else {
		$('#'+calId).datepicker("hide");
	}
}

/**
 * 결재카드 인증 결과 수신
 * @param rescode 결과코드
 * @param resmsg  결과메세지 
 * @param authNo  승인번호
 * @param authDt  승인일자
 * @param param1  회원아이디
 */
function fn_CardAuthReturn(rescode , resmsg , authNo , authDt , userid){
	if(rescode == '0000'){
		alert('결재카드가 정상적으로 등록되었습니다.');
		//fn_dialogClose();
	}else{
		alert(resmsg + '[error code : '+ rescode +']');
		return false;
	}
}

//약관 팝업 
function fn_agreePop(gb){
	$.ajax({ 
		type: 'post' ,
		url : $('#contextPath').val() + "/service/member/regist/agreePop" ,
		dataType : 'json' ,
		success : function(jsonData, textStatus, jqXHR) {
			var selectHtml = '';
			var tempHtml = '';
			var selectprocon = '';
			
			
			selectHtml += '<select name="proseq" id="proseq" onchange="fn_agreeChange();" title="구분" class="select_style mg30" style="width:270px">';
			
			for(var i = 0 ; i < jsonData.length ; i++){
				proseq = jsonData[i].proseq;
				protit = jsonData[i].protit;
				procon = jsonData[i].procon;
				
				if(i == 0 || gb == proseq){
					selectHtml += '<option value="' + proseq + '" selected>';
					selectprocon = jsonData[i].procon;
				}else{
					selectHtml += '<option value="' + proseq + '">';	
				}
				selectHtml += protit;
				selectHtml += '</option>';
				
				tempHtml += '<div id="tempHtml_'+proseq+'" name="tempHtml_'+proseq+'">';
				tempHtml += procon;
				tempHtml += '</div>';
			}			
			selectHtml += '</select>';
			
			
			var dialogContent = '';
			
			dialogContent += '<div class="popup_layer" style="width:740px;">';
			dialogContent += '	<div class="popup_con left">';
			dialogContent += 	selectHtml;
			dialogContent += '	<div class="agree_area" id="proconArea" name="proconArea">';
			dialogContent += 		selectprocon;
			dialogContent += '	</div>';
			dialogContent += '	<div id="tempHtmlArea" name="tempHtmlArea" style="display:none;">'+tempHtml+'</div>';
			dialogContent += '	</div>';
			dialogContent += '</div>';
			
			$('#agreeDialogContent').html(dialogContent);
			
			$('#agreeDialogHolder').dialog({
				autoOpen: true,
				height : 660 ,
				width : 800 , 
				title: '이용약관 보기' ,
				modal: true 
			});	
		} ,
		error : function() {
			location.href = $('#contextPath').val()+'/jsp/error.jsp';
		}
	});
}

//약관 선택 이벤트
function fn_agreeChange(){
	$('#agreeDialogContent [name=proconArea]').html($('#agreeDialogContent [name=tempHtml_'+$('#agreeDialogContent [name=proseq]').val()+']').html());
}

function fn_agreeDiallogClose(){
	$('#agreeDialogHolder').dialog('close');
}

function gfn_ajaxError(xhRequest, ErrorText, thrownError)
{
	if(xhRequest.status=='415')
	{
		alert('세션이 종료되었습니다.\n\n로그인 후 다시 이용해 주세요.');
		location.href = $('#contextPath').val()+'/';
	}
	else if(xhRequest.status=='404')
	{
		fn_goNotfoundPage();
	}
	else
	{
		fn_goErrorPage();
	}
}

function gfn_eventPop()
{
	var cw=screen.availWidth;     	//화면 넓이
	var ch=screen.availHeight;    	//화면 높이

	var sw=444;    					//띄울 창의 넓이
	var sh=445;    					//띄울 창의 높이

	var ml=(cw-sw)/2;        		//가운데 띄우기위한 창의 x위치
	var mt=(ch-sh)/2;         		//가운데 띄우기위한 창의 y위치

	var eventWin = window.open($('#contextPath').val() + '/service/event/seoulEventForm', 'subWin', 'width='+sw+', height='+sh+',top='+mt+',left='+ml+' scrollbars=no, menubar=no, status=no, location=no,toolbar=no, resizable=no,fullscreen=no, channelmode=no');
	eventWin.focus();
}


/**
* 차량 모델 테이블에서 ajax통신을 하여 셀렉트박스에 옵션 리스트들을 렌더링
* @param selectBoxId 렌더링할 셀렉트박스의 ID
* @param defaultVal 옵션중 디폴트 값으로 사용할 키값, value값은 ""이다
*/
function gfn_getModCodList(selectBoxId, defaultVal, paramId){
	$.ajax({
		type : "POST",
		url : $('#contextPath').val() + "/service/carMod/carModCodList",
		dataType : "json",
		success : function(data){
			gfn_rendSelectBox(selectBoxId, gfn_optionListToArray(data.carModList, "CARNAM", "MODSEQ"), defaultVal);
			gfn_selectOption(selectBoxId, paramId);
		}
	});
}
/**
 * 셀렉트박스의 옵션들을 모두 삭제한다
 * @param selectBoxId
 */
function gfn_resetSelectBox(selectBoxId){
	$("#"+selectBoxId).children().remove();
}

/**
 * 배열을 통해 셀렉트박스에 옵션들 추가 
 * @param selectBoxId
 * @param optionList
 */
function gfn_rendSelectBox(selectBoxId, optionList, defaultVal){
	gfn_resetSelectBox(selectBoxId);
	if(defaultVal != '' && defaultVal != null){
		gfn_addOption($("#" + selectBoxId), defaultVal, "");
	}
	gfn_addOptions(selectBoxId, optionList);	
}

/**
 * 셀렉트박스에 옵션들(배열) 추가
 * @param selectBoxId
 * @param optionList
 */
function gfn_addOptions(selectBoxId, optionList){
	var targetElem = $("#"+selectBoxId);
	for(var i = 0; i < optionList.length; i++){
		gfn_addOption(targetElem, optionList[i].text, optionList[i].val);
	}
}

/**
 * 셀렉트박스에 옵션(단일) 추가
 * @param selectBox
 * @param option
 */
function gfn_addOption(selectBox, text, val){
	selectBox.append($("<option></option>").text(text).val(val));
}
/**
 * 배열을 {키, 값}형태의 배열로 변환
 * @param arrayList 가공할 배열
 * @param name 가공할 배열에서 키값으로 뽑아야 될 값
 * @param val 가공할 배열에서 값으로 뽑아야 될 값
 */
function gfn_optionListToArray(arrayList, name, val){
	var optionList = new Array();
	for(var i = 0; i < arrayList.length; i++){
		eval("optionList[i] = {text : arrayList[i]." + name + ", val : arrayList[i]." + val + "}");
	}
	return (optionList);
}

/**
 * 셀렉트박스에서 값에 맞는 옵션값 체크
 * @param selectBoxId
 * @param paramId
 */
function gfn_selectOption(selectBoxId, paramId){	
	var selectBox = $("#" + selectBoxId);
	selectBox.children().each(function(){
		if($(this).val() == $("#" + paramId).val()){
			$(this).attr("selected", "selected");
		}
	});
}
/**
* 메뉴접근 로그 등록
* @param mnucod 메뉴 ID
*/
function regUsrMnuAccLog(mnucod){
	$.ajax({
		type : "POST",
		url : $('#contextPath').val() + "/service/regUsrMnuAccLog",
		dataType : "json",
		data : {mnucod : mnucod, accesscod : 'USRM01'},
		success : function(jsonData, textStatus, jqXHR) {
		} ,
		error : function(xhRequest, ErrorText, thrownError) {
			//gfn_ajaxError(xhRequest, ErrorText, thrownError);
		}
	});
}
/* 로딩바 loading(modal) */
function onLoading(){
	var div = document.createElement('div');
	$(div).attr('id','onaction');
	$('<img alt="로딩이미지" src="/resources/images/reserve/loadingBar.gif" style="width: 55px; height: 55px;">').appendTo(div);
	$($('div')[0]).before(div);	// 생성된 div 태그를 로딩바 이미지 태그 위로 위치
	
	$(div).dialog({
		//position:['center','center'],	// 창의 위치 설정(x, y 위치)
		resizeable : false,		// 리사이징 가능 여부
		closeOnEscape : true,	// ESC키를 눌렀을때 다이얼로그 박스를 닫을 것인지 설정, 설정하지 않으면 true로 닫히게 된다.
		//overlay : {opacity:0.5, background:'#ffffff'},
		modal: true,
		open:function(){
			$(this).parents(".ui-dialog:first").find(".ui-dialog-titlebar-close").hide();	// 다이얼로그 타이틀바 hide();
			$(this).parents(".ui-dialog:first").find(".ui-dialog-titlebar").remove();		// 다이얼로그 타이틀바 remove();
			$("body").scrollTop(0);						// 다이얼로그 창이 뜰 때 스크롤위치를 고정
			//$('body').css('overflow','hidden');		// Modal Dialog를 띄울 때 스크롤바 방지
		},
		close:function(){
			//$('body').css('overflow-y','auto');		// Modal Dialog를 닫을 때 화면 복구
		}
	});
	
	$('.ui-widget-header').remove();		// 다이얼로그의 타이틀 헤더를 remove();
	$(div).css('background-position','center');
	$('.ui-resizable-handle').remove();	// 다이얼로그의 사이즈 조절 부분을 remove();
	$(div).parent().removeClass('ui-widget-content');	// 다이얼로그의 내용부의 class 제거
	$(div).css('min-width','100px');
	$(div).css('min-height','100px');
}
/* 로딩바 off(modal) */
function offLoading(){
	$('#onaction').remove();
}
//VISUAL
var visual = {
	init : function(){
		this.action();
	},
	action : function(){
		var roll = $('#visual .roll');
		roll.bxSlider({
			mode: 'fade',
			auto: true,
			controls: false,
			useCSS: false,
			pause: 4000,
			speed: 500,
			touchEnabled: false,
			stopAutoOnClick: true,
			easing: 'easeInOutExpo'
		});
	}
}