﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManager.aspx.cs" Inherits="agent.User.UserManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="X-UA-Compatible" content="IE=7" />
    <link href="/css/Default/globle.css" rel="stylesheet" type="text/css" />
    <link href="/css/Default/right_main.css" rel="stylesheet" type="text/css" />
    <link href="/css/Default/tab.css" rel="stylesheet" type="text/css" />
    <link href="/css/Default/style.css" rel="stylesheet" type="text/css" />
    <link href="/css/Default/cupertino/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <script src="/js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="/js/jquery-ui.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/jQueryCommon.js"></script>
    <script src="/js/webBasicInfo/zh-CN.js" type="text/javascript"></script>
    <link href="/css/Default/cupertino/jquery-ui-1.8.2.custom.css" rel="stylesheet"
        type="text/css" />
    <style type="text/css">
    .ui-effects-transfer { border: 2px dotted gray; } 
        #divTip
        {
        	left:45%;top:45%; 
        	
        	font-family:sans-serif; position:absolute; font-size:10px;padding:5px;background:#f3f3f3;color:gray;display:none;-moz-border-radius:5px;-webkit-border-radius:5px;border:1px solid #ccc
        }
        .over{background-color: rgb(220, 240, 253);}

    </style>
    <script type="text/javascript">
        jQuery(function () {

            SetGlobal("");

        });

        //---------多语言处理-----------
        var languages = "";
        var lang;
        function SetGlobal(setLang) {

            setLang = $.SetOrGetLanguage(setLang, function () {
                languages = language;


                jQuery("#time1").datepicker();
                jQuery("#time2").datepicker();
                jQuery("#selectbutton").click(function () {
                    if (jQuery("#agentType").val() != "" && jQuery("#agent").val() == "") {
                        alert("请输入代理名称");
                        jQuery("#agent").focus();
                        return;
                    }
                    var url = "/ServicesFile/UserService.asmx/GetUserByWhere";
                    var data = "userName:'" + $("#txtUserName").val() + "',status:'" + jQuery("#txtstatus").val() + "',currency:'" + jQuery("#txtcurrency").val() + "',time1:'" + jQuery("#time1").val() + "',time2:'" + jQuery("#time2").val() + "',agentType:'" + jQuery("#agentType").val() + "',agents:'" + jQuery("#agent").val() + "',MoneyType:'" + jQuery("#txtMoneyType").val() + "'";
                    var htm = "";
                    jQuery.AjaxCommon(url, data, false, false, function (json) {
                        var result = jQuery.parseJSON(json.d);
                        jQuery.each(result, function (i, n) {
                            htm += "<tr>";
                            htm += "<td>" + n.UserName + "<input type='hidden' id='uid' value='" + n.ID + "'></td>";
//                            htm += "<td>" + n.sex + "</td>";
//                            htm += "<td>" + n.country + "</td>";
//                            htm += "<td>" + n.Mobile + "</td>";
//                            htm += "<td>" + n.Currency + "</td>";

                            htm += "<td><font color=red>" + n.Balance + "</font></td>";
                            htm += "<td>" + n.Credit + "</td>";
                            htm += "<td>" + n.Agent + "</td>";
                            htm += "<td>" + (n.Status == "1" ? "启用" : "禁用") + "</td>";
                            htm += "<td>" + (n.MoneyType == "1" ? "信用" : "现金") + "</td>";
                            htm += "<td>" + n.RegistrationTime + "</td>";
                            htm += "<td>" + n.LastLoginTime + "</td>";
//                            htm += "<td>" + "<a href=\"javascript:void(0)\" onclick=\"cpwd(this)\" id=p\"" + n.ID + "\" class=\"edit_01\" >密码</a>" + "</td>";
//                            htm += "<td>" + "<a href=\"javascript:void(0)\" onclick=\"edit(this)\" id=m\"" + n.ID + "\" class=\"edit_01\" >修改</a></td>";
//                            
                            htm += "</tr>";
                        });
                        jQuery("#tab").html(htm);
                    });
                });
            });
            lang = setLang;
            jQuery("#addbz").html(getSelectBz());
        }
        //--------多语言处理结束---------

        var bindAddRoleId = false;
        var bindMdfRoleId = false;





        function edit(obj) {
            var currId = $(obj).attr("id").substr(1);
            var url = "/ServicesFile/UserService.asmx/GetUserByID";
            var data = "ID:" + currId;
            jQuery.AjaxCommon(url, data, false, false, function (json) {
                if (json.d != "none") {
                    var result = jQuery.parseJSON(json.d);
                    jQuery.each(result, function (i, n) {

                        jQuery("#pp").html(result[i].SubCompany);
                        jQuery("#P1").html(result[i].Partner);
                        jQuery("#P2").html(result[i].GeneralAgent);
                        jQuery("#P3").html(result[i].Agent);
                        jQuery("#lastname").val(result[i].LastName);
                        jQuery("#firstname").val(result[i].FirstName);
                        jQuery("input[name=male][value=" + result[i].Sex + "]").attr("checked", true);
                        jQuery("#email").val(result[i].Email);
                        jQuery("#re_mail").val(result[i].Email);
                        var d = new Date(Date.parse(result[i].Birthday.replace(/-/g, "/")));
                        var aa = d.getDate();
                        var bb = d.getMonth() + 1;
                        var cc = d.getFullYear();
                        jQuery("#dob_day").val(d.getDate());
                        jQuery("#dob_month").val(d.getMonth() + 1);
                        jQuery("#dob_year").val(d.getFullYear());
                        jQuery("#Currency").text(result[i].Currency);
                        jQuery("#country").val(result[i].Country);
                        jQuery("#addr").val(result[i].Addr);
                        jQuery("#city").val(result[i].City);
                        jQuery("#Province").val(result[i].Province);
                        jQuery("#post").val(result[i].Post);
                        jQuery("#Mobile").val(result[i].Mobile);
                        jQuery("#question").val(result[i].Question);
                        jQuery("#Answer").val(result[i].Answer);

                    });
                }
                else {

                }
            });

            jQuery("#edit").dialog({ modal: true, width: 500 });

            jQuery("#button2").unbind("click");
            jQuery("#button2").bind("click", function () {
                jQuery("#edit").dialog("close");
                var url = "/ServicesFile/UserService.asmx/UpdateUser";
                var data = "FirstName:'" + jQuery("#firstname").val() + "',LastName:'" + jQuery("#lastname").val() + "',sex:'" + jQuery("input[name=male]:checked").val() + "',Email:'" + jQuery("#email").val() + "',Birthday:'" + $("#dob_year").val() + "-" + $("#dob_month").val() + "-" + $("#dob_day").val() + "',country:'" + $("#country").val() + "',addr:'" + $("#addr").val() + "',city:'" + $("#city").val() + "',Province:'" + $("#Province").val() + "',post:'" + $("#post").val() + "',Mobile:'" + jQuery("#Mobile").val() + "',question:'" + $("#question").val() + "',Answer:'" + $("#Answer").val() + "',ID:" + currId;
                jQuery.AjaxCommon(url, data, false, false, function (json) {
                    if (json.d) {
                        jQuery("#selectbutton").click();
                        $.MsgTip({ objId: "#divTip", msg: "修改成功", delayTime: "2000" });
                    }
                    else {
                        $.MsgTip({ objId: "#divTip", msg: "修改失败", delayTime: "2000" });
                    }
                });
            });

            jQuery("#mdfCancel").unbind("click");
            jQuery("#mdfCancel").bind("click", function () {
                jQuery("#edit").dialog("close");
            });
        }

        function cpwd(obj) {
            //清空数据
            jQuery.each(jQuery("#cpwd :password"), function (i, n) {
                jQuery(n).val("");
            });
            jQuery.each(jQuery("#cpwd label[id*=Err]"), function (i, n) {
                jQuery(n).html("");
            });
            jQuery("#cpwd").dialog({ modal: true, width: 333 });

            jQuery("#mdfpasswordbtn").unbind("click");
            jQuery("#mdfpasswordbtn").bind("click", function () {
                //验证表单
                var checkform = true;
                jQuery.each(jQuery(this).parent().parent().parent().find(":password"), function (i, n) {
                    jQuery(n).blur();
                });
                jQuery.each(jQuery(this).parent().parent().parent().find("label[id*=Err]"), function (i, n) {
                    if (jQuery(n).html() != "") {
                        checkform = false;
                    }
                });
                if (!checkform) {
                    return false;
                }

                jQuery("#cpwd").dialog("close");
                var currId = $(obj).attr("id").substr(1);
                var url = "/ServicesFile/UserService.asmx/UpdatePass";
                var data = "pass:'" + $("#Password1").val() + "',userName:'" + $(obj).parent().siblings("td:eq(0)").text() + "',roleId:6";
                jQuery.AjaxCommon(url, data, false, false, function (json) {
                    if (json.d) {
                        $.MsgTip({ objId: "#divTip", msg: "密码修改成功", delayTime: "2000" });
                    }
                    else {
                        $.MsgTip({ objId: "#divTip", msg: "密码修改失败", delayTime: "2000" });
                    }
                });
            });

            jQuery("#pwdManagerId").text($(obj).parent().siblings("td:eq(0)").text());
            jQuery("#passwordCancel").unbind("click");
            jQuery("#passwordCancel").bind("click", function () {
                jQuery("#cpwd").dialog("close");
            });
        }
        function getSelectBz() {
            var html = "<select id=\"txtcurrency\">";
            var url = "/ServicesFile/RateService.asmx/GetRateByLan";
            var data = "language:'" + lang + "'";
            html += "<option value=''>币种</option>";
            jQuery.AjaxCommon(url, data, false, false, function (json) {
                if (json.d != "none") {
                    var result = jQuery.parseJSON(json.d);
                    jQuery.each(result, function (i) {

                        html += "<option value=" + result[i].code + ">" + result[i].name + "</option>";

                    });
                    html += "</select>";
                }
                else {

                }
            });
            return html;
        }
    </script>
    
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<table  id="right_main" border="0" width="100%" cellpadding="0" cellspacing="0">
<thead>
<tr class="h30">
<th width="12" class="tab_top_l"></th>
<th width="*" class="tab_top_m"><p id="zhgl">客户管理</p></th>
<th width="16" class="tab_top_r"></th>
</tr>
</thead>

