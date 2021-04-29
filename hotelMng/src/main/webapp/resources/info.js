function checkform() {
	if (document.Form1.emailid.value == "") {
		alert( "Email id를 입력해주십시오." );
		document.Form1.emailid.focus();
		Opensearch();
		return false;
	}
	
	if (document.Form1.pwd.value == "") {
  		alert( "기본 E-mail 계정의 비밀번호를 입력하세요" );
		document.Form1.pwd.focus();
		return false;
	}
	
	if (document.Form1.pwd.value.length < 4 || document.Form1.pwd.value.length >15) {
		alert("비밀번호는 4~15자 이내여야 합니다.")
		document.Form1.pwd.focus();
		document.Form1.pwd.value ="";
		return false;
	}
	
	if (document.Form1.pwd_re.value=="") {
  		alert( "비밀번호확인을 입력하세요" );
		document.Form1.pwd_re.focus();
		return false;
	}
	
	if (document.Form1.pwd.value != document.Form1.pwd_re.value) {
  		alert ("비밀번호와 비밀번호확인이 일치하지 않습니다.");
  		document.Form1.pwd_re.focus();
  		return false;
	}
	
	if (document.Form1.emailid.value == document.Form1.pwd.value) {
		alert("아이디와 패스워드는 개인정보 보호를 위해 다르게 입력하십시오");
		document.Form1.pwd.focus();
		return false;
	}
	
	document.Form1.usernm.disabled = false;
	if (document.Form1.usernm.value.length < 1 ) {
		alert("가입자 성명을 입력 하여 주십시오.");
 		document.Form1.usernm.focus();
        return false;
	}
	document.Form1.usernm.disabled = true;
	
	if (document.Form1.tel1.value.length < 2 ) {
		alert("전화번호를 입력 하여 주십시오.");
 		document.Form1.tel1.focus();
        return false;
	}
	else if(document.Form1.tel1.value == "0" || document.Form1.tel1.value == "00" 
		|| document.Form1.tel1.value == "000" || document.Form1.tel1.value == "0000") {
		alert("전화번호를 입력 하여 주십시오.");
 		document.Form1.tel1.focus();
        return false;
	}
        
	if (document.Form1.tel2.value.length < 3 ) {
		alert("전화번호를 입력 하여 주십시오.");
		document.Form1.tel2.focus();
		return false;
	}
    
	if (document.Form1.tel3.value.length < 4 ) {
		alert("전화번호를 입력 하여 주십시오.");
		document.Form1.tel3.focus();
		return false;
	}

	if(document.Form1.hp2.value == "0" || document.Form1.hp2.value == "00" 
		|| document.Form1.hp2.value == "000" || document.Form1.hp2.value == "0000") {
		alert("전화번호를 입력 하여 주십시오.");
 		document.Form1.hp2.focus();
        return false;
	}

	if(document.Form1.accept.checked == false) 
  	{ 
        alert("개인정보취급방침에 동의하셔야 회원가입을 할수 있습니다"); 
		document.Form1.accept.focus();
        return false; 
  	} 
	
	var taxcate = document.Form1.usertype.options[document.Form1.usertype.selectedIndex].value;
		
	switch (taxcate) {
	case "C" : 
		if (document.Form1.sabun1.value.length < 1 ) {
			alert("등록번호를 입력 하여 주십시오.");
			document.Form1.sabun1.focus();
			return false;
		 }
		if (document.Form1.sabun2.value.length < 1 ) {
			alert("등록번호를 입력 하여 주십시오.");
			document.Form1.sabun2.focus();
			return false;
		}
		if (document.Form1.sabun3.value.length < 1 ) {
			alert("등록번호를 입력 하여 주십시오.");
			document.Form1.sabun3.focus();
			return false;
		}
		if (document.Form1.CompNm.value.length < 1 ) {
			alert("세금계산서 확인을 해주십시오.");
			document.Form1.saupbutton.focus();
			return false;
		}
		if (document.Form1.Nm.value.length < 1 ) {
			alert("세금계산서 확인을 해주십시오.");
			document.Form1.saupbutton.focus();
			return false;
		}
		if (document.Form1.Addr.value.length < 1 ) {
			alert("세금계산서 확인을 해주십시오.");
			document.Form1.saupbutton.focus();
			return false;
		}
		if (document.Form1.CompType.value.length < 1 ) {
			alert("세금계산서 확인을 해주십시오.");
			document.Form1.saupbutton.focus();
			return false;
		}
		if (document.Form1.JongMok.value.length < 1 ) {
			alert("세금계산서 확인을 해주십시오.");
			document.Form1.saupbutton.focus();
			return false;
		}
		break
	case "N" : 
		if (document.Form1.namecheck.value == "" ) {
			alert("아이핀 인증 버튼을 클릭 해주세요.");
			return false;
		}
		if (document.Form1.namecheck.value != "Y" ) {
			alert("아이핀 인증에 실패한 상태 입니다. 다시 한번 시도해 주세요.");
			return false;
		}

	break
	}

	if (document.Form1.pricenm.value.length < 1 ) {
		alert("요금 담당자 성명을 입력 하여 주십시오.");
		document.Form1.pricenm.focus();
		return false;
	}
			
	if (document.Form1.pricetel1.value.length < 2 ) {
		alert("요금 담당자 전화번호를 입력 하여 주십시오.");
		document.Form1.pricetel1.focus();
		return false;
	}
	        
	if (document.Form1.pricetel2.value.length < 3 ) {
		alert("요금 담당자 전화번호를 입력 하여 주십시오.");
		document.Form1.pricetel2.focus();
		return false;
	}

	if (document.Form1.pricetel3.value.length < 4 ) {
		alert("요금 담당자 전화번호를 입력 하여 주십시오.");
		document.Form1.pricetel3.focus();
		return false;
	}

	if (document.Form1.zip.value =="") {
		alert("우편번호를 입력해 주세요");
		OpenZip();
		return false;
	}
		
	if (document.Form1.addr1.value =="") {
		alert("주소를 입력해 주세요");
		OpenZip();
		return false;
	}
		
	if (document.Form1.addr2.value =="") {
		alert("주소를 입력해 주세요");
		OpenZip();
		return false;
	}
		
	if (document.Form1.priceemail.value.length < 4 ) {
		alert("요금 담당자 Email을 입력 하여 주십시오.");
		document.Form1.priceemail.focus();
		return false;
	}

	// 본인인증 검사 시작
	var DF = document.Form1;
	if (DF.sName.value == "" || DF.sCipherTime.value == "" || DF.sRequestNumber.value == "" || DF.sResponseNumber.value == "" ||
		DF.sAuthType.value == "" || DF.sConnInfo.value == "" || DF.sGender.value == "" || 
		DF.sBirthDate.value == "" || DF.sNationalInfo.value == "" || DF.sMobileNO.value == "") {
		DF.checkbtn.focus();
		alert("본인인증이 이루어지지 않았습니다.");
		return false;
	}
	// 본인인증 검사 끝
	    
	//if (document.Form1.cardclick.value == 'C') {
		//if (document.Form1.cardnm.value.length < 2 ) {
			//alert("카드이체를 신청하신 고객께서는 카드이체 정보를 입력해주셔야 합니다.");
	 		//document.Form1.cardnm.focus();
			//  return false;
		//}
		//if (document.Form1.cardtel1.value.length < 1 ) {
			//alert("카드이체를 신청하신 고객께서는 카드이체 정보를 입력해주셔야 합니다.");
	 		//document.Form1.cardtel1.focus();
			//return false;
		//}
		//if (document.Form1.cardtel2.value.length < 2 ) {
			//alert("카드이체를 신청하신 고객께서는 카드이체 정보를 입력해주셔야 합니다.");
	 		//document.Form1.cardtel2.focus();
			//return false;
		//}
		//if (document.Form1.cardtel3.value.length < 2 ) {
			//alert("카드이체를 신청하신 고객께서는 카드이체 정보를 입력해주셔야 합니다.");
	 		//document.Form1.cardtel3.focus();
			//return false;
		//}
		//if (document.Form1.cardnumber.value.length < 2 ) {
			//alert("카드이체를 신청하신 고객께서는 카드이체 정보를 입력해주셔야 합니다.");
	 		//document.Form1.cardnumber.focus();
			//return false;
		//}
	//}

	// 결제정보 시작
	var paymethod = DF.paymethod[0].checked;	// true/false

	if(DF.paymethod[0].checked) {
		var respcode = DF.LGD_RESPCODE.value;
		var respmsg = DF.LGD_RESPMSG.value;
		var billkey = DF.LGD_BILLKEY.value;
		var paydate = DF.LGD_PAYDATE.value;
		var financecode = DF.LGD_FINANCECODE.value;
		var financename = DF.LGD_FINANCENAME.value;

		if(respcode != "0000") {
			alert("카드인증이 실패하였습니다.\n다시 시도해 주세요.");
			return false;
		}
		else if(respcode == "" || respmsg == "" || billkey == "" || paydate == "" || financecode == "" || financename == "") {
			alert("카드인증이 제대로 이루어지지 않았습니다.\n다시 시도해 주세요.");
			return false;
		}
	}
	else if(DF.paymethod[1].checked) {
		var bankselect = DF.bank.options[DF.bank.selectedIndex].value;
		var deposit = DF.deposit.value;
		var accountnumber = DF.accountnumber.value;
		var Anumber = DF.Anumber.value;

		if(bankselect == 0) {
			alert("은행을 선택해주세요.");
			DF.bank.focus();
			return false;
		}
		else if(deposit == "") {
			alert("예금주명을 입력해주세요.");
			DF.deposit.focus();
			return false;
		}
		else if(accountnumber == "") {
			alert("계좌번호를 입력해주세요.");
			DF.accountnumber.focus();
			return false;
		}
		else if(Anumber == "") {
			alert("주민/사업자번호를 입력해주세요.");
			DF.Anumber.focus();
			return false;
		}
	}
	// 결제정보 끝

	my_ret = confirm("가입 하시겠습니까?");
	
	if (!my_ret) {
		return false;
	}

	document.Form1.usernm.disabled = false;

	// 본인인증 후에 담당자 연락처를 바꾸더라도 hidden 필드에서 가져와서 다시 DB에 넣도록 함 시작
	var MOBILENO = document.Form1.sMobileNO.value;
	var MOBILENOLength = MOBILENO.length;
	var MOBILENO1 = MOBILENO.substring(0, 3);
	var MOBILENO2 = "";
	var MOBILENO3 = "";

	if (MOBILENOLength == 11) {
		MOBILENO2 = MOBILENO.substring(3, 7);
		MOBILENO3 = MOBILENO.substring(7);
	}
	else if(MOBILENOLength == 10) {
		MOBILENO2 = MOBILENO.substring(3, 6);
		MOBILENO3 = MOBILENO.substring(6);
	}

	if(MOBILENOLength == 10 || MOBILENOLength == 11) {
		document.Form1.pricetel1.value = MOBILENO1;
		document.Form1.pricetel2.value = MOBILENO2;
		document.Form1.pricetel3.value = MOBILENO3;
	}
	// 본인인증 후에 담당자 연락처를 바꾸더라도 hidden 필드에서 가져와서 다시 DB에 넣도록 함 끝


	document.Form1.action = "./regist_p.asp"
	document.Form1.target = "_self"
	document.Form1.submit();
	return true;
}

