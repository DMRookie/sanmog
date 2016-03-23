<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  
    pageEncoding="ISO-8859-1"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <title>SANMOG</title>  
        <script type="text/javascript" language="JavaScript">  
              
            //: �ж���ҳ�Ƿ�������  
            document.onreadystatechange = function () {   
                if(document.readyState=="complete") {         
                    document.getElementById('divprogressbar').style.display='none';   
                }  
            }   
              
        </script>  
    </head>  
    <body>  
        <div id="divprogressbar"  
            style="position: absolute; width: 100%; height: 100%; left: 0px; top: 0px; background-color: #ffffff; filter: alpha (     opacity =     100 ); z-index: 50000">  
            <div style="text-align: center; padding-top: 200px">  
                <table align="center" border="1" width="37%" cellspacing="0"  
                    cellpadding="4" style="border-collapse: collapse" bgcolor="#FFFFEC"  
                    height="87">  
                    <tr>  
                        <td bgcolor="#3399FF" style="font-size: 12px;" height="24"  
                            align="center">         
                            Tips,data are Loading...                   
                           
                        </td>  
                    </tr>  
                    <tr>  
                        <td style="font-size: 12px; line-height: 200%" align="center">                    
		                     
		                     Loading page. Please wait patiently...
                            <marquee style="border: 1px solid #000000" direction="right"  
                                width="300" scrollamount="5" scrolldelay="10" bgcolor="#ECF2FF">  
                                <table cellspacing="1" cellpadding="0">  
                                    <tr height=8>  
                                        <td bgcolor=#3399FF width=8></td>  
                                        <td></td>  
                                        <td bgcolor=#3399FF width=8></td>  
                                        <td></td>  
                                        <td bgcolor=#3399FF width=8></td>  
                                        <td></td>  
                                        <td bgcolor=#3399FF width=8></td>  
                                        <td></td>  
                                    </tr>  
                                </table>  
                            </marquee>  
                        </td>  
                    </tr>  
                </table>  
            </div>  
        </div>  
    </body>  
</html>  