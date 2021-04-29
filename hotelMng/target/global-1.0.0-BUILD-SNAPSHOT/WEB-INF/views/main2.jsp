<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<HTML>
<HEAD>
<TITLE>The Hosting Company - HOSTWAY</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/style.css" type="text/css">
<script type="text/javascript" src="/resources/info.js"></script>
<script type="text/javascript">

/*
 * 인증요청 및 결과화면 처리 
 */
function doPay_ActiveX(){
    ret = xpay_check(document.getElementById('LGD_PAYINFO'), 'service');

    if (ret=="00"){     //ActiveX 로딩 성공  
        var LGD_RESPCODE    = dpop.getData('LGD_RESPCODE');       //결과코드
        var LGD_RESPMSG     = dpop.getData('LGD_RESPMSG');        //결과메세지
                      
        if( "0000" == LGD_RESPCODE ) { //인증성공
            var LGD_BILLKEY         = dpop.getData('LGD_BILLKEY');        //추후 빌링시 카드번호 대신 입력할 값입니다.
            var LGD_PAYTYPE         = dpop.getData('LGD_PAYTYPE');        //인증수단
            var LGD_PAYDATE         = dpop.getData('LGD_PAYDATE');        //인증일시
            var LGD_FINANCECODE     = dpop.getData('LGD_FINANCECODE');    //인증기관코드
            var LGD_FINANCENAME     = dpop.getData('LGD_FINANCENAME');    //인증기관이름    
                         
            var msg = "인증결과 : " + LGD_RESPMSG + "\n";            
            msg += "LG텔레콤빌링키 : " + LGD_BILLKEY +"\n";
            msg += "인증일시 : " + LGD_PAYDATE +"\n";
            msg += "인증기관코드 : " + LGD_FINANCECODE +"\n";
            msg += "인증기관이름 : " + LGD_FINANCENAME +"\n";
                                                  
            alert("인증에 성공했습니다.");

		document.Form1.LGD_RESPCODE.value = LGD_RESPCODE;
		document.Form1.LGD_RESPMSG.value = LGD_RESPMSG;
		document.Form1.LGD_BILLKEY.value = LGD_BILLKEY;
		document.Form1.LGD_PAYDATE.value = LGD_PAYDATE;
		document.Form1.LGD_FINANCECODE.value = LGD_FINANCECODE;
		document.Form1.LGD_FINANCENAME.value = LGD_FINANCENAME;

            /*
             * 인증성공 화면 처리
             */        
        } else { //인증실패
            alert("인증이 실패하였습니다. " + LGD_RESPMSG);

		document.Form1.LGD_RESPCODE.value = LGD_RESPCODE;
		document.Form1.LGD_RESPMSG.value = LGD_RESPMSG;

            /*
             * 인증실패 화면 처리
             */        
        }
    } else {
        alert("LG텔레콤 전자결제를 위한 ActiveX 설치 실패");
    }     
}
        
</script>

<script>
function popup()
{
	window.open("login/pop_bill.html","ad_pop","width=300,height=280,toolbar=no,scrollbars=no");
}
</script>
</HEAD>
<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
<!-- <table width="100%" border="0" cellspacing="0" bgcolor="#004284" cellpadding="0"> -->
<table width="100%" border="0" cellspacing="0"  cellpadding="0" background="/images/bg.gif"> 

  <tr> 
    <td align="left" valign="middle" width="57%"><img src="/images/logo.gif"  alt="" border="0" ></td>
    <td align="right" valign="middle" width="29%">&nbsp;</td>
    <!-- <td valign="middle" width="14%"><img src="/images/top_img.gif" width="46" height="56"></td> -->
  </tr>
  <tr> 
<!--
	<td background="/images/2_column_06.gif" align="left" valign="middle" colspan="3"><img src="images/2_column_06.gif" width=790 height=7 alt=""></td>
-->
	<!-- <td background="/images/2_column_06.gif" align="left" valign="middle" colspan="3"></td> -->
  </tr>
</table>
<br>
<TABLE WIDTH=795 BORDER=0 CELLPADDING=0 CELLSPACING=0 align="center">
  <TR height="4"> 
<!--
	<TD COLSPAN=5 height="4"> <IMG SRC="images/2_column_01.gif" WIDTH=795 HEIGHT=4 ALT=""></TD>
-->
	<TD COLSPAN=5 height="4"></TD>
  </TR>
  <TR> 
    <TD width="5"> <IMG SRC="/images/spacer.gif" WIDTH=5 HEIGHT=1 ALT=""></TD>
    <TD width="179"> <IMG SRC="/images/spacer.gif" WIDTH=179 HEIGHT=1 ALT=""></TD>
    <TD width="11"> <IMG SRC="/images/spacer.gif" WIDTH=11 HEIGHT=1 ALT=""></TD>
    <TD width="526"> <IMG SRC="/images/spacer.gif" WIDTH=526 HEIGHT=1 ALT=""></TD>
    <TD> <IMG SRC="/images/spacer.gif" WIDTH=74 HEIGHT=1 ALT=""></TD>
  </TR>