function checktax() {
	var taxcate = document.Form1.usertype.options[document.Form1.usertype.selectedIndex].value;

	switch (taxcate) {
	case "C" : 
		Form1.sabun1.disabled=false;Form1.sabun1.style.background="white";
		Form1.sabun2.disabled=false;Form1.sabun2.style.background="white";
		Form1.sabun3.disabled=false;Form1.sabun3.style.background="white";
		Form1.saupbutton.disabled=false;
		Form1.ipinbtn.disabled=true;
		Form1.sabun1.focus();
		break
	case "N" : 
		Form1.sabun1.disabled=true;Form1.sabun1.style.background="#F3F3F3";
		Form1.sabun2.disabled=true;Form1.sabun2.style.background="#F3F3F3";
		Form1.sabun3.disabled=true;Form1.sabun3.style.background="#F3F3F3";
		Form1.saupbutton.disabled=true;
		Form1.ipinbtn.disabled=false;
		break
	}
}

function OpenZip() {
	ZipWin = window.open('../Member/zipsearch.asp','zipsearch','toolbar=no,directories=no,menubar=no,status=no,scrollbars=yes,width=468,height=280');
}
		
function onlyNumber3() {
	if ((event.keyCode<48)||(event.keyCode>57)) {
		event.returnValue=false;
	}
}

