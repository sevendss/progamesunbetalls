﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="setLevel.aspx.cs" Inherits="admin.Statistics.setLevel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/css/Default/globle.css" rel="stylesheet" type="text/css" />
    <link href="/css/Default/right_main.css" rel="stylesheet" type="text/css" />
    <link href="/css/Default/tab.css" rel="stylesheet" type="text/css" />
    <link href="/css/Default/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.4.1.min.js"></script>
    <script src="/js/jquery-ui.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/jQueryCommon.js"></script>
    <script type="text/javascript">
        jQuery(function ($) {
            SetGlobal("");
            jQuery("#add_list").hide();
            setDate();
            jQuery("#addBtn").click(function () {
                jQuery.each(jQuery("span[id*=err]"),function(i,n){
                    jQuery(n).html("");
                });
                jQuery("#addDiv").hide();
                jQuery("#add_list").show();
            });
        });

         var languages = "";
        var lang;
        function SetGlobal(setLang) {

            setLang = $.SetOrGetLanguage(setLang, function () {
                languages = language;
                $("#addBtn").val(languages.H1015);
                $("#addButton").val(languages.H1015);
                $(".H1355").html(languages.H1355);
                $(".H1356").html(languages.H1356);
                $(".H1357").text(languages.H1357);
                $(".H1358").text(languages.H1358);
                $(".H1359").text(languages.H1359);
                $(".H1052").text(languages.H1052);
                $(".H1009").text(languages.H1009);
                $("#addBtn").val(languages.H1015);
                $("#addCancel").val(languages.H1011);
            });
            lang = setLang;
            switch (lang) {
                case "zh-cn": case "zh-CN":
                    jQuery("#language").val("cn")
                    break;
                case "zh-tw":
                    jQuery("#language").val("tw")
                    break;
                case "en-us":
                    jQuery("#language").val("en")
                    break;
                default:
                    jQuery("#language").val("cn")
                    break;
            }
        }

        var setDate = function () {
            jQuery.AjaxCommon("/ServicesFile/webBasicInfo/Statistics/StatisticsService.asmx/getGrade", "language:'"+jQuery("#language").val()+"'", true, false, function (json) {
                if (json.d != "none") {
                    var r = jQuery.parseJSON(json.d);
                 
                    jQuery("#showInfo>tr").remove();
                    jQuery.each(r, function (i) {
                        var tr = jQuery("#tr1").clone();
                        tr.find("#levelID").html("" + (i + 1));
                        tr.find("#levelName").html(r[i].b);
                        tr.find("#levelRemark").html(r[i].c);
                         <%if(upAc){ %>
                        tr.find("#update").html("<a id=\"update\" style=\"cursor:hand\" onclick=\"upda(this,'" + r[i].a + "')\"><img title=\""+languages.H1009+"\" src=\"/images/Icon/Icon167.png\" />"+languages.H1009+"</a>");
                        <%} %>
                        <%if(deleteAc){ %>
                        tr.find("#delet").html("<a id=\"delet\" style=\"cursor:hand\" onclick=\"delet(this,'" + r[i].a + "')\"><img title=\""+languages.H1052+"\" src=\"/images/Icon/Icon141.png\" />"+languages.H1052+"</a>");
                        <%} %>
                        tr.appendTo("#showInfo");
                    });
                }
            });
        };
        var surebutton = function () {
        jQuery.each(jQuery("#addtable :text"), function (i, n) {
                     $(n).blur();
                 });
                 var check = true;
                 jQuery.each(jQuery("#addtable span"), function (i, n) {
                         if ($(n).text() != "") {
                             check = false;
                         }
                 });

                 if (check == false) {
                     return;
                 }
                // debugger
            var data = "n:'" + jQuery("#levelname").val() + "',r:'" + jQuery("#levelremark").val() + "',lan:'"+jQuery("#language").val()+"'";
            jQuery.AjaxCommon("/ServicesFile/webBasicInfo/Statistics/StatisticsService.asmx/addInfo", data, true, false, function (json) {
                if (json.d != "none") {
                    if(json.d == languages.H1354){
                        jQuery("#err1").html(json.d);
                        //jQuery(this).parent().find("span[id=err1]").html(json.d);
                    }
                    else {
                        setDate();
                        escbutton();
                    }
                }
            });
            
        };
        var escbutton = function () {
            jQuery("#addDiv").show();
            jQuery("#levelname").val("");
            jQuery("#levelremark").val("");
            jQuery("#add_list").hide();
        };
        var upda = function (obj,i) {
            var n = jQuery(obj).parent().parent().find("td:eq(1)").text();
            var r = jQuery(obj).parent().parent().find("td:eq(2)").text();
            jQuery(obj).parent().parent().find("td:eq(1)").html("<input type=\"text\" class=\"text_01 h20 tc\" value=\"" + n + "\" onblur=\"IsNullByInfo(this,'err2','"+languages.H1306+"');\" onmouseover=\"this.className='text_01_h h20 tc'\" onmouseout=\"this.className='text_01 h20 tc'\" />&nbsp;<span id=\"err2\" style=\"color:Red\"/>");
            jQuery(obj).parent().parent().find("td:eq(2)").html("<input type=\"text\" class=\"text_01 h20 tc\" value=\"" + r + "\" onmouseover=\"this.className='text_01_h h20 tc'\" onmouseout=\"this.className='text_01 h20 tc'\" />");
            jQuery(obj).parent().html("<a style=\"cursor:hand\" id=\"saveA\" onclick=\"bindSave(this,'" + i + "')\" ><img src=\"/images/Icon/Icon321.png\" title=\""+languages.H1025+"\" />"+languages.H1025+"</a>&nbsp;&nbsp;&nbsp;&nbsp;<a style=\"cursor:hand\" onclick=\"bindEsc(this,'" + n + "','" + r + "','" + i + "')\" id=\"escA\"><img src=\"/images/Icon/Icon390.png\"  title=\""+languages.H1011+"\" />"+languages.H1011+"</a>");
        };
        var delet = function (obj, i) {
            var data = "i:'" + i + "'";
            jQuery.AjaxCommon("/ServicesFile/webBasicInfo/Statistics/StatisticsService.asmx/delete", data, false, false, function (json) {
                setDate();
            });
        };
        var bindEsc = function (obj, n, r, i) {
            jQuery(obj).parent().parent().find("td:eq(1)").html(n);
            jQuery(obj).parent().parent().find("td:eq(2)").html(r);
            jQuery(obj).parent().parent().find("td:eq(3)").html("<a id=\"update\" style=\"cursor:hand\" onclick=\"upda(this,'" + i + "')\"><img title=\""+languages.H1009+"\" src=\"/images/Icon/Icon167.png\" />"+languages.H1009+"</a>");
        };
        var bindSave = function (obj, i) {
             jQuery.each(jQuery("#tab :text"), function (i, n) {
                $(n).blur();
            });
            var check = true;
            jQuery.each(jQuery("#tab span"), function (i, n) {
                if ($(n).text() != "") {
                    check = false;
                }
            });

            if (check == false) {
                return;
            }
            var n = jQuery(obj).parent().parent().find("td:eq(1)>input:text:eq(0)").val();
            var r = jQuery(obj).parent().parent().find("td:eq(2)>input:text:eq(0)").val();
            jQuery(obj).parent().parent().find("td:eq(1)").html(n);
            jQuery(obj).parent().parent().find("td:eq(2)").html(r);
            jQuery(obj).parent().parent().find("td:eq(3)").html("<a id=\"update\" style=\"cursor:hand\" onclick=\"upda(this,'" + i + "')\"><img title=\""+languages.H1009+"\" src=\"/images/Icon/Icon167.png\" />"+languages.H1009+"</a>");
            var data = "n:'" + n + "',r:'" + r + "',i:'" + i + "',lan:'"+jQuery("#language").val()+"'";
            jQuery.AjaxCommon("/ServicesFile/webBasicInfo/Statistics/StatisticsService.asmx/update", data, false, false, function () { });
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <table  id="right_main" border="0" width="100%" cellpadding="0" cellspacing="0">
<thead>
<tr class="h30">
<th width="12" class="tab_top_l"></th>
<th width="*" class="tab_top_m"><p class="H1355">会员等级</p></th>
<th width="16" class="tab_top_r"></th>
</tr>
</thead>

<tbody>
<tr>
<td class="tab_middle_l"></td>
<td >
<div id="main">
<%if (addAc)
  {%>
<div class="top_banner h30">
    <div id="Div1">
   <input type="button" id="addBtn" class="top_add" onmouseover="this.className='top_add_h'" onmouseout="this.className='top_add'"  value="新增" /><input type="hidden" id="language" value="cn"/>&nbsp;&nbsp;
    </div>
    </div>
 <%} %>
    <div id="add_list" class="new_tr">
<div align="center">
<table width="70%"  border="0" cellpadding="1" cellspacing="1" id="addtable">
  <tr align="center" style="background-color:#CDEAFC">
    <td colspan="4" class="H1356"><strong>等级设置</strong></td>
  </tr>
  <tr>
    <td style="width:42%" align="right" class="H1357">等级名称：</td>
    <td align="left"><input type="text" name="levelname" id="levelname" onblur="IsNullByInfo(this,'err1',languages.H1306);" class="text_01 h20" onmouseover="this.className='text_01_h h20'" onmouseout="this.className='text_01 h20'" />&nbsp;<span id="err1" style="color:Red"></span></td>
  </tr>
  <tr>
    <td align="right" class="H1358">等级描述：</td>
    <td align="left"><input type="text" name="levelremark" id="levelremark" class="text_01 h20" onmouseover="this.className='text_01_h h20'" onmouseout="this.className='text_01 h20'" /></td>
  </tr>
  <tr>
    <td colspan="2" align="center">
<input type="button" id="addButton" onclick="surebutton()" class="btn_02" onmouseover="this.className='btn_02_h'" onmouseout="this.className='btn_02'"  value="新增" />
<input type="button" id="addCancel" onclick="escbutton()" class="btn_02" onmouseover="this.className='btn_02_h'" onmouseout="this.className='btn_02'" value="取消" />
	</td>
  </tr>
</table>
</div>
<div class="new_trfoot"></div>
</div>
<table width="100%" id="tab" class="tab2"  border="0" cellpadding="0" cellspacing="0">
<thead>
<tr>
<th class="H1359">编号</th>
<th class="H1357">等级名称</th>
<th class="H1358">等级描述</th>
 <%if (upAc)
   { %>
<th class="H1009">修改</th>
<%} %>
<%if (deleteAc)
  { %>
<th class="H1052">删除</th>
<%} %>
</tr>
</thead>
<tbody id="showInfo">
</tbody>
<tfoot>
<tr id="tr1">
<td id="levelID" style="width:80px"></td>
<td id="levelName" style="width:300px"></td>
<td id="levelRemark"></td>
 <%if (upAc)
   { %>
<td id="update" style="width:130px"></td>
<%} %>
<%if (deleteAc)
  { %>
<td id="delet" style="width:110px"></td>
<%} %>
</tr>
</tfoot>
</table>
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
</form>
</body>
</html>