<tbody>
<tr>
<td class="tab_middle_l"></td>
<td >
<div id="main">
<!--主题部分开始=========================================================================================-->
<div class="top_banner h30">



<div class="f1">
&nbsp;&nbsp;<span id="H1218">帐号</span>：<input type="text" name="txtUserName" id="txtUserName" class="text_01 h20" onmouseover="this.className='text_01_h h20'" onmouseout="this.className='text_01 h20'" />
<span id="addbz" style="display:none;"></span>
<select id="txtstatus">
    <option value="">状态</option>
    <option value="1">启用</option>
    <option value="0">禁用</option>
</select>

<select id="txtMoneyType" style=" display:none;">
    <option value="">客户类型</option>
    <option value="0">现金</option>
    <option value="1">信用</option>
</select>

注册时间：<input type="text" name="time1" id="time1" class="text_01 h20 w_80" />-
<input type="text" name="time2" id="time2" class="text_01 h20 w_80" />

<select id="agentType" style="display:none">
    <option value="">代理级别</option>
    <option value="SubCompany">分公司:</option>
    <option value="Partner">股东:</option>
    <option value="GeneralAgent">总代:</option>
    <option value="Agent">代理:</option>
</select>
<input type="text" name="agent" id="agent" class="text_01 h20 w_100" style="display:none;" />

