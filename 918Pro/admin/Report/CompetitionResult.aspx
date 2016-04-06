﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompetitionResult.aspx.cs" Inherits="admin.Report.CompetitionResult" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=7" />
    <link href="/css/Default/globle.css" rel="stylesheet" type="text/css" />
    <link href="/css/Default/right_main.css" rel="stylesheet" type="text/css" />
    <link href="/css/Default/tab.css" rel="stylesheet" type="text/css" />
    <link href="/css/Default/style.css" rel="stylesheet" type="text/css" />
    <link href="/css/Default/cupertino/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <script src="/js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="/js/jquery-ui.min.js" type="text/javascript"></script>
    <script src="/js/jQueryCommon.js" type="text/javascript"></script>
    <script src="/js/webBasicInfo/zh-CN.js" type="text/javascript"></script>
    <style type="text/css">
    .ui-effects-transfer { border: 2px dotted gray; } 
        #divTip
        {
        	left:45%;top:45%;         	
        	font-family:sans-serif; position:absolute; font-size:10px;padding:5px;background:#f3f3f3;color:gray;display:none;-moz-border-radius:5px;-webkit-border-radius:5px;border:1px solid #ccc
        }
    </style>
     <script type="text/javascript">
         var languages = "";
         var lang;
         $(function () {
             SetGlobal("");
             jQuery("#language").val(lang);
             $("#time1WhereVal,#time2WhereVal").datepicker().click(function () {
                 $(this).val("");
             });
             $(".inputWhere").keyup(function (e) {
                 var currKey = 0, e = e || event;
                 currKey = e.keyCode || e.which || e.charCode;
                 if (currKey == 13) {
                     var data = "time1:'" + $("#time1WhereVal").val() + "',time2:'" + $("#time2WhereVal").val() + "',language:'" + $("#language").val() + "',league:'" + $.trim($("#leagueInput").val()) + "',home:'" + $.trim($("#homeInput").val()) + "',away:'" + $.trim($("#awayInput").val()) + "',status:'1'";
                     setData(data);
                     $(this).blur();
                 }
             });
         });
         //---------多语言处理-----------
         function SetGlobal(setLang) {
             setLang = $.SetOrGetLanguage(setLang, function () {
                 languages = language;
                 var myDate = new Date();
                 var year = myDate.getFullYear().toString();
                 var moth = (myDate.getMonth() + 1).toString();
                 var date = myDate.getDate().toString();
                 jQuery("#selectByWhere").click(function () {
                     if ($("#time1WhereVal").val() == "" && $("#time2WhereVal").val() == "" && $.trim($("#leagueInput").val()) == "" && $.trim($("#homeInput").val()) == "" && $.trim($("#awayInput").val()) == "") {
                         $.MsgTip({ objId: "#divTip", msg: "请选择查询条件" });
                         return false;
                     }
                     var data = "time1:'" + $("#time1WhereVal").val() + "',time2:'" + $("#time2WhereVal").val() + "',language:'" + $("#language").val() + "',league:'" + $.trim($("#leagueInput").val()) + "',home:'" + $.trim($("#homeInput").val()) + "',away:'" + $.trim($("#awayInput").val()) + "',status:'1'";
                     setData(data);
                 });
                 $("#nameP").html(languages.H1423);
                 $("#H1056").html(languages.H1056);
                 $("#H1198").html(languages.H1198);
                 $("#H1424").html(languages.H1424);
                 $("#H1266").html(languages.H1266);
                 $("#H1180").html(languages.H1180);
                 $("#H1179").html(languages.H1179);
             });
             lang = setLang;
         }
         //--------多语言处理结束---------

         function setData(data) {
             jQuery.AjaxCommon("/ServicesFile/ReportWebService.asmx/GetMatchResult", data, true, false, function (json) {
                 jQuery("#showInfo>tr").remove();
                 if (json.d != "") {
                     var result = jQuery.parseJSON(json.d);
                     var Transfers = 0;
                     var Commissions = 0;
                     jQuery.each(result, function (i) {
                         var tr;
                         tr = jQuery("#leagueInfo").clone();
                         tr.attr("class", "tc");
                         tr.find("#BeginTime").html(result[i].BeginTime);
                         tr.find("#League").html(result[i].league);
                         tr.find("#Team").html(result[i].Home + "- vs -" + result[i].Away);
                         tr.find("#Scorehalf").html((result[i].halfhomescore == "" ? "--" : result[i].halfhomescore) + " : " + (result[i].halfawayscore == "" ? "--" : result[i].halfawayscore));
                         tr.find("#Score").html(result[i].resulthomescore + ":" + result[i].resultawayscore);
                         tr.find("#ScoreInputTime").html(result[i].scoreinputtime);
                         tr.find("#ScroeInputOper").html(result[i].scoreinputuser);
                         tr.find("#ClearTime").html(result[i].jstime);
                         tr.find("#ClearOper").html(result[i].jsuser);
                         tr.appendTo("#showInfo");
                     });
                 } else {
                     var tr;
                     tr = jQuery("#leaguetr").clone();
                     tr.html("<td height=\"20\" colspan=\"9\" style=\"background-color:#DCF0FD\">" + languages.H1422 + "</td>");
                     tr.appendTo("#showInfo");
                 }
             });

             function fomatdate(time) {
                 var date = new Date(time);
                 var year = date.getYear();
                 var month = date.getMonth() > 8 ? date.getMonth() + 1 : "0" + (date.getMonth() + 1);
                 var day = date.getDate();
                 var h = date.getHours();
                 var m = date.getMinutes();
                 var s = date.getSeconds();
                 var AorP = " ";
                 if (h > 12) {
                     h = h - 12;
                     if (h < 10) {
                         h = "0" + h;
                     }
                     AorP = " PM";
                 }
                 else
                     AorP = " AM";
                 if (h >= 13) {
                     h = h - 12;
                 }
                 if (s < 10) {
                     s = "0" + s;
                 }
                 if (m < 10) {
                     m = "0" + m;
                 }
                 var newDate = month + "/" + day + "/" + year + " " + h + ":" + m + ":" + s + "" + AorP;
                 return newDate;
             }

         }
     </script>