<!-- AceCounter Log Gathering Script V.71.2010011401 -->
<script language='javascript'>
if(typeof _GUL == 'undefined'){
var _JV="AMZ2010011401";//script Version
var _GUL = 'gtp1.acecounter.com';var _GPT='8080'; var _AIMG = new Image(); var _bn=navigator.appName; var _PR = location.protocol=="https:"?"https://"+_GUL:"http://"+_GUL+":"+_GPT;if( _bn.indexOf("Netscape") > -1 || _bn=="Mozilla"){ setTimeout("_AIMG.src = _PR+'/?cookie';",1); } else{ _AIMG.src = _PR+'/?cookie'; };	
var _GCD = 'AH2C30185113113'; // gcode
var _UD='undefined';var _UN='unknown';var _mset=0;
function _IX(s,t){return s.indexOf(t)}
function _GV(b,a,c,d){ var f = b.split(c);for(var i=0;i<f.length; i++){ if( _IX(f[i],(a+d))==0) return f[i].substring(_IX(f[i],(a+d))+(a.length+d.length),f[i].length); }	return ''; }
function _XV(b,a,c,d,e){ var f = b.split(c);var g='';for(var i=0;i<f.length; i++){ if( _IX(f[i],(a+d))==0){ try{eval(e+"=f[i].substring(_IX(f[i],(a+d))+(a.length+d.length),f[i].length);");}catch(_e){}; continue;}else{ if(g) g+= '&'; g+= f[i];}; } return g;};
function _NOB(a){return (a!=_UD&&a>0)?new Object(a):new Object()}
function _NIM(){return new Image()}
function _IL(a){return a!=_UD?a.length:0}
function _VF(a,b){return a!=_UD&&(typeof a==b)?1:0}
function _LST(a,b){if(_IX(a,b)) a=a.substring(0,_IL(a));return a}
function _CST(a,b){if(_IX(a,b)>0) a=a.substring(_IX(a,b)+_IL(b),_IL(a));return a}
function _UL(a){a=_LST(a,'#');a=_CST(a,'://');if(a.length>512){a=a.substring(0,511);};return a}
function _AA(a){return new Array(a?a:0)}
_DC = document.cookie ;
function _AGC(nm) { var cn = nm + "="; var nl = cn.length; var cl = _DC.length; var i = 0; while ( i < cl ) { var j = i + nl; if ( _DC.substring( i, j ) == cn ){ var val = _DC.indexOf(";", j ); if ( val == -1 ) val = _DC.length; return unescape(_DC.substring(j, val)); }; i = _DC.indexOf(" ", i ) + 1; if ( i == 0 ) break; } return ''; }
function _ASC( nm, val, exp ){var expd = new Date(); if ( exp ){ expd.setTime( expd.getTime() + ( exp * 1000 )); document.cookie = nm+"="+ escape(val) + "; expires="+ expd.toGMTString() +"; path="; }else{ document.cookie = nm + "=" + escape(val);};}
function SetUID() {     var newid = ''; var d = new Date(); var t = Math.floor(d.getTime()/1000); newid = 'UID-' + t.toString(16).toUpperCase(); for ( var i = 0; i < 16; i++ ){ var n = Math.floor(Math.random() * 16).toString(16).toUpperCase(); newid += n; }       return newid; }
var _FCV = _AGC("ACEFCID"); if ( !_FCV ) { _FCV = SetUID(); _ASC( "ACEFCID", _FCV , 86400 * 30 * 12 ); _FCV=_AGC("ACEFCID");}
var _AIO = _NIM(); var _AIU = _NIM();  var _AIW = _NIM();  var _AIX = _NIM();  var _AIB = _NIM();  var __hdki_xit = _NIM();
var _gX='/?xuid='+_GCD+'&sv='+_JV,_gF='/?fuid='+_GCD+'&sv='+_JV,_gU='/?uid='+_GCD+'&sv='+_JV+"&FCV="+_FCV,_gE='/?euid='+_GCD+'&sv='+_JV,_gW='/?wuid='+_GCD+'&sv='+_JV,_gO='/?ouid='+_GCD+'&sv='+_JV,_gB='/?buid='+_GCD+'&sv='+_JV;
function _IDV(a){return (typeof a!=_UD)?1:0}

var _d=_rf=_fwd=_arg=_xrg=_av=_bv=_rl=_ak=_xrl=_cd=_cu=_bz='',_sv=11,_tz=20,_ja=_sc=_ul=_ua=_UA=_os=_vs=_UN,_je='n',_bR='blockedReferrer';
if(!_IDV(_CODE)) var _CODE = '' ;
_tz = Math.floor((new Date()).getTimezoneOffset()/60) + 29 ;if( _tz > 24 ) _tz = _tz - 24 ;
// Javascript Variables
if(!_IDV(_amt)) var _amt=0 ;if(!_IDV(_pk)) var _pk='' ;if(!_IDV(_pd)) var _pd='';if(!_IDV(_ct)) var _ct='';
if(!_IDV(_ll)) var _ll='';if(!_IDV(_ag)) var _ag=0;	if(!_IDV(_id)) var _id='' ;if(!_IDV(_mr)) var _mr = _UN;
if(!_IDV(_gd)) var _gd=_UN;if(!_IDV(_jn)) var _jn='';if(!_IDV(_jid)) var _jid='';if(!_IDV(_skey)) var _skey='';
if(!_IDV(_ud1)) var _ud1='';if(!_IDV(_ud2)) var _ud2='';if(!_IDV(_ud3)) var _ud3='';
if( !_ag ){ _ag = 0 ; }else{ _ag = parseInt(_ag); }
if( _ag < 0 || _ag > 150 ){ _ag = 0; }
if( _gd != 'man' && _gd != 'woman' ){ _gd =_UN;};if( _mr != 'married' && _mr != 'single' ){ _mr =_UN;};if( _jn != 'join' && _jn != 'withdraw' ){ _jn ='';};
if( _id != '' ){ _mset|=1 };
if( _jid != '' ){ _mset|=2 };
_je = (navigator.javaEnabled()==true)?'1':'0';_bn=navigator.appName;
if(_bn.substring(0,9)=="Microsoft") _bn="MSIE";
_bN=(_bn=="Netscape"),_bI=(_bn=="MSIE"),_bO=(_IX(navigator.userAgent,"Opera")>-1);if(_bO)_bI='';
_bz=navigator.appName; _pf=navigator.platform; _av=navigator.appVersion; _bv=parseFloat(_av) ;
if(_bI){_cu=navigator.cpuClass;}else{_cu=navigator.oscpu;};
if((_bn=="MSIE")&&(parseInt(_bv)==2)) _bv=3.01;_rf=document.referrer;var _prl='';var _frm=false;
function _WO(a,b,c){window.open(a,b,c)}
function ACEF_Tracking(a,b,c,d,e,f){ if(!_IDV(b)){var b = 'FLASH';}; if(!_IDV(e)){ var e = '0';};if(!_IDV(c)){ var c = '';};if(!_IDV(d)){ var d = '';}; var a_org=a; b = b.toUpperCase(); var b_org=b;	if(b_org=='FLASH_S'){ b='FLASH'; }; if( typeof CU_rl == 'undefined' ) var CU_rl = _PT(); if(_IDV(_GCD)){ var _AF_rl = document.URL; if(a.indexOf('://') < 0  && b_org != 'FLASH_S' ){ var _AT_rl  = ''; if( _AF_rl.indexOf('?') > 0 ){ _AF_rl = _AF_rl.substring(0,_AF_rl.indexOf('?'));}; var spurl = _AF_rl.split('/') ;	for(var ti=0;ti < spurl.length ; ti ++ ){ if( ti == spurl.length-1 ){ break ;}; if( _AT_rl  == '' ){ _AT_rl  = spurl[ti]; }else{ _AT_rl  += '/'+spurl[ti];}; }; var _AU_arg = ''; if( a.indexOf('?') > 0 ){ _AU_arg = a.substring(a.indexOf('?'),a.length); a = a.substring(0,a.indexOf('?')); }; var spurlt = a.split('/') ; if( spurlt.length > 0 ){ a = spurlt[spurlt.length-1];}; a = _AT_rl +'/'+a+_AU_arg;	_AF_rl=document.URL;}; _AF_rl = _AF_rl.substring(_AF_rl.indexOf('//')+2,_AF_rl.length); if( typeof f == 'undefined' ){ var f = a }else{f='http://'+_AF_rl.substring(0,_AF_rl.indexOf('/')+1)+f}; var _AS_rl = CU_rl+'/?xuid='+_GCD+'&url='+escape(_AF_rl)+'&xlnk='+escape(f)+'&fdv='+b+'&idx='+e+'&'; var _AF_img = new Image(); _AF_img.src = _AS_rl; if( b_org == 'FLASH' && a_org != '' ){ if(c==''){ window.location.href = a_org; }else{ if(d==''){ window.open(a_org,c);}else{ window.open(a_org,c,d); };};	};} ; }
function _PT(){return location.protocol=="https:"?"https://"+_GUL:"http://"+_GUL+":"+_GPT}
function _EL(a,b,c){if(a.addEventListener){a.addEventListener(b,c,false)}else if(a.attachEvent){a.attachEvent("on"+b,c)} }
function _NA(a){return new Array(a?a:0)}
function _ER(a,b,c,d){_xrg=_PT()+_gW+"&url="+escape(_UL(document.URL))+"&err="+((typeof a=="string")?a:"Unknown")+"&ern="+c+"&bz="+_bz+"&bv="+_vs+"&RID="+Math.random()+"&";
if(_IX(_bn,"Netscape") > -1 || _bn == "Mozilla"){ setTimeout("_AIW.src=_xrg;",1); } else{ _AIW.src=_xrg; } }
function _PL(a){if(!_IL(a))a=_UL(document.URL);
_arg = _PT()+_gU;
if( typeof _ERR !=_UD && _ERR == 'err'){ _arg = _PT()+_gE;};
_AIU.src = _arg+"&url="+escape(a)+"&ref="+escape(_rf)+"&cpu="+_cu+"&bz="+_bz+"&bv="+_vs+"&os="+_os+"&dim="+_d+"&cd="+_cd+"&je="+_je+"&jv="+_sv+"&tz="+_tz+"&ul="+_ul+"&ad_key="+escape(_ak)+"&skey="+escape(_skey)+"&age="+_ag+"&gender="+_gd+"&marry="+_mr+"&join="+_jn+"&mset="+_mset+"&udf1="+_ud1+"&udf2="+_ud2+"&udf3="+_ud3+"&amt="+_amt+"&frwd="+_fwd+"&pd="+escape(_pd)+"&ct="+escape(_ct)+"&ll="+escape(_ll)+"&RID="+Math.random()+"&";
setTimeout("",300);
}
_EL(window,"error",_ER); //window Error
if( typeof window.screen == 'object'){_sv=12;_d=screen.width+'*'+screen.height;_sc=_bI?screen.colorDepth:screen.pixelDepth;if(_sc==_UD)_sc=_UN;}
_ro=_NA();if(_ro.toSource||(_bI&&_ro.shift))_sv=13;
if( top && typeof top == 'object' &&_IL(top.frames)){eval("try{_rl=top.document.URL;}catch(_e){_rl='';};"); if( _rl != document.URL ) _frm = true;};
if(_frm){ eval("try{_prl = top.document.URL;}catch(_e){_prl=_bR;};"); if(_prl == '') eval("try{_prl=parent.document.URL;}catch(_e){_prl='';};"); 
if( _IX(_prl,'#') > 0 ) _prl=_prl.substring(0,_IX(_prl,'#')); 
_prl=_LST(_prl,'#');
if( _IX(_rf,'#') > 0 ) _rf=_rf.substring(0,_IX(_rf,'#')); 
_prl=_LST(_prl,'/');_rf=_LST(_rf,'/');
if( _rf == '' ) eval("try{_rf=parent.document.URL;}catch(_e){_rf=_bR;}"); 
if(_rf==_bR||_prl==_bR){ _rf='',_prl='';}; if( _rf == _prl ){ eval("try{_rf=top.document.referrer;}catch(_e){_rf='';}"); 
if( _rf == ''){ _rf = 'bookmark';};if( _IX(document.cookie,'ACENASP_CK='+escape(_rf)) > -1 ){ _rf = _prl;} 
else{ 
if(_IX(_prl,'?') > 0){ _ak = _prl.substring(_IX(_prl,'?')+1,_prl.length); _prl = _ak; }
_fwd = _GV(_ak,'FWDIDX','&','=');
if( _IX(_prl.toUpperCase(),'OVRAW=') >= 0 ){ _ak = 'src=overture&kw='+_GV(_prl.toUpperCase(),'OVRAW','&','=')+'&OVRAW='+_GV(_prl.toUpperCase(),'OVRAW','&','=')+'&OVKEY='+_GV(_prl.toUpperCase(),'OVKEY','&','=')+'&OVMTC='+_GV(_prl.toUpperCase(),'OVMTC','&','=').toLowerCase() }; 
if(_IX(_prl,'gclid=') >= 0 ){ _ak='src=adwords'; }; if(_IX(_prl,'DWIT=') >= 0 ){_ak='src=dnet_cb';}; 
if( _IX(_prl,"rcsite=") >= 0 &&  _IX(_prl,"rctype=") >= 0){ _prl += '&'; _ak = _prl.substring(_IX(_prl,'rcsite='),_prl.indexOf('&',_IX(_prl,'rcsite=')+7))+'-'+_prl.substring(_IX(_prl,'rctype=')+7,_prl.indexOf('&',_IX(_prl,'rctype=')+7))+'&'; };
if( _GV(_prl,'src','&','=') ) _ak += '&src='+_GV(_prl,'src','&','='); if( _GV(_prl,'kw','&','=') ) _ak += '&kw='+_GV(_prl,'kw','&','='); if(_prl.length>0){ _prl = _XV(_prl,'FWDRL','&','=','_rf'); _rf = unescape(_rf); _ak = _XV(_ak,'FWDRL','&','=','_prl'); }; if( typeof FD_ref=='string' && FD_ref != '' ) _rf = FD_ref;
document.cookie='ACENASP_CK='+escape(_rf)+';path=/;'; 
}; 
if(document.URL.indexOf('?')>0 && ( _IX(_ak,'rcsite=') < 0 && _IX(_ak,'NVAR=') < 0 && _IX(_ak,'src=') < 0 && _IX(_ak,'source=') < 0 ) ) _ak =document.URL.substring(document.URL.indexOf('?')+1,document.URL.length); }; 
}
else{ 
_rf=_LST(_rf,'#');_ak=_CST(document.URL,'?');
if( _IX(_ak,"rcsite=") > 0 &&  _IX(_ak,"rctype=") > 0){
    _ak += '&';
    _ak = _ak.substring(_IX(_ak,'rcsite='),_ak.indexOf('&',_IX(_ak,'rcsite=')+7))+'-'+_ak.substring(_IX(_ak,'rctype=')+7,_ak.indexOf('&',_IX(_ak,'rctype=')+7))+'&';
}
}
_rl=document.URL;
var _trl = _rl.split('?'); if(_trl.length>1){ _trl[1] = _XV(_trl[1],'FWDRL','&','=','_rf'); _rf = unescape(_rf); _fwd = _GV(_trl[1],'FWDIDX','&','='); _rl=_trl.join('?'); 
_ak = _XV(_ak,'FWDRL','&','=','_prl');
}; if( typeof FD_ref=='string' && FD_ref != '' ) _rf = FD_ref;
if( _rf.indexOf('googlesyndication.com') > 0 ){ 
var _rf_idx = _rf.indexOf('&url=');  if( _rf_idx > 0 ){ var _rf_t = unescape(_rf.substring(_rf_idx+5,_rf.indexOf('&',_rf_idx+5)));  if( _rf_t.length > 0 ){ _rf = _rf_t ;};  };  };
_rl = _UL(_rl); _rf = _UL(_rf);

if( typeof _rf_t != 'undefined' && _rf_t != '' ) _rf = _rf_t ;
if( typeof _ak_t != 'undefined' && _ak_t != '' ) _ak = _ak_t ;
if(_ak.length>512){_ak=_ak.substring(0,512);};
if( typeof _rf==_UD||( _rf == '' )) _rf = 'bookmark' ;_cd=(_bI)?screen.colorDepth:screen.pixelDepth;
_UA = navigator.userAgent;_ua = navigator.userAgent.toLowerCase();
if (navigator.language){  _ul = navigator.language.toLowerCase();}else if(navigator.userLanguage){  _ul = navigator.userLanguage.toLowerCase();};

_st = _IX(_UA,';') ;if(_st > 0 ){ _end = _UA.indexOf(')',_st);};_str = _UA.substring(_st, _end);_if = _str.split('; ');_cmp = _UN ; 
if(_bI){	_cmp = navigator.appName; _str = _if[1].substring(5, _if[1].length); if( _IX(_cmp,'Mobile') >= 0 ) _str = _if[3].substring(8, _if[3].length); _vs = (parseFloat(_str)).toString();} 
else if ( (_st = _IX(_ua,"opera")) >= 0){_cmp = "Opera" ;_vs = _ua.substring(_st+6, _ua.indexOf('.',_st+6)); } 
else if ((_st = _IX(_ua,"firefox")) >= 0){_cmp = "Firefox"; _vs = _ua.substring(_st+8, _ua.indexOf('.',_st+8)); } 
else if ((_st = _IX(_ua,"netscape6")) >= 0){ _cmp = "Netscape"; _vs = _ua.substring(_st+10, _ua.length);  if ((_st = _IX(_vs,"b")) > 0 ) { _str = _vs.substring(0,_IX(_vs,"b")); _vs = _str ;  };} 
else if ((_st = _IX(_ua,"netscape/7")) >= 0){  _cmp = "Netscape";  _vs = _ua.substring(_st+9, _ua.length);  if ((_st = _IX(_vs,"b")) > 0 ){ _str = _vs.substring(0,_IX(_vs,"b")); _vs = _str;};
}else{ if (_IX(_ua,"gecko") > 0){ if(_IX(_ua,"safari")>=0){ _cmp = "Safari";_ut = _ua.split(' ');for( var ii=0;ii<_ut.length;ii++) if(_IX(_ut[ii],'version')>=0){ _vst = (_ut[ii]+'/').split('/'); _vs = _vst[1];} }else{ _cmp = navigator.vendor;  } }else if (_IX(_ua,"nav") >= 0){ _cmp = "Netscape Navigator";}else{ _cmp = navigator.appName;}; _av = _UA ; }
if (_IX(_vs,'.')<0){  _vs = _vs + '.0'}
_bz = _cmp; 

var Asp_Link_ssn={s:20100707,n:'AH2C30185113113',g:_GUL,p:_GPT,pu:document.URL,m:[],run:Asp_Link_ssn?Asp_Link_ssn.n:this.n};
function ACEF_Click(file,menu){if((typeof file!='number') && (file!='') && (typeof menu!='number') && (menu!='')){eval("LA_"+Asp_Link_ssn.n+"('"+ file+"','"+ menu +  "')");} };
function LA_AH2C30185113113(){var ssn=Asp_Link_ssn;var f={tt:function(o){var r;r=o.getAttribute(s.tt);if(typeof r !='object'){if(r.length!=0){return '{:' +r+':}';};};return '';},a:function(s){var r='';r=s;if((r.indexOf('//') <= -1) && (r.indexOf('http') <=-1) && (r!='')){if(r.charAt(0)=='/'){r=r.substr(1,r.length);};if(r.substr(r.length-1,1)=='/'){r=r.substr(0,r.length-1)}return r;};return '';},b:function(s){var re = "/[~!@\#$%<>^&*\/()\=+\']/gi";var so='';so=s;if(re.test(so)){return 1;}else{return 0;} },d:function(s){var r=String(s); return r.toUpperCase();},e:function(s,t){return s.indexOf(t);},f:function(o){var a;a=o;if(f.d(a.tagName)=='A' || f.d(a.tagName)=='AREA'){return a;}else if(f.d(a.tagName)=='BODY'){return 0;}else{return f.f(a.parentNode);} },g:function(sr){var r='';var ar='';r=sr.substr(f.e(sr,'{'),sr.length);r=r.replace('{','');r=r.replace('}','');return r;},n:function(s){return s.replace(/\n|\s|/g,'');},ea:function(c,f){var wd;if(c=='click'){wd=window.document;}else{wd=window;}if(wd.addEventListener){wd.addEventListener(c,f,false)}else if(wd.attachEvent){wd.attachEvent("on"+c,f)} } };
var p={h:location.host,p:(location.protocol=='https:')?"https://"+ssn.g:"http://"+ssn.g+":"+ssn.p,s:'/?xuid='+ssn.n+'&sv='+ssn.s,u:function(){var r=''; r=String(ssn.pu);r=r.replace('#',''); return r+'';},ol:new Image(0,0),olf:new Image(0,0),xL:function(x){if(typeof(Amz_T_e)==s.u){p.ol.src=p.p+p.s+'&url='+escape(p.u())+'&xlnk='+escape(x)+'&xidx=0&crn='+Math.random()+'&';ssn.m.push(p.ol);} },xF:function(x){if(typeof(Amz_T_e)==s.u){p.olf.src=p.p+p.s+'&url='+escape(p.u())+'&xlnk=http://'+p.h+'/'+escape(x)+'&fdv=FLASH&xidx=0&';ssn.m.push(p.olf);} } };
var s={Lp:'a.tagName=="IMG"||a.tagName=="B" || a.tagName=="I" || a.tagName== "U" || a.tagName== "FONT" || a.tagName=="STRONG" || a.tagName=="I" || a.tagName=="A" || a.tagName=="AREA"',tt:'title',l:'load',c:'click',f:'function',j:'javascript:',u:'undefined',n:'number'};
var c={Run:function(){if(f.e(navigator.userAgent,'Chrome/1') > -1){return 0;}f.ea('click',this.ec);},ec:function(e){var ok='';var m = document.all ? event.srcElement : e.target;var a=m;if(eval(s.Lp)){ok=c.lc(m);if(ok.length != 0){p.xL(unescape(ok));};} },lc:function(o){try{var ar='',tf=0,obj=o;var a=o;if((f.d(o.tagName)=='IMG') && (typeof o.onclick == s.f)){tf=1;ar = String(o.onclick);}else if(eval(s.Lp)){obj=f.f(o);if(typeof obj.onclick==s.f){tf=1;ar = String(obj.onclick);}else if(typeof obj!=s.n){tf=0;ar = String(obj.href);};}if(ar.length==0){return'';};ar=f.n(ar);ar=ar.replace(/'|"|#/g,' ');if(f.e(ar,'void(') == -1 && f.e(ar,'void0') == -1){if(tf==1){ar=f.g(ar);if(ar==''){return '';};	if(f.e(ar,s.j) == -1){return s.j + ar;}else{return ar;};}else{return ar;};}else{return s.j + 'void(0)';};return '';}catch(_e){alert(_e);return '';};} };
if(p.u().charAt(1) != ':'){switch(arguments.length){case 0:if((ssn.n!=ssn.run)){c.Run();}break;case 2:if(ssn.n!=ssn.run){if((f.e(f.d(arguments[0]),'.SWF') > -1) && ( f.b(arguments[0])!=1 )){if(f.a(arguments[1])!=''){p.xF(arguments[0] +'/'+ f.a(arguments[1]));};} }break;};}
};eval('LA_'+Asp_Link_ssn.n+ '();');

if( _IX(_pf,_UD) >= 0 || _pf ==  '' ){ _os = _UN ;}else{ _os = _pf ; };
if( _IX(_os,'Win32') >= 0 ){if( _IX(_av,'98')>=0){ _os = 'Windows 98';}else if( _IX(_av,'95')>=0 ){ _os = 'Windows 95';}else if( _IX(_av,'Me')>=0 ){ _os = 'Windows Me';}else if( _IX(_av,'NT')>=0 ){ _os = 'Windows NT';}else{ _os = 'Windows';};if( _IX(_ua,'nt 5.0')>=0){ _os = 'Windows 2000';};if( _IX(_ua,'nt 5.1')>=0){_os = 'Windows XP';if( _IX(_ua,'sv1') > 0 ){_os = 'Windows XP SP2';};};if( _IX(_ua,'nt 5.2')>=0){_os ='Windows Server 2003';};if( _IX(_ua,'nt 6.0')>=0){_os ='Windows Vista';};if( _IX(_ua,'nt 6.1')>=0){_os ='Windows 7';};};
_pf_s = _pf.substring(0,4);if( _pf_s == 'Wind'){if( _pf_s == 'Win1'){_os = 'Windows 3.1';}else if( _pf_s == 'Mac6' ){ _os = 'Mac';}else if( _pf_s == 'MacO' ){ _os ='Mac';}else if( _pf_s == 'MacP' ){_os='Mac';}else if(_pf_s == 'Linu'){_os='Linux';}else if( _pf_s == 'WebT' ){ _os='WebTV';}else if(  _pf_s =='OSF1' ){ _os ='Compaq Open VMS';}else if(_pf_s == 'HP-U' ){ _os='HP Unix';}else if(  _pf_s == 'OS/2' ){ _os = 'OS/2' ;}else if( _pf_s == 'AIX4' ){ _os = 'AIX';}else if( _pf_s == 'Free' ){ _os = 'FreeBSD';}else if( _pf_s == 'SunO' ){ _os = 'SunO';}else if( _pf_s == 'Drea' ){ _os = 'Drea'; }else if( _pf_s == 'Plan' ){ _os = 'Plan'; }else{ _os = _UN; };};
if( _cu == 'x86' ){ _cu = 'Intel x86';}else if( _cu == 'PPC' ){ _cu = 'Power PC';}else if( _cu == '68k' ){ _cu = 'Motorola 680x';}else if( _cu == 'Alpha' ){ _cu = 'Compaq Alpa';}else if( _cu == 'Arm' ){ _cu = 'ARM';}else{ _cu = _UN;};if( _d == '' || typeof _d==_UD ){ _d = '0*0';}
_PL(_rl); // Site Logging
}
</script>
<!-- AceCounter Log Gathering Script End -->
  <TR> 
    <TD width="5" height="476">&nbsp;</TD>		
    <TD colspan="4" height="476">&nbsp; <!-- AceCounter Log Gathering Script V.71.2010011401 -->
<script language='javascript'>
if(typeof _GUL == 'undefined'){
var _JV="AMZ2010011401";//script Version
var _GUL = 'gtp1.acecounter.com';var _GPT='8080'; var _AIMG = new Image(); var _bn=navigator.appName; var _PR = location.protocol=="https:"?"https://"+_GUL:"http://"+_GUL+":"+_GPT;if( _bn.indexOf("Netscape") > -1 || _bn=="Mozilla"){ setTimeout("_AIMG.src = _PR+'/?cookie';",1); } else{ _AIMG.src = _PR+'/?cookie'; };	
var _GCD = 'AH2C30185113113'; // gcode
var _UD='undefined';var _UN='unknown';var _mset=0;
function _IX(s,t){return s.indexOf(t)}
function _GV(b,a,c,d){ var f = b.split(c);for(var i=0;i<f.length; i++){ if( _IX(f[i],(a+d))==0) return f[i].substring(_IX(f[i],(a+d))+(a.length+d.length),f[i].length); }	return ''; }
function _XV(b,a,c,d,e){ var f = b.split(c);var g='';for(var i=0;i<f.length; i++){ if( _IX(f[i],(a+d))==0){ try{eval(e+"=f[i].substring(_IX(f[i],(a+d))+(a.length+d.length),f[i].length);");}catch(_e){}; continue;}else{ if(g) g+= '&'; g+= f[i];}; } return g;};
function _NOB(a){return (a!=_UD&&a>0)?new Object(a):new Object()}
function _NIM(){return new Image()}
function _IL(a){return a!=_UD?a.length:0}
function _VF(a,b){return a!=_UD&&(typeof a==b)?1:0}
function _LST(a,b){if(_IX(a,b)) a=a.substring(0,_IL(a));return a}
function _CST(a,b){if(_IX(a,b)>0) a=a.substring(_IX(a,b)+_IL(b),_IL(a));return a}
function _UL(a){a=_LST(a,'#');a=_CST(a,'://');if(a.length>512){a=a.substring(0,511);};return a}
function _AA(a){return new Array(a?a:0)}
_DC = document.cookie ;
function _AGC(nm) { var cn = nm + "="; var nl = cn.length; var cl = _DC.length; var i = 0; while ( i < cl ) { var j = i + nl; if ( _DC.substring( i, j ) == cn ){ var val = _DC.indexOf(";", j ); if ( val == -1 ) val = _DC.length; return unescape(_DC.substring(j, val)); }; i = _DC.indexOf(" ", i ) + 1; if ( i == 0 ) break; } return ''; }
function _ASC( nm, val, exp ){var expd = new Date(); if ( exp ){ expd.setTime( expd.getTime() + ( exp * 1000 )); document.cookie = nm+"="+ escape(val) + "; expires="+ expd.toGMTString() +"; path="; }else{ document.cookie = nm + "=" + escape(val);};}
function SetUID() {     var newid = ''; var d = new Date(); var t = Math.floor(d.getTime()/1000); newid = 'UID-' + t.toString(16).toUpperCase(); for ( var i = 0; i < 16; i++ ){ var n = Math.floor(Math.random() * 16).toString(16).toUpperCase(); newid += n; }       return newid; }
var _FCV = _AGC("ACEFCID"); if ( !_FCV ) { _FCV = SetUID(); _ASC( "ACEFCID", _FCV , 86400 * 30 * 12 ); _FCV=_AGC("ACEFCID");}
var _AIO = _NIM(); var _AIU = _NIM();  var _AIW = _NIM();  var _AIX = _NIM();  var _AIB = _NIM();  var __hdki_xit = _NIM();
var _gX='/?xuid='+_GCD+'&sv='+_JV,_gF='/?fuid='+_GCD+'&sv='+_JV,_gU='/?uid='+_GCD+'&sv='+_JV+"&FCV="+_FCV,_gE='/?euid='+_GCD+'&sv='+_JV,_gW='/?wuid='+_GCD+'&sv='+_JV,_gO='/?ouid='+_GCD+'&sv='+_JV,_gB='/?buid='+_GCD+'&sv='+_JV;
function _IDV(a){return (typeof a!=_UD)?1:0}

var _d=_rf=_fwd=_arg=_xrg=_av=_bv=_rl=_ak=_xrl=_cd=_cu=_bz='',_sv=11,_tz=20,_ja=_sc=_ul=_ua=_UA=_os=_vs=_UN,_je='n',_bR='blockedReferrer';
if(!_IDV(_CODE)) var _CODE = '' ;
_tz = Math.floor((new Date()).getTimezoneOffset()/60) + 29 ;if( _tz > 24 ) _tz = _tz - 24 ;
// Javascript Variables
if(!_IDV(_amt)) var _amt=0 ;if(!_IDV(_pk)) var _pk='' ;if(!_IDV(_pd)) var _pd='';if(!_IDV(_ct)) var _ct='';
if(!_IDV(_ll)) var _ll='';if(!_IDV(_ag)) var _ag=0;	if(!_IDV(_id)) var _id='' ;if(!_IDV(_mr)) var _mr = _UN;
if(!_IDV(_gd)) var _gd=_UN;if(!_IDV(_jn)) var _jn='';if(!_IDV(_jid)) var _jid='';if(!_IDV(_skey)) var _skey='';
if(!_IDV(_ud1)) var _ud1='';if(!_IDV(_ud2)) var _ud2='';if(!_IDV(_ud3)) var _ud3='';
if( !_ag ){ _ag = 0 ; }else{ _ag = parseInt(_ag); }
if( _ag < 0 || _ag > 150 ){ _ag = 0; }
if( _gd != 'man' && _gd != 'woman' ){ _gd =_UN;};if( _mr != 'married' && _mr != 'single' ){ _mr =_UN;};if( _jn != 'join' && _jn != 'withdraw' ){ _jn ='';};
if( _id != '' ){ _mset|=1 };
if( _jid != '' ){ _mset|=2 };
_je = (navigator.javaEnabled()==true)?'1':'0';_bn=navigator.appName;
if(_bn.substring(0,9)=="Microsoft") _bn="MSIE";
_bN=(_bn=="Netscape"),_bI=(_bn=="MSIE"),_bO=(_IX(navigator.userAgent,"Opera")>-1);if(_bO)_bI='';
_bz=navigator.appName; _pf=navigator.platform; _av=navigator.appVersion; _bv=parseFloat(_av) ;
if(_bI){_cu=navigator.cpuClass;}else{_cu=navigator.oscpu;};
if((_bn=="MSIE")&&(parseInt(_bv)==2)) _bv=3.01;_rf=document.referrer;var _prl='';var _frm=false;
function _WO(a,b,c){window.open(a,b,c)}
function ACEF_Tracking(a,b,c,d,e,f){ if(!_IDV(b)){var b = 'FLASH';}; if(!_IDV(e)){ var e = '0';};if(!_IDV(c)){ var c = '';};if(!_IDV(d)){ var d = '';}; var a_org=a; b = b.toUpperCase(); var b_org=b;	if(b_org=='FLASH_S'){ b='FLASH'; }; if( typeof CU_rl == 'undefined' ) var CU_rl = _PT(); if(_IDV(_GCD)){ var _AF_rl = document.URL; if(a.indexOf('://') < 0  && b_org != 'FLASH_S' ){ var _AT_rl  = ''; if( _AF_rl.indexOf('?') > 0 ){ _AF_rl = _AF_rl.substring(0,_AF_rl.indexOf('?'));}; var spurl = _AF_rl.split('/') ;	for(var ti=0;ti < spurl.length ; ti ++ ){ if( ti == spurl.length-1 ){ break ;}; if( _AT_rl  == '' ){ _AT_rl  = spurl[ti]; }else{ _AT_rl  += '/'+spurl[ti];}; }; var _AU_arg = ''; if( a.indexOf('?') > 0 ){ _AU_arg = a.substring(a.indexOf('?'),a.length); a = a.substring(0,a.indexOf('?')); }; var spurlt = a.split('/') ; if( spurlt.length > 0 ){ a = spurlt[spurlt.length-1];}; a = _AT_rl +'/'+a+_AU_arg;	_AF_rl=document.URL;}; _AF_rl = _AF_rl.substring(_AF_rl.indexOf('//')+2,_AF_rl.length); if( typeof f == 'undefined' ){ var f = a }else{f='http://'+_AF_rl.substring(0,_AF_rl.indexOf('/')+1)+f}; var _AS_rl = CU_rl+'/?xuid='+_GCD+'&url='+escape(_AF_rl)+'&xlnk='+escape(f)+'&fdv='+b+'&idx='+e+'&'; var _AF_img = new Image(); _AF_img.src = _AS_rl; if( b_org == 'FLASH' && a_org != '' ){ if(c==''){ window.location.href = a_org; }else{ if(d==''){ window.open(a_org,c);}else{ window.open(a_org,c,d); };};	};} ; }
function _PT(){return location.protocol=="https:"?"https://"+_GUL:"http://"+_GUL+":"+_GPT}
function _EL(a,b,c){if(a.addEventListener){a.addEventListener(b,c,false)}else if(a.attachEvent){a.attachEvent("on"+b,c)} }
function _NA(a){return new Array(a?a:0)}
function _ER(a,b,c,d){_xrg=_PT()+_gW+"&url="+escape(_UL(document.URL))+"&err="+((typeof a=="string")?a:"Unknown")+"&ern="+c+"&bz="+_bz+"&bv="+_vs+"&RID="+Math.random()+"&";
if(_IX(_bn,"Netscape") > -1 || _bn == "Mozilla"){ setTimeout("_AIW.src=_xrg;",1); } else{ _AIW.src=_xrg; } }
function _PL(a){if(!_IL(a))a=_UL(document.URL);
_arg = _PT()+_gU;
if( typeof _ERR !=_UD && _ERR == 'err'){ _arg = _PT()+_gE;};
_AIU.src = _arg+"&url="+escape(a)+"&ref="+escape(_rf)+"&cpu="+_cu+"&bz="+_bz+"&bv="+_vs+"&os="+_os+"&dim="+_d+"&cd="+_cd+"&je="+_je+"&jv="+_sv+"&tz="+_tz+"&ul="+_ul+"&ad_key="+escape(_ak)+"&skey="+escape(_skey)+"&age="+_ag+"&gender="+_gd+"&marry="+_mr+"&join="+_jn+"&mset="+_mset+"&udf1="+_ud1+"&udf2="+_ud2+"&udf3="+_ud3+"&amt="+_amt+"&frwd="+_fwd+"&pd="+escape(_pd)+"&ct="+escape(_ct)+"&ll="+escape(_ll)+"&RID="+Math.random()+"&";
setTimeout("",300);
}
_EL(window,"error",_ER); //window Error
if( typeof window.screen == 'object'){_sv=12;_d=screen.width+'*'+screen.height;_sc=_bI?screen.colorDepth:screen.pixelDepth;if(_sc==_UD)_sc=_UN;}
_ro=_NA();if(_ro.toSource||(_bI&&_ro.shift))_sv=13;
if( top && typeof top == 'object' &&_IL(top.frames)){eval("try{_rl=top.document.URL;}catch(_e){_rl='';};"); if( _rl != document.URL ) _frm = true;};
if(_frm){ eval("try{_prl = top.document.URL;}catch(_e){_prl=_bR;};"); if(_prl == '') eval("try{_prl=parent.document.URL;}catch(_e){_prl='';};"); 
if( _IX(_prl,'#') > 0 ) _prl=_prl.substring(0,_IX(_prl,'#')); 
_prl=_LST(_prl,'#');
if( _IX(_rf,'#') > 0 ) _rf=_rf.substring(0,_IX(_rf,'#')); 
_prl=_LST(_prl,'/');_rf=_LST(_rf,'/');
if( _rf == '' ) eval("try{_rf=parent.document.URL;}catch(_e){_rf=_bR;}"); 
if(_rf==_bR||_prl==_bR){ _rf='',_prl='';}; if( _rf == _prl ){ eval("try{_rf=top.document.referrer;}catch(_e){_rf='';}"); 
if( _rf == ''){ _rf = 'bookmark';};if( _IX(document.cookie,'ACENASP_CK='+escape(_rf)) > -1 ){ _rf = _prl;} 
else{ 
if(_IX(_prl,'?') > 0){ _ak = _prl.substring(_IX(_prl,'?')+1,_prl.length); _prl = _ak; }
_fwd = _GV(_ak,'FWDIDX','&','=');
if( _IX(_prl.toUpperCase(),'OVRAW=') >= 0 ){ _ak = 'src=overture&kw='+_GV(_prl.toUpperCase(),'OVRAW','&','=')+'&OVRAW='+_GV(_prl.toUpperCase(),'OVRAW','&','=')+'&OVKEY='+_GV(_prl.toUpperCase(),'OVKEY','&','=')+'&OVMTC='+_GV(_prl.toUpperCase(),'OVMTC','&','=').toLowerCase() }; 
if(_IX(_prl,'gclid=') >= 0 ){ _ak='src=adwords'; }; if(_IX(_prl,'DWIT=') >= 0 ){_ak='src=dnet_cb';}; 
if( _IX(_prl,"rcsite=") >= 0 &&  _IX(_prl,"rctype=") >= 0){ _prl += '&'; _ak = _prl.substring(_IX(_prl,'rcsite='),_prl.indexOf('&',_IX(_prl,'rcsite=')+7))+'-'+_prl.substring(_IX(_prl,'rctype=')+7,_prl.indexOf('&',_IX(_prl,'rctype=')+7))+'&'; };
if( _GV(_prl,'src','&','=') ) _ak += '&src='+_GV(_prl,'src','&','='); if( _GV(_prl,'kw','&','=') ) _ak += '&kw='+_GV(_prl,'kw','&','='); if(_prl.length>0){ _prl = _XV(_prl,'FWDRL','&','=','_rf'); _rf = unescape(_rf); _ak = _XV(_ak,'FWDRL','&','=','_prl'); }; if( typeof FD_ref=='string' && FD_ref != '' ) _rf = FD_ref;
document.cookie='ACENASP_CK='+escape(_rf)+';path=/;'; 
}; 
if(document.URL.indexOf('?')>0 && ( _IX(_ak,'rcsite=') < 0 && _IX(_ak,'NVAR=') < 0 && _IX(_ak,'src=') < 0 && _IX(_ak,'source=') < 0 ) ) _ak =document.URL.substring(document.URL.indexOf('?')+1,document.URL.length); }; 
}
else{ 
_rf=_LST(_rf,'#');_ak=_CST(document.URL,'?');
if( _IX(_ak,"rcsite=") > 0 &&  _IX(_ak,"rctype=") > 0){
    _ak += '&';
    _ak = _ak.substring(_IX(_ak,'rcsite='),_ak.indexOf('&',_IX(_ak,'rcsite=')+7))+'-'+_ak.substring(_IX(_ak,'rctype=')+7,_ak.indexOf('&',_IX(_ak,'rctype=')+7))+'&';
}
}
_rl=document.URL;
var _trl = _rl.split('?'); if(_trl.length>1){ _trl[1] = _XV(_trl[1],'FWDRL','&','=','_rf'); _rf = unescape(_rf); _fwd = _GV(_trl[1],'FWDIDX','&','='); _rl=_trl.join('?'); 
_ak = _XV(_ak,'FWDRL','&','=','_prl');
}; if( typeof FD_ref=='string' && FD_ref != '' ) _rf = FD_ref;
if( _rf.indexOf('googlesyndication.com') > 0 ){ 
var _rf_idx = _rf.indexOf('&url=');  if( _rf_idx > 0 ){ var _rf_t = unescape(_rf.substring(_rf_idx+5,_rf.indexOf('&',_rf_idx+5)));  if( _rf_t.length > 0 ){ _rf = _rf_t ;};  };  };
_rl = _UL(_rl); _rf = _UL(_rf);

if( typeof _rf_t != 'undefined' && _rf_t != '' ) _rf = _rf_t ;
if( typeof _ak_t != 'undefined' && _ak_t != '' ) _ak = _ak_t ;
if(_ak.length>512){_ak=_ak.substring(0,512);};
if( typeof _rf==_UD||( _rf == '' )) _rf = 'bookmark' ;_cd=(_bI)?screen.colorDepth:screen.pixelDepth;
_UA = navigator.userAgent;_ua = navigator.userAgent.toLowerCase();
if (navigator.language){  _ul = navigator.language.toLowerCase();}else if(navigator.userLanguage){  _ul = navigator.userLanguage.toLowerCase();};

_st = _IX(_UA,';') ;if(_st > 0 ){ _end = _UA.indexOf(')',_st);};_str = _UA.substring(_st, _end);_if = _str.split('; ');_cmp = _UN ; 
if(_bI){	_cmp = navigator.appName; _str = _if[1].substring(5, _if[1].length); if( _IX(_cmp,'Mobile') >= 0 ) _str = _if[3].substring(8, _if[3].length); _vs = (parseFloat(_str)).toString();} 
else if ( (_st = _IX(_ua,"opera")) >= 0){_cmp = "Opera" ;_vs = _ua.substring(_st+6, _ua.indexOf('.',_st+6)); } 
else if ((_st = _IX(_ua,"firefox")) >= 0){_cmp = "Firefox"; _vs = _ua.substring(_st+8, _ua.indexOf('.',_st+8)); } 
else if ((_st = _IX(_ua,"netscape6")) >= 0){ _cmp = "Netscape"; _vs = _ua.substring(_st+10, _ua.length);  if ((_st = _IX(_vs,"b")) > 0 ) { _str = _vs.substring(0,_IX(_vs,"b")); _vs = _str ;  };} 
else if ((_st = _IX(_ua,"netscape/7")) >= 0){  _cmp = "Netscape";  _vs = _ua.substring(_st+9, _ua.length);  if ((_st = _IX(_vs,"b")) > 0 ){ _str = _vs.substring(0,_IX(_vs,"b")); _vs = _str;};
}else{ if (_IX(_ua,"gecko") > 0){ if(_IX(_ua,"safari")>=0){ _cmp = "Safari";_ut = _ua.split(' ');for( var ii=0;ii<_ut.length;ii++) if(_IX(_ut[ii],'version')>=0){ _vst = (_ut[ii]+'/').split('/'); _vs = _vst[1];} }else{ _cmp = navigator.vendor;  } }else if (_IX(_ua,"nav") >= 0){ _cmp = "Netscape Navigator";}else{ _cmp = navigator.appName;}; _av = _UA ; }
if (_IX(_vs,'.')<0){  _vs = _vs + '.0'}
_bz = _cmp; 

var Asp_Link_ssn={s:20100707,n:'AH2C30185113113',g:_GUL,p:_GPT,pu:document.URL,m:[],run:Asp_Link_ssn?Asp_Link_ssn.n:this.n};
function ACEF_Click(file,menu){if((typeof file!='number') && (file!='') && (typeof menu!='number') && (menu!='')){eval("LA_"+Asp_Link_ssn.n+"('"+ file+"','"+ menu +  "')");} };
function LA_AH2C30185113113(){var ssn=Asp_Link_ssn;var f={tt:function(o){var r;r=o.getAttribute(s.tt);if(typeof r !='object'){if(r.length!=0){return '{:' +r+':}';};};return '';},a:function(s){var r='';r=s;if((r.indexOf('//') <= -1) && (r.indexOf('http') <=-1) && (r!='')){if(r.charAt(0)=='/'){r=r.substr(1,r.length);};if(r.substr(r.length-1,1)=='/'){r=r.substr(0,r.length-1)}return r;};return '';},b:function(s){var re = "/[~!@\#$%<>^&*\/()\=+\']/gi";var so='';so=s;if(re.test(so)){return 1;}else{return 0;} },d:function(s){var r=String(s); return r.toUpperCase();},e:function(s,t){return s.indexOf(t);},f:function(o){var a;a=o;if(f.d(a.tagName)=='A' || f.d(a.tagName)=='AREA'){return a;}else if(f.d(a.tagName)=='BODY'){return 0;}else{return f.f(a.parentNode);} },g:function(sr){var r='';var ar='';r=sr.substr(f.e(sr,'{'),sr.length);r=r.replace('{','');r=r.replace('}','');return r;},n:function(s){return s.replace(/\n|\s|/g,'');},ea:function(c,f){var wd;if(c=='click'){wd=window.document;}else{wd=window;}if(wd.addEventListener){wd.addEventListener(c,f,false)}else if(wd.attachEvent){wd.attachEvent("on"+c,f)} } };
var p={h:location.host,p:(location.protocol=='https:')?"https://"+ssn.g:"http://"+ssn.g+":"+ssn.p,s:'/?xuid='+ssn.n+'&sv='+ssn.s,u:function(){var r=''; r=String(ssn.pu);r=r.replace('#',''); return r+'';},ol:new Image(0,0),olf:new Image(0,0),xL:function(x){if(typeof(Amz_T_e)==s.u){p.ol.src=p.p+p.s+'&url='+escape(p.u())+'&xlnk='+escape(x)+'&xidx=0&crn='+Math.random()+'&';ssn.m.push(p.ol);} },xF:function(x){if(typeof(Amz_T_e)==s.u){p.olf.src=p.p+p.s+'&url='+escape(p.u())+'&xlnk=http://'+p.h+'/'+escape(x)+'&fdv=FLASH&xidx=0&';ssn.m.push(p.olf);} } };
var s={Lp:'a.tagName=="IMG"||a.tagName=="B" || a.tagName=="I" || a.tagName== "U" || a.tagName== "FONT" || a.tagName=="STRONG" || a.tagName=="I" || a.tagName=="A" || a.tagName=="AREA"',tt:'title',l:'load',c:'click',f:'function',j:'javascript:',u:'undefined',n:'number'};
var c={Run:function(){if(f.e(navigator.userAgent,'Chrome/1') > -1){return 0;}f.ea('click',this.ec);},ec:function(e){var ok='';var m = document.all ? event.srcElement : e.target;var a=m;if(eval(s.Lp)){ok=c.lc(m);if(ok.length != 0){p.xL(unescape(ok));};} },lc:function(o){try{var ar='',tf=0,obj=o;var a=o;if((f.d(o.tagName)=='IMG') && (typeof o.onclick == s.f)){tf=1;ar = String(o.onclick);}else if(eval(s.Lp)){obj=f.f(o);if(typeof obj.onclick==s.f){tf=1;ar = String(obj.onclick);}else if(typeof obj!=s.n){tf=0;ar = String(obj.href);};}if(ar.length==0){return'';};ar=f.n(ar);ar=ar.replace(/'|"|#/g,' ');if(f.e(ar,'void(') == -1 && f.e(ar,'void0') == -1){if(tf==1){ar=f.g(ar);if(ar==''){return '';};	if(f.e(ar,s.j) == -1){return s.j + ar;}else{return ar;};}else{return ar;};}else{return s.j + 'void(0)';};return '';}catch(_e){alert(_e);return '';};} };
if(p.u().charAt(1) != ':'){switch(arguments.length){case 0:if((ssn.n!=ssn.run)){c.Run();}break;case 2:if(ssn.n!=ssn.run){if((f.e(f.d(arguments[0]),'.SWF') > -1) && ( f.b(arguments[0])!=1 )){if(f.a(arguments[1])!=''){p.xF(arguments[0] +'/'+ f.a(arguments[1]));};} }break;};}
};eval('LA_'+Asp_Link_ssn.n+ '();');

if( _IX(_pf,_UD) >= 0 || _pf ==  '' ){ _os = _UN ;}else{ _os = _pf ; };
if( _IX(_os,'Win32') >= 0 ){if( _IX(_av,'98')>=0){ _os = 'Windows 98';}else if( _IX(_av,'95')>=0 ){ _os = 'Windows 95';}else if( _IX(_av,'Me')>=0 ){ _os = 'Windows Me';}else if( _IX(_av,'NT')>=0 ){ _os = 'Windows NT';}else{ _os = 'Windows';};if( _IX(_ua,'nt 5.0')>=0){ _os = 'Windows 2000';};if( _IX(_ua,'nt 5.1')>=0){_os = 'Windows XP';if( _IX(_ua,'sv1') > 0 ){_os = 'Windows XP SP2';};};if( _IX(_ua,'nt 5.2')>=0){_os ='Windows Server 2003';};if( _IX(_ua,'nt 6.0')>=0){_os ='Windows Vista';};if( _IX(_ua,'nt 6.1')>=0){_os ='Windows 7';};};
_pf_s = _pf.substring(0,4);if( _pf_s == 'Wind'){if( _pf_s == 'Win1'){_os = 'Windows 3.1';}else if( _pf_s == 'Mac6' ){ _os = 'Mac';}else if( _pf_s == 'MacO' ){ _os ='Mac';}else if( _pf_s == 'MacP' ){_os='Mac';}else if(_pf_s == 'Linu'){_os='Linux';}else if( _pf_s == 'WebT' ){ _os='WebTV';}else if(  _pf_s =='OSF1' ){ _os ='Compaq Open VMS';}else if(_pf_s == 'HP-U' ){ _os='HP Unix';}else if(  _pf_s == 'OS/2' ){ _os = 'OS/2' ;}else if( _pf_s == 'AIX4' ){ _os = 'AIX';}else if( _pf_s == 'Free' ){ _os = 'FreeBSD';}else if( _pf_s == 'SunO' ){ _os = 'SunO';}else if( _pf_s == 'Drea' ){ _os = 'Drea'; }else if( _pf_s == 'Plan' ){ _os = 'Plan'; }else{ _os = _UN; };};
if( _cu == 'x86' ){ _cu = 'Intel x86';}else if( _cu == 'PPC' ){ _cu = 'Power PC';}else if( _cu == '68k' ){ _cu = 'Motorola 680x';}else if( _cu == 'Alpha' ){ _cu = 'Compaq Alpa';}else if( _cu == 'Arm' ){ _cu = 'ARM';}else{ _cu = _UN;};if( _d == '' || typeof _d==_UD ){ _d = '0*0';}
_PL(_rl); // Site Logging
}
</script>
<!-- AceCounter Log Gathering Script End -->
<script language="JavaScript" src="/js/info.js"> </script> 

<!--실명확인팝업 요청 form --------------------------->
<form name="reqCBAForm" method="post" action="" style="display: none;">  
	<input type="hidden" name="reqInfo" value="7DC995DBF784981BD5BEDBF6CB477EF564263A49E35609B8AA2E5BD7E87205BBA473E2C4E3E96575EB33E94C2400C9A084985CB8B909BF1755C0726C51ADC82C94601F8523814569814411FCE8C86AF2148A75D92EA5CBAED07BF15B2DB998A5C5DDA98021832EF640DA1D0BDA6A4EF501BDC500397230FF980596675CE9E86040234C4A759C5A59C003E190312FBC94A4BF24B0AD0A503005005592698E5184C624BB11B8B332B44FA6FC2B9467B60E5B6007C82ADFCA3993D1C06C2F6B38E6">     <!--실명확인 회원사 아이디-->
	<input type="hidden" name="retUrl" value="23https://member.hostway.co.kr/Reg_member/I_pin/ipin_popup_seed.asp">      <!--실명확인 결과수신 URL-->
	<input type="button" value="i-PIN" class="Form5" onclick="javascript:openCBAWindow();">
</form>
<!--End 실명확인팝업 요청 form ----------------------->

<!---------------------  본인인증 폼 시작 ------------------>
<!-- 본인인증 서비스 팝업을 호출하기 위해서는 다음과 같은 form이 필요합니다. -->
<form name="form_chk" method="post">
	<input type="hidden" name="m" value="checkplusSerivce">				<!-- 필수 데이타로, 누락하시면 안됩니다. -->
	<input type="hidden" name="EncodeData" value="AgAFRzQ0NjI8Do6BqFTOhjDz73axijAKF8RrjHVNfrZRfCH8ZBrCi43zT5p3AO/knPnniTYB3opPAJ/RMwlDQiv3wzjdJXgsiQs+7mU306BtFAsAX3qNxc+qEVek4ixm9P2uGMEnIavgPMHpHycYQzxU1e40ASePiuSexr+HF0PYyuiMg/S9LN50UjvAV/ihMl0FR3d+z+ghgPBnkXESnBqZNmKR5jGLx4hkJPKT7mMO5b2q9oL8WMJp/ACSH9ccYpw+w4fqCeJQEGpkPQ8B4uiEAb1HNB1HzrOdMmaGJM7N00bZ5KmW+6JRrHAswSyVtXc5XQuwzfiboRIlgMN/YKbLjVuQtSNFkOMsdBkZwvhPvdbR87ZTtyuNLp37yu0x2imppYy4bpzSf0Ox+nVRUvgT8wYn3DErkr6LQDMC+kCMmUAunqmlQLiy43Jaua4OM5x0kI2Xp+aZJnjduqyjGkKVEqEJFLfB1onHMrDll76VtRYFCRsN/J8MuHtVyXaU8pKAlo0S8oEXFdMFBeZ7YJlJUwMNqzHgKkZWcxx1DM8V1j1gUjI/DA==">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	    
    <!-- 업체에서 응답받기 원하는 데이타를 설정하기 위해 사용할 수 있으며, 인증결과 응답시 해당 값을 그대로 송신합니다.
    	   해당 파라미터는 추가하실 수 없습니다. -->
	<input type="hidden" name="param_r1" value="">
	<input type="hidden" name="param_r2" value="">
	<input type="hidden" name="param_r3" value="">
</form>
<!---------------------  본인인증 폼 시작 ------------------>


<table width="95%" border="0" cellspacing="0" cellpadding="0">
<tr> 
<td align="center"> 
	<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr> 
	<td><img src="/images/title2-6.gif" width="520" height="40"></td>
	</tr>
	<tr> 
	<td>
<!---------------------  회원 가입 폼 시작 ------------------>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
		<form name="Form1" id="LGD_PAYINFO" action="./regist_p.asp" method="POST">
		<tr style="display: none;">
		<td id="ipinHtml">
			<input type="hidden" name="reqNum" id="reqNum" value="20190107105843655084">
			<input type="hidden" name="vDiscrNo" id="vDiscrNo">
			<input type="hidden" name="name" id="name">
			<input type="hidden" name="result" id="result">
			<input type="hidden" name="age" id="age">
			<input type="hidden" name="sex" id="sex">
			<input type="hidden" name="ip" id="ip">
			<input type="hidden" name="authInfo" id="authInfo">
			<input type="hidden" name="birth" id="birth">
			<input type="hidden" name="fgn" id="fgn">
			<input type="hidden" name="discrHash" id="discrHash">
		</td>
		</tr>
		<tr style="display: none;">
		<td id="checkplusHtml">
			<input type="hidden" name="sName" id="sName">
			<input type="hidden" name="sCipherTime" id="sCipherTime">
			<input type="hidden" name="sRequestNumber" id="sRequestNumber">
			<input type="hidden" name="sResponseNumber" id="sResponseNumber">
			<input type="hidden" name="sAuthType" id="sAuthType">
			<input type="hidden" name="sDupInfo" id="sDupInfo">
			<input type="hidden" name="sConnInfo" id="sConnInfo">
			<input type="hidden" name="sGender" id="sGender">
			<input type="hidden" name="sBirthDate" id="sBirthDate">
			<input type="hidden" name="sNationalInfo" id="sNationalInfo">
			<input type="hidden" name="sMobileNO" id="sMobileNO">
		</td>
		</tr>
		<tr>
		<td align="center" valign="top" width="765" bgcolor="#ffffff" colspan="3"> 
			<table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" ALIGN="center">
			<tr>
			<td class=txt><img src="/images/server-i3.gif" width="11" height="11" align="absmiddle"> 
				&nbsp;회원 가입은 무료이며 저희 <b><font color="#3366CC">베스핀글로벌</font></b>이 제공해 드리는 다양하고 차별화된 서비스를 누리실 수 있습니다.<br>
				<img src="/images/server-i3.gif" width="11" height="11" align="absmiddle"> 
				&nbsp;서비스 신청 / 추가 시 매번 신상정보를 입력하지 않아도 됩니다.<br>
				<img src="/images/server-i3.gif" width="11" height="11" align="absmiddle"> 
				&nbsp;요금 담당자 정보로 사용료메일이 발송됩니다. 항상 최신의 정보로 유지해 주십시오.<br> 
			</td>
			</tr>
			</table>
			<br><img src="/images/m-center1-line2.gif" width="550" height="3"><br>
			<table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" ALIGN="center">
			<tr> 
			<td> 
				<table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" ALIGN="center">
				<tr>
				<td><img src="/images/i2.gif" width="12" height="10">
					&nbsp;<b>기본메일계정 ID 설정</b> (베스핀글로벌 사용자 페이지에 접근이 가능한 정보입니다.)</td>
				</tr>
				</table>
			</td>
			</tr>
			<tr> 
			<td HEIGHT="1"><spacer TYPE="BLOCK" HEIGHT="1"></td>
			</tr>
			<tr> 
			<td HEIGHT="1"><spacer TYPE="BLOCK" HEIGHT="1"></td>
			</tr>
			<tr> 
			<td HEIGHT="50" VALIGN="top"> 
				<table WIDTH="100%" BORDER="0" CELLSPACING="1" CELLPADDING="2" ALIGN="center" bgcolor="#CCCCCC">
				<tr bgcolor="#CCCCCC"> 
				<td align="right" height="22" bgcolor="#f5f5f5">ID : </td>
				<td align="left" valign="center" bgcolor="#FFFFFF">
					<input type="text" size="25" class="Form3" maxlength="50" name="emailid" readonly onClick="Opensearch();">
					<input name="namebutton" type="button" value="Email 아이디 입력(hanmail 계정불가)" class="Form5" style="width:220;height:20" onClick="Opensearch();">
				</td>
				</tr>
				<tr bgcolor="#CCCCCC"> 
				<td align="right" height="22" bgcolor="#f5f5f5">비밀번호 : </td>
				<td align="left" valign="center" bgcolor="#FFFFFF"> 
					<input type="Password" class="Form3" name="pwd" size="15" maxlength="15">
					<font color="#996600">(영문소문자 4~15자 이내)</font></td>
				</tr>
				<tr bgcolor="#CCCCCC"> 
				<td align="right" height="22" bgcolor="#f5f5f5">비밀번호확인 :</td>
				<td bgcolor="#FFFFFF"> 
					<input type="Password" class="Form3" name="pwd_re" size="15" maxlength="15">
				</td>
				</tr>
				</table>
			</td>
			</tr>
			<tr> 
			<td HEIGHT="16"><img src="/images/m-center1-line1.gif" width="550" height="3"><spacer TYPE="BLOCK" HEIGHT="16"></td>
			</tr>
			</table>
			<br>
			<table WIDTH="100%" BORDER="0" CELLSPACING="1&quot;" CELLPADDING="0" ALIGN="center">
			<tr> 
			<td width="50%" align="left"><b>1. 가입자 정보</b>&nbsp; 
				<select name="usertype" onchange="checktax();">
				<option value="C">사업자의 경우 
				<option value="N">개인의 경우 
				</select>
			</td>
			<td width="50%" align="right"> &nbsp;&nbsp;<img src="/images/server-i2.gif" valign="absmiddle" width="9" height="9"> 표시가 된 항목은 필수 입력 사항입니다. &nbsp;</td>
			</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tr> 
			<td> 
				<table border="0" cellpadding="3" cellspacing="1" width="100%" bordercolorlight="#083D8D" bgcolor="#CCCCCC">
				<tr> 
				<td bgcolor="#f5f5f5" width="120" align="right">
					<img src="/images/server-i2.gif" width="9" height="9"> 대표자 성명 </td>
				<td bgcolor="white">
					<input type="text" size="17" class="Form3" maxlength="20" name="usernm" onFocus="document.Form1.namecheck.value=''">
				</td>
				<td bgcolor="#f5f5f5" align="right">아이핀인증 </td>
				<td bgcolor="white" align="left"> 
					<input type="button" name="ipinbtn" id="ipinbtn" value="i-PIN" class="Form5" onclick="javascript:openCBAWindow();" disabled> <font color="#FF0000">(미성년자 가입불가)</font>
				</td>
				</tr>
				<iframe id="name_check" name="name_check" width="0" height="0"></iframe>
				<tr>
				<td bgcolor="#f5f5f5" width="120" align="right"><img src="/images/server-i2.gif" width="9" height="9"> 전화번호 </td>
				<td bgcolor="white"> 
					<input type="text" class="Form3" name="tel1" size="4" maxlength="4" onkeypress="onlyNumber3();">
					- 
					<input type="text" class="Form3" name="tel2" size="4" maxlength="4" onkeypress="onlyNumber3();">
					- 
					<input type="text" class="Form3" name="tel3" size="4" maxlength="4" onkeypress="onlyNumber3();">
				</td>
				<td bgcolor="#f5f5f5" align="right"><FONT color="BROWN"><B>휴대전화</B>(SMS발송용)</font> </td>
				<td bgcolor="#ffffff"> 
					<select name="hp1">
						<option value="">선택</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					- 
					<input type="text" class="Form3" name="hp2" size="4" maxlength="4" onkeypress="onlyNumber3();">
					- 
					<input type="text" class="Form3" name="hp3" size="4" maxlength="4" onkeypress="onlyNumber3();">
				</td>
				</tr>
				<tr> 
				<td bgcolor="#f5f5f5" align="right" width="120">사업자등록번호 </td>
				<td bgcolor="white" colspan="3"> 
					<input type="text" name="sabun1" maxlength="3" size="3" class="Form3" onkeypress="onlyNumber3();">
					- 
					<input type="text" name="sabun2" maxlength="2" size="2" class="Form3" onkeypress="onlyNumber4();">
					- 
					<input type="text" name="sabun3" maxlength="5" size="5" class="Form3" onkeypress="onlyNumber5();">
					<input type="button" value="세금계산서정보 확인" class="Form5" style="width:125;height:20" onClick="bizno_check();" name="saupbutton">
					<input type="hidden" name="CompNm" value>
					<input type="hidden" name="Nm" value>
					<input type="hidden" name="CompType" value>
					<input type="hidden" name="JongMok" value>
					<input type="hidden" name="Addr" value>
					<input type="hidden" name="No" value>
					<input type="hidden" name="HostType" value>
					<input type="hidden" name="namecheck">
				</td>
				</tr>
				<!--
				<tr> 
				<td bgcolor="#f5f5f5" align="right" width="120">세금계산서 수령 Mail</td>
				<td bgcolor="white" colspan="3"> 
					<input type="text" size="25" class="Form3" maxlength="50" name="taxemail">
				</td>
				</tr>
				-->
				</table>
			</td>
			</tr>
			</table>

			<p> 
			<table WIDTH="100%" BORDER="0" CELLSPACING="1&quot;" CELLPADDING="0" ALIGN="center">
			<tr> 
			<td align="left"><b>2. 요금 담당자 정보</b> (<input TYPE="CHECKBOX" NAME="dam1use" value="Y" onclick="checkdam1();">가입자와 요금관련 담당자가 동일)</td>
			</tr>
			</table>

			<table border="0" cellpadding="3" cellspacing="1" width="100%" bordercolordark="white" bordercolorlight="#083D8D" bgcolor="#CCCCCC">
			<tr bgcolor="#FFFFFF"> 
			<td align="right" width="120" bgcolor="#f5f5f5"><img src="/images/server-i2.gif" width="9" height="9"> 담당자 이름 </td>
			<td bgcolor="#ffffff"> 
				<input type="text" class="Form3" name="pricenm" size="10" maxlength="50">
			</td>
			<td align="right" width="120" bgcolor="#f5f5f5"><img src="/images/server-i2.gif" width="9" height="9"> 본인인증 </td>
			<td bgcolor="#ffffff"> 
				<input type="button" name="checkbtn" value="본인인증" onclick="CheckPlus()">
				<font color="#FF0000">(담당자와 이름이 일치해야 합니다.)</font>
			</td>
			</tr>
			<tr bgcolor="#FFFFFF"> 
			<td align="right" width="120" bgcolor="#f5f5f5"><img src="/images/server-i2.gif" width="9" height="9"> 전화번호 </td>
			<td bgcolor="#ffffff"> 
				<input type="text" class="Form3" name="pricetel1" size="4" maxlength="4" onkeypress="onlyNumber3();">
				- 
				<input type="text" class="Form3" name="pricetel2" size="4" maxlength="4" onkeypress="onlyNumber3();">
				- 
				<input type="text" class="Form3" name="pricetel3" size="4" maxlength="4" onkeypress="onlyNumber3();">
			</td>
								                    <td bgcolor="#F5f5f5" align="right"> 팩스번호 </td>
			<td bgcolor="white"> 
				<input type="text" class="Form3" name="pricefax1" size="4" maxlength="4" onkeypress="onlyNumber3();">
				- 
				<input type="text" class="Form3" name="pricefax2" size="4" maxlength="4" onkeypress="onlyNumber3();">
				- 
				<input type="text" class="Form3" name="pricefax3" size="4" maxlength="4" onkeypress="onlyNumber3();">
			</td>
			</tr>
			<tr bgcolor="#FFFFFF"> 
			<td rowspan="2" align="right" bgcolor="#f5f5f5"><img src="/images/server-i2.gif" width="9" height="9"> 우편물 수령지 </td>
			<td colspan="3" bgcolor="#ffffff" class=txt> 
				<input type="text" size="8" class="Form3" maxlength="7" name="zip" onClick="OpenZip();" readonly>&nbsp; 
				<input type="button" value=" 주소 입력 " class="Form5" style="height:20" id="button1" name="button1" onClick="OpenZip();">
				<br>
				<font color="#996600">(우편물을 받으실 곳의 주소를 입력하여 주십시오.) </font> 
			</td>
			</tr>
			<tr> 
			<td colspan="3" bgcolor="#FFFFFF"> 
				<input type="text" size="40" class="Form3" maxlength="100" name="addr1">
				<input type="text" size="30" class="Form3" maxlength="100" name="addr2">
			</td>
			</tr>
			<tr bgcolor="#FFFFFF"> 
			<td align="right" bgcolor="#f5f5f5"><img src="/images/server-i2.gif" width="9" height="9"> Email </td>
			<td colspan="3" bgcolor="#ffffff"> 
				<input type="text" class="Form3" name="priceemail" size="40" maxlength="40"> (hanmail 계정 사용불가)
			</td>
			</tr>
	        <!--tr> 
			<td align="right" bgcolor="#f5f5f5"><img src="/images/server-i2.gif" width="9" height="9"> 요금 납부 방법</td>
			<td colspan="3" bgcolor="white"> 
				<input type="radio" name="pricetype" value="M" onClick="methcheck('M');" checked>월 단위 납부 
				<input type="radio" name="pricetype" value="Y" onClick="methcheck('Y');">
				년 단위 납부--> 
				<!--<input type="radio" name="pricetype" value="A" onClick="methcheck('A');">CMS 자동이체(1544-0072로 문의)<br>-->
				<!--<input type="radio" name="pricetype" value="C" checked onClick="methcheck('C');">신용카드 자동이체(5% 할인)<br>-->
				<!--<input type="radio" name="pricetype" value="B" onClick="methcheck('B');">은행 자동이체(5% 할인)-->
			<!--/td-->
				<!--input type="hidden" name="cardclick" value = "M"-->
			<!--/tr-->
			</table>


			<!-- 결제정보 시작 -->
			<p> 
			<table WIDTH="100%" BORDER="0" CELLSPACING="1&quot;" CELLPADDING="0" ALIGN="center">
			<tr> 
				<td align="left"><b>3. 결제 정보</b>
				(<input type="radio" name="paymethod" value="C" onClick="pay('card');" checked /> 신용카드 자동이체&nbsp;&nbsp;
				 
				 <input type="radio" name="paymethod" value="A" onClick="pay('account');" /> 계좌 자동이체&nbsp;&nbsp;
				 <input type="radio" name="paymethod" value="M" onClick="pay('monthly');" /> 월납
				)</td>
			</tr>
			</table>

			<table id="cardtable" border="0" cellpadding="3" cellspacing="1" width="100%" bordercolordark="white" bordercolorlight="#083D8D" bgcolor="#CCCCCC">
			<input type="hidden" name="LGD_RESPCODE">
			<input type="hidden" name="LGD_RESPMSG">
			<input type="hidden" name="LGD_BILLKEY">
			<input type="hidden" name="LGD_PAYDATE">
			<input type="hidden" name="LGD_FINANCECODE">
			<input type="hidden" name="LGD_FINANCENAME">

			<input type="hidden" name="LGD_MID" value="hostway1">					<!-- 상점아이디 -->
			<input type="hidden" name="LGD_CHECKSSNYN" value="N">					<!-- 인증요청 주민등록번호 일치여부 확인 플래그 -->
			<input type="hidden" name="LGD_PAYWINDOWTYPE"   value="CardBillingAuth">	<!-- 수정불가 -->
			<tr bgcolor="#FFFFFF">
				<td width="120" bgcolor="#f5f5f5" align="right"><img src="/images/server-i2.gif" width="9" height="9"> 카드인증 </td>
				<td>
					<input type="button" name="cardbtn" value="카드인증" onclick="doPay_ActiveX()"/></td>
			</tr>
			</table>


			<table id="accounttable" border="0" cellpadding="3" cellspacing="1" width="100%" bordercolordark="white" bordercolorlight="#083D8D" bgcolor="#CCCCCC" style="display: none;">
			<tr bgcolor="#FFFFFF">
				<td align="right" width="120" bgcolor="#f5f5f5"><img src="/images/server-i2.gif" width="9" height="9"> 은행 </td>
				<td><select name="bank" id="bank">
						<option value="0">선택하세요.</option>
						<option value="우리은행">우리은행</option>
						<option value="신한은행">신한은행</option>
						<option value="하나은행">하나은행</option>
						<option value="SC제일은행">SC제일은행</option>
						<option value="국민은행">국민은행</option>
						<option value="우체국은행">우체국은행</option>
						<option value="기업은행">기업은행</option>
						<option value="농협">농협</option>
						<option value="외환은행">외환은행</option>
						<option value="부산은행">부산은행</option>
						<option value="대구은행">대구은행</option>
						<option value="광주은행">광주은행</option>
						<option value="씨티은행">씨티은행</option>

						<option value="산업은행">산업은행</option>
						<option value="새마을금고">새마을금고</option>
						<option value="경남은행">경남은행</option>
						<option value="전북은행">전북은행</option>
						<option value="제주은행">제주은행</option>
						<option value="수협">수협</option>
						<option value="신협">신협</option>
						<option value="동양증권">동양증권</option>
						<option value="삼성증권">삼성증권</option>
					</select>
				</td>
				<td align="right" width="120" bgcolor="#f5f5f5"><img src="/images/server-i2.gif" width="9" height="9"> 예금주명 </td>
				<td bgcolor="#ffffff"> 
					<input type="text" class="Form3" name="deposit" size="7" maxlength="15">
					<font color="red">(가입자 정보와 일치)</font>
				</td>
			</tr>
			<tr bgcolor="#FFFFFF"> 
				<td align="right" width="120" bgcolor="#f5f5f5"><img src="/images/server-i2.gif" width="9" height="9"> 계좌번호 </td>
				<td bgcolor="#ffffff"> 
					<input type="text" class="Form3" name="accountnumber" size="20" maxlength="25" onkeypress="onlyNumber3();">
					("-"없이 입력)
				</td>
				<td bgcolor="#F5f5f5" align="right"><img src="/images/server-i2.gif" width="9" height="9"> 생년월일/사업자번호 </td>
				<td bgcolor="white"> 
					<input type="text" class="Form3" name="Anumber" size="15" maxlength="20" onkeypress="onlyNumber3();">
					("-"없이 입력)
				</td>
			</tr>
			<tr bgcolor="#FFFFFF"> 
				<td align="center" bgcolor="#f5f5f5" colspan="4">
					<font color="#FF0000">* 계좌 자동이체 신청시에는 아래 신청서를 작성하여 CMS@hostway.co.kr로 보내주셔야 등록 절차가 완료 됩니다.</font><br>
					<a href="https://member.hostway.co.kr/Reg_member/doc/계좌자동이체 신청서.docx">계좌 자동이체 신청서 다운로드</a>
				</td>
			</tr>
			</table>

			<table id="monthlytable" border="0" cellpadding="3" cellspacing="1" width="100%" bordercolordark="white" bordercolorlight="#083D8D" bgcolor="#CCCCCC" style="display: none;">
			<tr bgcolor="#FFFFFF">
				<td bgcolor="#f5f5f5" align="center" height="30">신한은행 140-010-179342 한국호스트웨이㈜/ [카드결제]</td>
			</tr>
			</table>

			<!-- 결제정보 끝 -->

<!--
			<br>
			<table WIDTH="550" BORDER="0" CELLSPACING="1&quot;" CELLPADDING="0" ALIGN="center">
			<tr> 
			<td width="50%" align="left" colspan="2">※ 신용카드 자동이체를 신청하시면 매월 20일을 기준으로 월사용료가 5%할인된 비용으로 자동결제가 됩니다. 신용카드자동이체를 사용하시려면 아래3번 항목을 기입해주십시오.&nbsp; </td>
			</tr>
			</table>
			
			<hr width="550" border="0" height="0" noshade>
			<table WIDTH="550" BORDER="0" CELLSPACING="1&quot;" CELLPADDING="0" ALIGN="center">
			<tr> 
			<td width="50%" align="left" colspan="2"><b>3. 신용카드 자동이체 납입자 정보</b>(신용카드자동이체 신청자만 기입해 주십시오.)&nbsp; </td>
			</tr>
			</table>

			<table width="550" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tr> 
			<td> 
				<table border="0" cellpadding="3" cellspacing="1" width="550" bordercolorlight="#083D8D" bgcolor="#CCCCCC">
				<tr> 
				<td bgcolor="#f5f5f5" width="120" align="right"><img src="/images/server-i2.gif" width="9" height="9"> 
					소유자 이름 </td>
				<td bgcolor="white">
					<input type="text" size="17" class="Form3" maxlength="20" name="cardnm">
				</td>
			        <td bgcolor="#f5f5f5" align="right"><img src="/images/server-i2.gif" width="9" height="9"> 소유자 연락처 </td>
				<td bgcolor="white" align="left"> 
					<input type="text" class="Form3" name="cardtel1" size="4" maxlength="4" onkeypress="onlyNumber3();">
					- 
					<input type="text" class="Form3" name="cardtel2" size="4" maxlength="4" onkeypress="onlyNumber3();">
					- 
					<input type="text" class="Form3" name="cardtel3" size="4" maxlength="4" onkeypress="onlyNumber3();">
				</td>
				</tr>
				<tr> 
				<td bgcolor="#f5f5f5" width="120" align="right"><img src="/images/server-i2.gif" width="9" height="9"> 신용카드 번호 </td>
				<td bgcolor="white"> 
					<input type="text" class="Form3" name="cardnumber" size="20" maxlength="20">
					<br>예)1234-5678-1234-5678
				</td>
			        <td bgcolor="#f5f5f5" align="right"><img src="/images/server-i2.gif" width="9" height="9"> 유효 기간 </td>
				<td bgcolor="#ffffff"> 
					<select name="cardyy">
					<option value="-1" selected>----</option>
					<option value="2000">2000</option>
					<option value="2001">2001</option>
					<option value="2002">2002</option>
					<option value="2003">2003</option>
					<option value="2004">2004</option>
					<option value="2005">2005</option>
					<option value="2006">2006</option>
					<option value="2007">2007</option>
					<option value="2008">2008</option>
					<option value="2009">2009</option>
					</select>년 / 
					<select name="cardmm">
					<option value="-1" selected>----</option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					</select>월
				</td>
				</tr>
				</table>
			</td>
			</tr>
			</table>
-->
<br />
<table border="0" cellpadding="3" cellspacing="1" width="100%" bordercolordark="white" bordercolorlight="#083D8D">
              <tr bgcolor="#FFFFFF">
                <td align="right" bgcolor="#f5f5f5"><iframe frameborder="0" width="100%" height="200" scrolling="Yes" src="/resources/member_txt.html" class="form2"></iframe>
                   </td>
                </tr>
<tr><td align="right">
  개인정보 취급방침에 동의합니다<font color="#FF6600">
  <input type="checkbox" name="accept" value="1">
    </font></td>
</tr>
            </table>
            <!--
			<br>
			<table WIDTH="550" BORDER="0" CELLSPACING="1&quot;" CELLPADDING="0" ALIGN="center">
			<tr> 
			<td width="50%" align="left" colspan="2">※ 신용카드 자동이체를 신청하시면 매월 20일을 기준으로 월사용료가 5%할인된 비용으로 자동결제가 됩니다. 신용카드자동이체를 사용하시려면 아래3번 항목을 기입해주십시오.&nbsp; </td>
			</tr>
			</table>
			
			<hr width="550" border="0" height="0" noshade>
			<table WIDTH="550" BORDER="0" CELLSPACING="1&quot;" CELLPADDING="0" ALIGN="center">
			<tr> 
			<td width="50%" align="left" colspan="2"><b>3. 신용카드 자동이체 납입자 정보</b>(신용카드자동이체 신청자만 기입해 주십시오.)&nbsp; </td>
			</tr>
			</table>

			<table width="550" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tr> 
			<td> 
				<table border="0" cellpadding="3" cellspacing="1" width="550" bordercolorlight="#083D8D" bgcolor="#CCCCCC">
				<tr> 
				<td bgcolor="#f5f5f5" width="120" align="right"><img src="/images/server-i2.gif" width="9" height="9"> 
					소유자 이름 </td>
				<td bgcolor="white">
					<input type="text" size="17" class="Form3" maxlength="20" name="cardnm">
				</td>
			        <td bgcolor="#f5f5f5" align="right"><img src="/images/server-i2.gif" width="9" height="9"> 소유자 연락처 </td>
				<td bgcolor="white" align="left"> 
					<input type="text" class="Form3" name="cardtel1" size="4" maxlength="4" onkeypress="onlyNumber3();">
					- 
					<input type="text" class="Form3" name="cardtel2" size="4" maxlength="4" onkeypress="onlyNumber3();">
					- 
					<input type="text" class="Form3" name="cardtel3" size="4" maxlength="4" onkeypress="onlyNumber3();">
				</td>
				</tr>
				<tr> 
				<td bgcolor="#f5f5f5" width="120" align="right"><img src="/images/server-i2.gif" width="9" height="9"> 신용카드 번호 </td>
				<td bgcolor="white"> 
					<input type="text" class="Form3" name="cardnumber" size="20" maxlength="20">
					<br>예)1234-5678-1234-5678
				</td>
			        <td bgcolor="#f5f5f5" align="right"><img src="/images/server-i2.gif" width="9" height="9"> 유효 기간 </td>
				<td bgcolor="#ffffff"> 
					<select name="cardyy">
					<option value="-1" selected>----</option>
					<option value="2000">2000</option>
					<option value="2001">2001</option>
					<option value="2002">2002</option>
					<option value="2003">2003</option>
					<option value="2004">2004</option>
					<option value="2005">2005</option>
					<option value="2006">2006</option>
					<option value="2007">2007</option>
					<option value="2008">2008</option>
					<option value="2009">2009</option>
					</select>년 / 
					<select name="cardmm">
					<option value="-1" selected>----</option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					</select>월
				</td>
				</tr>
				</table>
			</td>
			</tr>
			</table>				
-->
            <br />
            <p>&nbsp;</p>
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr> 
			<td align="center">

				<input type="button" value=" 그만두기 " class="form5" style="width:125;height:25" onClick="document.Form2.submit();" id="button3" name="button3">
				<input type="button" value=" 다음으로 " onClick="Certificate();" id="button2" name="button2" class="form5" style="width:125;height:25">
			</tr>
			</table>
		</td>
		</tr>
		</form>
		</table> 
<!---------------------  회원 가입 폼 마지막 ---------------->
	</td>
	</tr>
	<tr> 
	<td align="center"></td>
	</tr>
	</table>
</td>
</tr>
</table>

<!-- LOGGER SCRIPT FOR SETTING ENVIRONMENT V.27 : / FILL THE VALUE TO SET. --> 
<!-- COPYRIGHT (C) 2002-2010 BIZSPRING INC. LOGGER(TM) ALL RIGHTS RESERVED. --> 
<script language="JavaScript"> 
/* FOR BIZ., COM. AND ENT. SERVICE. */ 
_TRK_CP = "/회원가입/회원가입양식"; /* Contents Path */ 
_TRK_PI = "RGF"; /* Page Identity */ 
_TRK_PN = "회원가입양식"; /* Product Name */ 
_TRK_MF = "회원가입"; /* Manufacture Name */ 
_TRK_OA = ""; /* Order Amount(s) with ';' Separated */ 
_TRK_OP = ""; /* Order Product(s) with ';' Separated */ 
_TRK_OE = ""; /* Order EA with ';' Separated */ 
_TRK_CC = ""; /* Campaign Code */ 
_TRK_RK = ""; /* Reserved Key */ 
_TRK_SX = ""; /* Members Gender - M,F,U */ 
_TRK_AG = ""; /* Member Age - A,B,C,D,E,F,G */ 
_TRK_IK = ""; /* Inner Search Keyword */ 
</script> 
<!-- END OF ENVIRONMENT SCRIPT -->

<!-- LOGGER TRACKING SCRIPT V.40 FOR logger.co.kr / 39041 : COMBINE TYPE / DO NOT ALTER THIS SCRIPT. -->
<!-- COPYRIGHT (C) 2002-2012 BIZSPRING INC. LOGGER(TM) ALL RIGHTS RESERVED. -->
<script type="text/javascript">var _TRK_LID="39041";var _L_TD="ssl.logger.co.kr";</script>
<script type="text/javascript">var _CDN_DOMAIN = location.protocol == "https:" ? "https://fs.bizspring.net" : "http://fs.bizspring.net";document.write(unescape("%3Cscript src='" + _CDN_DOMAIN +"/fs4/bstrk.js' type='text/javascript'%3E%3C/script%3E"));</script>
<noscript><img alt="Logger Script" width="1" height="1" src="http://ssl.logger.co.kr/tracker.tsp?u=39041&amp;js=N" /></noscript>
<!-- END OF LOGGER TRACKING SCRIPT -->
</TD>
  </TR>

  <TR> 
    <TD width="5" height="10">&nbsp;</TD>
    <TD colspan="4">&nbsp;</TD>
  </TR>
</TABLE>
<table width="100%" border="0" cellspacing="0" bgcolor="#004284" cellpadding="0">
  <tr> 
    <td align="left" valign="middle" colspan="3" background="/images/2_column_06.gif"><img src="images/2_column_06.gif" width=790 height=7 alt=""></td>
  </tr>
</table>
</BODY>
<!--  xpay.js는 반드시 body 밑에 두시기 바랍니다. -->
<!--  UTF-8 인코딩 사용 시는 xpay.js 대신 xpay_utf-8.js 을  호출하시기 바랍니다.-->
<script language='javascript' src='https://xpay.lgdacom.net/xpay/js/xpay.js' type='text/javascript'>
</script>
</HTML></TD>