<input id="selectbutton" type="button" class="btn_01" onmouseover="this.className='btn_01_h'" onmouseout="this.className='btn_01'" value="查找" />

</div>



</div>
<div class="cl"></div>
<table id="tab3" width=100% cellpadding=0 cellspacing="0" border=0 >
<thead> 
<tr>
<th id="zh">帐号</th>
<%--<th id="js">性别</th>
<th id="cjsj">国家</th>
<th id="gxsj">电话</th>
<th id="cjr">币种</th>
--%>
<th id="Th1">余额</th>

<th id="Th6">信用</th>
<th id="Th7">代理</th>
<th id="Th2">状态</th>
<th id="Th3">类型</th>
<th id="Th4">注册时间</th>
<th id="Th5">最后登录时间</th>
<%--<th id="pwd">密码</th>
<th id="H1009">修改</th>
--%></tr>
</thead> 
<tbody id="tab">

</tbody> 

<tfoot>
<tr>
<td colspan="14">

    &nbsp;</td>
</tr>
</tfoot>
</table>


<div class="undis">

<div id="add" title="增加用户" >
<div class="showdiv">
<ul>
<li><p><label id="Azh">帐号</label>：</p><p><input type="text" id="addManagerId" class="text_01 h20 w_120" onmouseover="this.className='text_01_h h20 w_120'" onmouseout="this.className='text_01 h20 w_120'" onblur="checkUser(this);" /> </p><label id="addErr1" style="color:Red"></label></li>
<li><p><label id="Ajs">角色</label>：</p><p>
    <select id="addRoleId">
        <option id="addRoleIdopt"></option>
    </select> </p></li>