</head>
<body>
    <table  id="right_main" border="0" width="100%" cellpadding="0" cellspacing="0">
<thead>
<tr class="h30">
<th width="12" class="tab_top_l"></th>
<th width="*" class="tab_top_m"><p id="nameP">賽事結果</p></th>
<th width="16" class="tab_top_r"></th>
</tr>
</thead>

<tbody>
<tr>
<td class="tab_middle_l"></td>
<td >
<div id="main">
<!--主题部分开始=========================================================================================-->
<input type="hidden" value="" id="timeHide" />
<input type="hidden" id="language" value="tw"/>
    <form id="form1" runat="server">
    <div class="top_banner h30">
    <!-- 查询条件选择DIV -->
<%--<div class="fl">
<input id="leagueAll" type="button" value="选择联赛" />&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" id="boll" value="选择球队" />&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton runat="server" ID="excel" 
        OnClientClick="return setExcel('divExcel','hfContent')" onclick="excel_Click" Text="导出Excel" />&nbsp;&nbsp;&nbsp;&nbsp;
    <a id="selectByWhere" class="fa_saurch"><span class="fa_saurch_in">搜索</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>--%>
<!-- 查询条件选择DIV结束 -->
<input type="hidden" runat="server" id="hfContent" />
<input type="hidden" runat="server" id="nameValue" />

    <div id="selectDiv" style="width:90%" >
        &nbsp;&nbsp;&nbsp;<span id="ls">联赛</span>:<input type="text" id="leagueInput" class="inputWhere text_01 w_80" onmouseover="this.className='text_01_h w_80'" onmouseout="this.className='text_01 w_80'" maxlength="4" />&nbsp;
    <span id="zd">主队</span>:<input type="text" id="homeInput" class="inputWhere text_01 w_80" onmouseover="this.className='text_01_h w_80'" onmouseout="this.className='text_01 w_80'" />&nbsp; <span id="kd">客队</span>:<input type="text" id="awayInput" class="inputWhere text_01 w_80" onmouseover="this.className='text_01_h w_80'" onmouseout="this.className='text_01 w_80'" />&nbsp; <span id="H1056">时间</span>:<input type="text" id="time1WhereVal" class="text_01 w_80" onmouseover="this.className='text_01_h w_80'" onmouseout="this.className='text_01 w_80'" readonly="readonly"  />－<input type="text" id="time2WhereVal" class="text_01 w_80" onmouseover="this.className='text_01_h w_80'" onmouseout="this.className='text_01 w_80'" readonly="readonly"  />  &nbsp;
    <a id="selectByWhere" class="fa_saurch"><span class="fa_saurch_in" id="H1198">查詢</span></a>
    </div>

</div>
<!-- 数据显示TABLE -->
<div id="divExcel">
    <table width="100%" class="tab2">
    <thead>
    <tr align="center">
    <th>开赛时间</th>
    <th>联赛</th>
    <th id="H1266">队伍</th>
    <th id="H1180">上半场比分</th>
    <th id="H1179">全场比分</th>
    <th>比分录入时间</th>
    <th>比分录入人员</th>
    <th>结算时间</th>
    <th>结算人员</th>
    </tr>
    </thead>
    <tbody id="showInfo">
    
    </tbody>
    <tfoot>
    <tr id="leaguetr"></tr>
    <tr id="leagueInfo">
    <td id="BeginTime"></td>
    <td id="League"></td>
    <td id="Team"></td>
    <td id="Scorehalf"></td>
    <td id="Score"></td>
    <td id="ScoreInputTime"></td>
    <td id="ScroeInputOper"></td>
    <td id="ClearTime"></td>
    <td id="ClearOper"></td>
    </tr>
    <tr id="info"></tr>
    <%--<tr id="total">
    <td id="name"></td>
    <td id="Transfers"></td>
    <td id="Commissions"></td>
    <td id="Td4"></td>
    </tr>--%>
    </tfoot>
    </table>
    </div>
    </form>
    
    <!-- 数据显示TABLE结束 -->

    <!-- 联赛选择DIV -->
    <!-- 联赛选择DIV结束 -->


    <!-- 球队选择DIV -->
    <!-- 球队选择DIV结束 -->

    <!-- 注单详细DIV -->
    <!-- 注单详细DIV结束 -->
    <!--主题部分结束=========================================================================================-->
</div>
</td>
<td class="tab_middle_r"></td>
</tr>
</tbody>

<tfoot>
<tr class="h35">
<td width="12" class="tab_foot_l"></td>
<td width="*" class="tab_foot_m">

</td>
<td width="16" class="tab_foot_r"></td>
</tr>
</tfoot>
</table>
<div id="loading"></div>
<div id="divTip" ></div>
</body>
</html>