function onlyNumber4() {
	if ((event.keyCode<48)||(event.keyCode>57)){
		event.returnValue=false;
	}
}

function onlyNumber5() {
	if ((event.keyCode<48)||(event.keyCode>57)){
		event.returnValue=false;
	}
}

function js_tab_order(arg,nextname,len) {  
	if (arg.value.length==len) {
		nextname.focus() ;
		return;
	}
}

function js_tab_order(arg,nextname,len) {  
	if (arg.value.length==len) {
		nextname.focus() ;
	        return;
	}
}

function AlertMessage(strText, focusObj) {
	alert( strText );
			    
	if ( focusObj != null ) {
		focusObj.focus();
	}
		    
	return false;
}

// 사업자등록번호 검사 페이지를 표시한다
function popBizCheck(bizno) {
	var str = '/Member/compno.asp?bizno=' + bizno;
	window.open(str, 'popupwin', 'width=450,height=372,scrollbars=no');
}

function popNameCheck(pName,pRnum1,pRnum2) {
//	var str = 'http://member.hostway.co.kr/Member/namecheck.asp?name=' + pName;
//	window.open(str, 'namepopupwin', 'width=650,height=572,scrollbars=no');
	document.Form1.action = "/member/namecheck_p.asp"
	document.Form1.target = "name_check"
	document.Form1.submit();
}