<li><p><label id="H1061">密码</label>：</p><p><input id="addPassWord" type="password" class="text_01 h20 w_120" onmouseover="this.className='text_01_h h20 w_120'" onmouseout="this.className='text_01 h20 w_120'" onblur="IsNullByInfo(this,'addErr2',languages.H1306);" /> </p><label id="addErr2" style="color:Red"></label></li>
<li><p><label id="Aqrmm">确认密码</label>：</p><p><input id="addPassWord1" type="password" class="text_01 h20 w_120" onmouseover="this.className='text_01_h h20 w_120'" onmouseout="this.className='text_01 h20 w_120'" onblur="PassWordCheck(this,'addPassWord','addErr3','','');" /> </p><label id="addErr3" style="color:Red"></label></li>
<li><p><label id="Azt">状态</label>：</p><p>
    <select id="addEnable">
        <option value="1">启用</option>
        <option value="0">禁用</option>
    </select> </p></li>
<li><div align="center" class="mtop_30">
    <input type="button" id="AddButton" class="btn_02" value="提交" onmouseover="this.className='btn_02_h'" onmouseout="this.className='btn_02'" />
    <input type="button" id="addCancel" class="btn_02" value="取消" onmouseover="this.className='btn_02_h'" onmouseout="this.className='btn_02'" />
    </div></li>
</ul>
</div>
</div>


<div id="edit" title="修改帐号" >
<div class="showdiv">
<ul>
<li><p><span id="Mzh">分公司</span>：</p><p id="pp"> </p></li>
<li><p><span id="Span1">股东</span>：</p><p id="P1"> </p></li>
<li><p><span id="Span2">总代</span>：</p><p id="P2"> </p></li>
<li><p><span id="Span3">代理</span>：</p><p id="P3"> </p></li>
<li><p><span id="Span4">名</span>：</p><input type="text" name="lastname" value="" class="text" id="lastname"/></li>
<li><p><span id="Span5">姓</span>：</p><input type="text" name="firstname" value="" class="text" id="firstname"/></li>
<li><p><span id="Span6">性别</span>：</p><input type="radio" name="male" value="男" id="male"/> <font class="L271"> 男</font>
                                <input type="radio" name="male" value="女" id="female" /> <font class="L272"> 女</font></li>
<li><p><span id="Span7">电子邮箱</span>：<input type="text" name="email" value="" class="text" id="email"/></li>
<li><p><span id="Span8">出生日期</span>：</p>                                <select name="dob_day_msg" id="dob_day" class="dob"  >
						<script type="text/javascript">
						    var dob_day = parseInt('');
						    for (var i = 1; i <= 31; i++) {
						        if (i == dob_day) {
						            document.write("<option id=\"dob_day_" + i + "\" value=\"" + i + " \" selected=\"selected\">" + i + "<\/option>");
						        } else {
						            document.write("<option id=\"dob_day_" + i + "\" value=\"" + i + "\">" + i + "<\/option>");
						        }
						    }
						</script>
					</select>
					           <font  class="L281">日</font> 
					            <select name="dob_month" id="dob_month" class="dob" >
						
							<option value="1" >1</option>
						
							<option value="2" >2</option>
						
							<option value="3" >3</option>
						
							<option value="4" >4</option>
						
							<option value="5" >5</option>
						
							<option value="6" >6</option>
						
							<option value="7" >7</option>
						
							<option value="8" >8</option>
						
							<option value="9" >9</option>
						
							<option value="10" >10</option>
						
							<option value="11" >11</option>
						
							<option value="12" >12</option>
						
					</select>
					           <font class="L277">月</font>
					            <select name="dob_year" id="dob_year" class="dob" >
						<script type="text/javascript">
						    var d = new Date;
						    var dob_year = parseInt('');
						    for (var i = d.getFullYear() - 18; i > d.getFullYear() - 120; i--) {
						        if (i == dob_year) {
						            document.write("<option value=\"" + i + "\" selected=\"selected\">" + i + "<\/option>");
						        } else {
						            document.write("<option value=\"" + i + "\">" + i + "<\/option>");
						        }
						    }
						</script>
					</select>
                    <font class="L277">年</font>
                    </li>
