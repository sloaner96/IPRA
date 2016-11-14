<!---
	
	This library is part of the Common Function Library Project. An open source
	collection of UDF libraries designed for ColdFusion 5.0. For more information,
	please see the web site at:
		
		http://www.cflib.org
		
	Warning:
	You may not need all the functions in this library. If speed
	is _extremely_ important, you may want to consider deleting
	functions you do not plan on using. Normally you should not
	have to worry about the size of the library.
		
	License:
	This code may be used freely. 
	You may modify this code as you see fit, however, this header, and the header
	for the functions must remain intact.
	
	This code is provided as is.  We make no warranty or guarantee.  Use of this code is at your own risk.
--->

<cfscript>
/**
 * Returns TRUE if the string is a valid credit card number.
 * Modded by RCamden - Check for any non numeric and return false.
 * Modded by Author - fixed mastercard checking
 * Updated to use [:digit:] and allow spaces
 * Corrected nondigit check
 * 
 * @param ccNo 	 The credit card number. (Required)
 * @param cardType 	 One of: AMEX, DINERS, DISCOVER, MASTERCARD, VISA (Optional)
 * @return Returns a boolean. 
 * @author Nick de Voil (nick@devoil.com) 
 * @version 4, August 17, 2004 
 */
function IsCreditCard(ccNo)
{
	var rv = "";
	var str = "";
	var chk = 0;
	var ccln = 0;
	var strln = 0;
	var i = 1;

	if(reFind("[^[:digit:]]",ccNo)) return FALSE;
        ccNo = replace(ccNo," ","","ALL");
	rv = Reverse(ccNo);
	ccln = Len(ccNo);
	if(ccln lt 12) return FALSE;
	for(i = 1; i lte ccln;  i = i + 1) {
		if(i mod 2 eq 0) {
			str = str & Mid(rv, i, 1) * 2;
		} else {
			str = str & Mid(rv, i, 1);
		}
	}
	strln = Len(str);
	for(i = 1; i lte strln; i = i + 1) chk = chk + Mid(str, i, 1);
	if((chk neq 0) and (chk mod 10 eq 0)) {
		if(ArrayLen(Arguments) lt 2) return TRUE;
		switch(UCase(Arguments[2])) {
		case "AMEX":		if ((ccln eq 15) and (((Left(ccNo, 2) is "34")) or ((Left(ccNo, 2) is "37")))) return TRUE; break;
		case "DINERS":		if ((ccln eq 14) and (((Left(ccNo, 3) gte 300) and (Left(ccNo, 3) lte 305)) or (Left(ccNo, 2) is "36") or (Left(ccNo, 2) is "38"))) return TRUE; break;
		case "DISCOVER":	if ((ccln eq 16) and (Left(ccNo, 4) is "6011")) return TRUE; break;
		case "MASTERCARD":	if ((ccln eq 16) and (Left(ccNo, 2) gte 51) and (Left(ccNo, 2) lte 55)) return TRUE; break;
		case "VISA":		if (((ccln eq 13) or (ccln eq 16)) and (Left(ccNo, 1) is "4")) return TRUE; break;
		default: return TRUE;
		}
	}
	return FALSE;
}
</cfscript>