function bizno_check() {
	var str1 = document.Form1.sabun1.value;
	var str2 = document.Form1.sabun2.value;
	var str3 = document.Form1.sabun3.value;
	var str = str1 + "-" + str2 + "-" + str3;
	
	var biz = '';
	for(i=0; i<str.length; i++) {
		if (str.charAt(i) != " ") {
			biz = biz + str.charAt(i);
		}
	}

	// 사업자 등록번호 검사 규칙
	if( biz == "" ) {
		AlertMessage( "입력된 \"사업자 등록 번호\"가 없습니다", document.Form1.sabun1);
	}
	else if ( (str1 < 3 ) || (str2 < 2 && str2 != 01 ) || (str3 < 4 ) ) {

        // 
		AlertMessage( "\"사업자 등록 번호\"를 바르게 입력해 주십시요", document.Form1.sabun1);;
	}
	else if ( checkBizno() > 0 ) {
		popBizCheck(str);  // 사업자등록번호 검사
	}
}

//사업자 등록 번호 검사
function checkBizno() {
	if ( document.Form1.sabun1.value == "" ) {
		AlertMessage("\"사업자 등록번호\"를 입력하세요1", document.Form1.sabun1);
		return -1;
	}

	document.Form1.sabun2.value.replace( ' ', '' );
	if ( document.Form1.sabun2.value == "" ) {
		AlertMessage("\"사업자 등록번호\"를 입력하세요2", document.Form1.sabun2);
		return -1;
	}

	document.Form1.sabun3.value.replace( ' ', '' );
	if ( document.Form1.sabun3.value == "" ) {
		AlertMessage("\"사업자 등록번호\"를 입력하세요3", document.Form1.sabun3);
		return -1;
	}

	if ( document.Form1.sabun1.value.search(" ") != -1 ){
		AlertMessage("\"사업자 등록번호\" 사이의 공백을 제거하세요", document.Form1.sabun1);
	        return -1;
	}

	if ( document.Form1.sabun2.value.search(" ") != -1 ) {
		AlertMessage("\"사업자 등록번호\" 사이의 공백을 제거하세요", document.Form1.sabun2);
		return -1;
	}

	if ( document.Form1.sabun3.value.search(" ") != -1 ) {
		AlertMessage("\"사업자 등록번호\" 사이의 공백을 제거하세요", document.Form1.sabun3);
	        return -1;
	}

	var str_bizno1 = document.Form1.sabun1.value;
	var str_bizno2 = document.Form1.sabun2.value;
	var str_bizno3 = document.Form1.sabun3.value;
	 
	var digit=0
	for (var i=0;i<str_bizno1.length;i++){
		var str_dig=str_bizno1.substring(i,i+1);
		if (str_dig<'0' || str_dig>'9') { 
			AlertMessage("\"사업자 등록번호\"는 숫자로 입력하세요", document.Form1.sabun1);
			return -1;
		}
	}

	digit=0
	for (var i=0;i<str_bizno2.length;i++){
		var str_dig=str_bizno2.substring(i,i+1);
		if (str_dig<'0' || str_dig>'9') { 
			AlertMessage("\"사업자 등록번호\"는 숫자로 입력하세요", document.Form1.sabun2);
			return -1;
		}
	}

	digit=0
	for (var i=0;i<str_bizno3.length;i++){
		var str_dig=str_bizno3.substring(i,i+1);
		if (str_dig<'0' || str_dig>'9') { 
			AlertMessage("\"사업자 등록번호\"는 숫자로 입력하세요", document.Form1.sabun3);
			return -1;
		}
	}

	return 1;
}