<li><p><span id="Span9">国家</span>：</p><input type="text" name="country" value="" class="text" id="country"/></li>
<li><p><span id="Span10">地址</span>：</p><input type="text" name="addr" value="" class="text" id="addr"/></li>
<li><p><span id="Span11">城市／城镇</span>：</p><input type="text" name="city" value="" class="text" id="city"/></li>
<li><p><span id="Span12">州 / 省</span>：</p><input type="text" name="Province" value="" class="text" id="Province"/></li>
<li><p><span id="Span13">邮编</span>：</p><input type="text" name="post" value="" class="text" id="post"/></li>
<li><p><span id="Span14">手机号码</span>：</p><input type="text" name="Mobile" value="" class="text" id="Mobile"/></li>
<li><p><span id="Span15">安全提问</span>：</p><select name="question" id="question">
                                                    
                                      <option value="母亲的名字？" >母亲的名字？</option>
                          
                                      <option value="您最喜欢的书是？" >您最喜欢的书是？</option>
                          
                                      <option value="您最喜欢的宠物名字是" >您最喜欢的宠物名字是</option>
                          
                                      <option value="您最喜欢的电影是？" >您最喜欢的电影是？</option>
                          
                                      <option value="您的爱好是？" >您的爱好是？</option>
                          
                                      <option value="您喜欢的体育队伍是？" >您喜欢的体育队伍是？</option>
                          
                                      <option value="您的秘密号码是？" >您的秘密号码是？</option>
                          
                                </select></li>
<li><p><span id="Span16">安全问题答案</span>：</p><input type="text" name="Answer" value="" class="text" id="Answer"/></li>

<li><div align="center" class="mtop_30">
    <input type="button" id="button2" class="btn_02" value="提交" onmouseover="this.className='btn_02_h'" onmouseout="this.className='btn_02'" />
    <input type="button" id="mdfCancel" class="btn_02" value="取消" onmouseover="this.className='btn_02_h'" onmouseout="this.className='btn_02'" /></div></li>
</ul>
</div>
</div>

<div id="cpwd" title="修改密码" >
<div class="showdiv">
<ul>
<li><p><span id="Mmm">帐号</span>：</p><p id="pwdManagerId"> </p></li>
<li><span id="xgmm">修改密码</span>：<input id="Password1" type="password" class="text_01 h20 w_120" onmouseover="this.className='text_01_h h20 w_120'" onmouseout="this.className='text_01 h20 w_120'" onblur="IsNullByInfo(this,'passErr1',languages.H1306);" /><label id="passErr1" style="color:Red"></label></li>
<li><span id="qrmm">确认密码</span>：<input id="Password2" type="password" class="text_01 h20 w_120" onmouseover="this.className='text_01_h h20 w_120'" onmouseout="this.className='text_01 h20 w_120'" onblur="PassWordCheck(this,'Password1','passErr2','','');" /><label id="passErr2" style="color:Red"></label></li>
<li><div align="center" class="mtop_30">
    <input type="button" id="mdfpasswordbtn" class="btn_02" value="提交" onmouseover="this.className='btn_02_h'" onmouseout="this.className='btn_02'" />
    <input type="button" id="passwordCancel" class="btn_02" value="取消" onmouseover="this.className='btn_02_h'" onmouseout="this.className='btn_02'" /></div></li>
</ul>
</div>
</div>



<div id="delet" title="删除" >
<div class="showdiv">
<p class="wrnning" id="qdyscm">确定要删除&nbsp;<span id="delManagerId" style="color:Red;"></span>&nbsp;吗？</p>
<div align="center" class="mtop_50"> 
    <input type="button" id="deletebtn" class="btn_02" value="确定" onmouseover="this.className='btn_02_h'" onmouseout="this.className='btn_02'" />
    <input type="button" id="deletecancel" class="btn_02" onmouseover="this.className='btn_02_h'" onmouseout="this.className='btn_02'" value="取消" />
</div>

</div>
</div>



</div>
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
<asp:hiddenfield ID="roleid" runat="server"></asp:hiddenfield>
    </form>
</body>
</html>
