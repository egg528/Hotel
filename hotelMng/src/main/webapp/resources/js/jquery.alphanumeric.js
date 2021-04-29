/**
 * 사용예..
 * // 숫자만 입력 		$('.row2 input').numeric();
 * // 영어 + 숫자만 입력 	$('.row2 input').alphanumeric();
 * // 영어만 입력			$('.row2 input').alpha();
 * // 한글 입력 제한		$('.row2 input').css('ime-mode','disabled');
 */

(function($){

	$.fn.alphanumeric = function(p) { 

		p = $.extend({
			// 특수문자 [_] 추가
			ichars: "!@#$%^&*()+=[]\\\';,/{}|\":<>?~`.-_ ",
			nchars: "",
			allow: ""
		  }, p);	

		return this.each
			(
				function() 
				{
					// 한글도 입력 불가하게함.
					$(this).css('ime-mode', 'disabled');
					
					if (p.nocaps) p.nchars += "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
					if (p.allcaps) p.nchars += "abcdefghijklmnopqrstuvwxyz";
					
					s = p.allow.split('');
					for ( var i=0;i<s.length;i++) if (p.ichars.indexOf(s[i]) != -1) s[i] = "\\" + s[i];
					p.allow = s.join('|');
					
					var reg = new RegExp(p.allow,'gi');
					var ch = p.ichars + p.nchars;
					ch = ch.replace(reg,'');

					$(this).keypress
						(
							function (e)
								{
								
									if (!e.charCode) k = String.fromCharCode(e.which);
										else k = String.fromCharCode(e.charCode);
										
									if (ch.indexOf(k) != -1) e.preventDefault();
									if (e.ctrlKey&&k=='v') e.preventDefault();
									
								}
								
						);
						
					$(this).bind('contextmenu',function () {return false;});
									
				}
			);

	};

	$.fn.numeric = function(p) {
	
		var az = "abcdefghijklmnopqrstuvwxyz";
		az += az.toUpperCase();

		p = $.extend({
			nchars: az
		  }, p);	
		  	
		return this.each (function()
			{
				// 한글문제 수정.
				$(this).css('ime-mode', 'disabled');
				$(this).alphanumeric(p);
			}
		);
			
	};
	
	$.fn.alpha = function(p) {

		var nm = "1234567890";

		p = $.extend({
			nchars: nm
		  }, p);	

		return this.each (function()
			{
				$(this).alphanumeric(p);
			}
		);
			
	};	

	$.fn.rowcasenum = function(p) {

		var nm = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

		p = $.extend({
			nchars: nm
		  }, p);	

		return this.each (function()
			{
				$(this).alphanumeric(p);
			}
		);
			
	};	
})(jQuery);