function checkdam1() {
	if (document.Form1.dam1use.checked) {
		document.Form1.pricenm.value = document.Form1.usernm.value;
		document.Form1.pricetel1.value = document.Form1.tel1.value;
		document.Form1.pricetel2.value = document.Form1.tel2.value;
		document.Form1.pricetel3.value = document.Form1.tel3.value;
		document.Form1.priceemail.value = document.Form1.emailid.value;
	} else	{
		document.Form1.pricenm.value = "";
		document.Form1.pricetel1.value = "";
		document.Form1.pricetel2.value = "";
		document.Form1.pricetel3.value = "";
		document.Form1.priceemail.value;
	}
} 

function Opensearch() {
	ZipWin = window.open('/Member/namesearch.asp','namesearch','toolbar=no,directories=no,menubar=no,status=no,scrollbars=no,width=450,height=240');
}































function methcheck(ynvalue) {
	if (ynvalue == 'M') {
		//document.Form1.cardnm.disabled = true;Form1.cardnm.style.background="#F3F3F3";
		//document.Form1.cardtel1.disabled = true;Form1.cardtel1.style.background="#F3F3F3";
		//document.Form1.cardtel2.disabled = true;Form1.cardtel2.style.background="#F3F3F3";
		//document.Form1.cardtel3.disabled = true;Form1.cardtel3.style.background="#F3F3F3";
		//document.Form1.cardnumber.disabled = true;Form1.cardnumber.style.background="#F3F3F3";
		//document.Form1.cardyy.disabled = true;Form1.cardyy.style.background="#F3F3F3";
		//document.Form1.cardmm.disabled = true;Form1.cardmm.style.background="#F3F3F3";
		document.Form1.cardclick.value = "M";
	} else if (ynvalue == 'Y') {
		//document.Form1.cardnm.disabled = true;Form1.cardnm.style.background="#F3F3F3";
		//document.Form1.cardtel1.disabled = true;Form1.cardtel1.style.background="#F3F3F3";
		//document.Form1.cardtel2.disabled = true;Form1.cardtel2.style.background="#F3F3F3";
		//document.Form1.cardtel3.disabled = true;Form1.cardtel3.style.background="#F3F3F3";
		//document.Form1.cardnumber.disabled = true;Form1.cardnumber.style.background="#F3F3F3";
		//document.Form1.cardyy.disabled = true;Form1.cardyy.style.background="#F3F3F3";
		//document.Form1.cardmm.disabled = true;Form1.cardmm.style.background="#F3F3F3";
		document.Form1.cardclick.value = "Y";
	} else if (ynvalue == 'B') {
		//document.Form1.cardnm.disabled = true;Form1.cardnm.style.background="#F3F3F3";
		//document.Form1.cardtel1.disabled = true;Form1.cardtel1.style.background="#F3F3F3";
		//document.Form1.cardtel2.disabled = true;Form1.cardtel2.style.background="#F3F3F3";
		//document.Form1.cardtel3.disabled = true;Form1.cardtel3.style.background="#F3F3F3";
		//document.Form1.cardnumber.disabled = true;Form1.cardnumber.style.background="#F3F3F3";
		//document.Form1.cardyy.disabled = true;Form1.cardyy.style.background="#F3F3F3";
		//document.Form1.cardmm.disabled = true;Form1.cardmm.style.background="#F3F3F3";
		//document.Form1.cardclick.value = "B";	
	} else if (ynvalue == 'C') {
		//document.Form1.cardnm.disabled = false;Form1.cardnm.style.background="#ffffff";
		//document.Form1.cardtel1.disabled = false;Form1.cardtel1.style.background="#ffffff";
		//document.Form1.cardtel2.disabled = false;Form1.cardtel2.style.background="#ffffff";
		//document.Form1.cardtel3.disabled = false;Form1.cardtel3.style.background="#ffffff";
		//document.Form1.cardnumber.disabled = false;Form1.cardnumber.style.background="#ffffff";
		//document.Form1.cardyy.disabled = false;Form1.cardyy.style.background="#ffffff";
		//document.Form1.cardmm.disabled = false;Form1.cardmm.style.background="#ffffff";
		//document.Form1.cardclick.value = "C";
	} else if (ynvalue == 'A') {
		//document.Form1.cardnm.disabled = true;Form1.cardnm.style.background="#F3F3F3";
		//document.Form1.cardtel1.disabled = true;Form1.cardtel1.style.background="#F3F3F3";
		//document.Form1.cardtel2.disabled = true;Form1.cardtel2.style.background="#F3F3F3";
		//document.Form1.cardtel3.disabled = true;Form1.cardtel3.style.background="#F3F3F3";
		//document.Form1.cardnumber.disabled = true;Form1.cardnumber.style.background="#F3F3F3";
		//document.Form1.cardyy.disabled = true;Form1.cardyy.style.background="#F3F3F3";
		//document.Form1.cardmm.disabled = true;Form1.cardmm.style.background="#F3F3F3";
		document.Form1.cardclick.value = "A";	
	}	
}		


function OpenHelp() {
  HelpWin = window.open('/loginhelp.asp','Help','toolbar=no,directories=no,menubar=no,status=no,scrollbars=no,width=450,height=233');
}

function check() {
        if (document.login.id.value.length < 2 ) {
                alert("가입자 Email 아이디를 입력 하여 주십시오.");
				document.login.id.focus();
                return ;
        }
        if (document.login.pwd.value.length < 2 ) {
                alert("가입자 비밀번호를 입력 하여 주십시오.");
 				document.login.pwd.focus();
               return ;
        }
        
        document.login.submit();
        return true;
}

function check1() {
	if (document.search.domain.value.length < 1 ) {
		alert("www.와 co.kr, com등을 제외한 도메인명을 입력 하여 주십시오.");
		document.search.domain.focus();
        return ;
	}
        
    var domainnm = document.search.domain.value;
	var lsize = screen.Width/2-50;
	var tsize = screen.Height/2-50;
	window.open ("/Members/FindAccount.asp?domainnm="+domainnm+"","idpwd","left="+lsize+",top="+tsize+",width=10,height=10");
}

function Certificate() {
	var taxcate = document.Form1.usertype.options[document.Form1.usertype.selectedIndex].value;
	if(taxcate == "C") {
		checkform();
	}
	else {
		var reqNum = document.Form1.reqNum.value;
		var vDiscrNo = document.Form1.vDiscrNo.value;
		var name = document.Form1.name.value;
		var result = document.Form1.result.value;
		var age = document.Form1.age.value;
		var sex = document.Form1.sex.value;
		var ip = document.Form1.ip.value;
		var authInfo = document.Form1.authInfo.value;
		var birth = document.Form1.birth.value;
		var fgn = document.Form1.fgn.value;
		var discrHash = document.Form1.discrHash.value;

		if(!reqNum || !vDiscrNo || !name || !result || !age || !sex || !ip || !authInfo || !birth || !fgn || !discrHash)
			alert("아이핀 인증이 제대로 이루어 지지 않았습니다.\n다시 시도해 주십시오.");
		else
			checkform();
	}
}

// ipin_result_seed.asp에서 tmpSaveipin 호출, 아이핀인증의 최종결과를 반영하는 함수
function tmpSaveipin(reqNum, vDiscrNo, name, result, age, sex, ip, authInfo, birth, fgn, discrHash) {
	var tmpUserNm = document.Form1.usernm.value;

	if(tmpUserNm != name) {
		alert("대표자 성명과 아이핀 인증결과의 내역이 다릅니다.\n본인 명의의 아이핀 정보로 다시 아이핀인증을 해주십시오.");
		location.reload();
	}
	else if(result == 1) {
		var origreqNum = document.Form1.reqNum.value;

		if(origreqNum == reqNum) {

		document.Form1.reqNum.value = reqNum;
		document.Form1.vDiscrNo.value = vDiscrNo;
		document.Form1.name.value = name;
		document.Form1.result.value = result;
		document.Form1.age.value = age;
		document.Form1.sex.value = sex;
		document.Form1.ip.value = ip;
		document.Form1.authInfo.value = authInfo;
		document.Form1.birth.value = birth;
		document.Form1.fgn.value = fgn;
		document.Form1.discrHash.value = discrHash;
		document.Form1.namecheck.value = "Y";
		document.Form1.usernm.disabled = true;
		}
		else alert("아이핀 인증 결과가 정확하지 않습니다.\n");
	}
	else
		alert("아이핀 인증이 실패 하였습니다.");
}

var CBA_window;

function openCBAWindow() {
	var tmpUserNm = document.Form1.usernm.value;

	if(tmpUserNm == "") {
		alert("대표자 성명을 입력해주세요.");
		document.Form1.usernm.focus();
	}
	else {

	CBA_window = window.open('', 'IPINWindow', 'width=450, height=500, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0, left=300, top=200' );

	if(CBA_window == null) {
		alert(" ※ 윈도우 XP SP2 또는 인터넷 익스플로러 7 사용자일 경우에는 \n    화면 상단에 있는 팝업 차단 알림줄을 클릭하여 팝업을 허용해 주시기 바랍니다. \n\n※ MSN,야후,구글 팝업 차단 툴바가 설치된 경우 팝업허용을 해주시기 바랍니다.");
	}

	document.reqCBAForm.action = 'https://ipin.siren24.com/i-PIN/jsp/ipin_j10.jsp';
	document.reqCBAForm.target = 'IPINWindow';
	document.reqCBAForm.submit();
	}
}

// 결제정보 시작
function pay(pay) {
	var paystyle = document;

	if(pay == "card") {
		paystyle.getElementById('cardtable').style.display = "block";
		paystyle.getElementById('accounttable').style.display = "none";
		paystyle.getElementById('monthlytable').style.display = "none";
	}
	else if(pay == "account") {
		paystyle.getElementById('cardtable').style.display = "none";
		paystyle.getElementById('accounttable').style.display = "block";
		paystyle.getElementById('monthlytable').style.display = "none";
	}
	else if(pay == "monthly") {
		paystyle.getElementById('cardtable').style.display = "none";
		paystyle.getElementById('accounttable').style.display = "none";
		paystyle.getElementById('monthlytable').style.display = "block";
	}
}
// 결제정보 끝

// 본인인증 시작
window.name ="Parent_window";
function CheckPlus() {
	var CPF = document.Form1;
	var PriceName = CPF.pricenm.value;

	if(PriceName == "" || PriceName.length < 2) {
		alert("요금 담당자 이름을 입력해주세요.");
		CPF.pricenm.focus();
		return false;
	}
	window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
	document.form_chk.target = "popupChk";
	document.form_chk.submit();
}
// 본인인증 끝
