﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="percent.aspx.cs" Inherits="agent.User.percent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=7" />
    <link href="/css/Default/cupertino/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <link href="/css/Default/globle.css" rel="stylesheet" type="text/css" />
    <link href="/css/Default/right_main.css" rel="stylesheet" type="text/css" />
    <link href="/css/Default/tab.css" rel="stylesheet" type="text/css" />
    <link href="/css/Default/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.4.1.min.js"></script>
    <script src="/js/jquery-ui.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/jQueryCommon.js"></script>
    <script src="/js/tab1.js" type="text/javascript"></script>
    <script src="/js/page/pageJs.js" type="text/javascript"></script>
    <script type="text/javascript">
        var zm = "";
        var pd = 0;
        var count1 = 0;
        var pageCount = 20;
        var roleId = 2; //级别
        var upUserName = "";
        var aIndex = 0;
        var type;
        var percentIS = "";
        var comm = 0; //占成
        var companyPercent = 0;
        var pcomm = 0;
        var comms = -1;
        var perA = 0; //佣金
        var perB = 0;
        var perC = 0;
        var a = 0;
        var b = 0;
        var c = 0;
        var zc = "";
        var percent = "";
        var yjb = "";
        var yjc = "";
        var group = "";
        var commission = "";
        //var percents = "";
        jQuery(function () {
            type = new Array();
            type[0] = "分公司";
            type[1] = "股东";
            type[2] = "总代";
            type[3] = "代理";
            type[4] = "会员";
            jQuery("#datarow").hide();

            SetGlobal("");
        });

        //---------多语言处理-----------
        var languages = "";
        var lang;
        function SetGlobal(setLang) {

            setLang = $.SetOrGetLanguage(setLang, function () {
                languages = language;
                //getC();
                setConfig();
                //getpage();
                getCount("<% =UserName %>","<% =RoleId %>",<% =Percent %>);

                jQuery("#selectbutton").click(function () {
                    pd = 0;
                    getpage();
                });


                $("#yszcs").html(languages.预设占成数);
                $("#H1460").html(languages.H1460);
                $("#H1218").html(languages.H1218);
				$("#stateSlt option:eq(0)").text(languages.H1040);
				$("#stateSlt option:eq(1)").text(languages.H1049);
				$("#stateSlt option:eq(2)").text(languages.H1050);
				$("#stateSlt option:eq(3)").text(languages.H1101);
				$("#selectbutton").val(languages.H1447);
				
				$("#zh").html(languages.H1218);
                $("#xm").html(languages.H1449);
                $("#zc").html(languages.H1452);
                $("#zt").html(languages.H1070);
				$("#zhdl").html(languages.H1457);
				$("#xg").html(languages.H1009);
				
				$("#H1028").html(languages.H1028);
				$("#H1029").html(languages.H1029);
				$("#H10281").html(languages.H1028);
				$("#H1030").html(languages.H1030);
				$("#H1031").html(languages.H1031);
				$("#H1032").html(languages.H1032);
				$("#H1033").html(languages.H1033);
				$("#H1034").html(languages.H1034);
				
				$("#delet").attr("title",languages.H1072);
				$("#deletecancel").val(languages.H1037);

            });
            lang = setLang;
        }
        //--------多语言处理结束---------

        /*----------------获得字母结束-------------------*/
        /*----------------设置分公司提成-----------------*/
        function setConfig() {
            jQuery.AjaxCommon("/ServicesFile/UserService.asmx/GetConfigAll", "", true, false, function (json) {
                if (json.d != "none") {
                    var count = 0;
                    var result = jQuery.parseJSON(json.d);
                    jQuery.each(result, function (i) {
                        if (result[i].Otype == "公司占成") {
                            companyPercent = result[i].Oval;
                            comm = (100 - result[i].Oval * 100);
                            count++;
                        }
                    });
                }
            });
        }
        /*----------------设置分公司提成结束--------------*/
        /*----------------获得分页-----------------------*/
        function getpage() {
            var data = "moneyType:'',upUserName:'" + upUserName + "',userName:'" + jQuery("#UserName").val() + "',status:'" + jQuery("#stateSlt").val() + "',roleId:" + roleId;
            jQuery.AjaxCommon("/ServicesFile/UserService.asmx/GetAgentsAcount", data, true, false, function (json) {
                var count = 0;
                if (json.d != "none") {
                    count1 = json.d;
                    if (count1 % pageCount == 0) {
                        count = parseInt(count1 / pageCount);
                    }
                    else {
                        count = parseInt(count1 / pageCount) + 1;
                    }
                }
                //参数:总页数,总记录数,每页记录数,查询的起始行变量名,查询数量变量名
                IsPage("" + count, "" + count1, "" + pageCount, "limitStart", "limitEnd");
            });
        }
        /*----------------获得分页结束-------------------*/
        /*----------------获得该账号下的子集账号----------*/
        function getCount(name, id, c) {
        //debugger;
            pd = 1;
            comm = c;
            if(comms==-1){
            comms = 100 - (comm +comms+ companyPercent*100);
            }else{
            //comms=parseInt(comms)-comm;
            comms=comm;
            }
            roleId = parseInt(id);
            upUserName = name;
            getC();
            getpage();
        }
        /*--------------获得该账号下的子集账号结束--------*/
        /*----------------获得丢标记中账号下的子集账号----------*/
        function getCount1(name, id, Index, c) {
            //debugger;
            pd = 1;
            if (Index == 0) {
                setConfig();
                aIndex = 0;
                comms = -1;
                jQuery("#pathP>a:gt(" + Index + ")").remove();
            }
            else {
                comm = c;
                comms = c;
                aIndex = Index - 1;
                jQuery("#pathP>a:gt(" + Index + ")").remove();
                jQuery("#pathP>a:eq(" + Index + ")").remove();
            }
         
            roleId = parseInt(id);
            upUserName = name;
            getpage();
        }

        function getC() {
            percents = "<select>";
            //for (var i = 0; i <= pcomm; i += 5) {
            for (var i = 0; i <= comm; i += 5) {
                percents += "<option value=\"" + (i == 100 ? "1" : (i < 10 ? "0.0" + i : "0." + i)) + "\">" + (i == 100 ? "1" : (i < 10 ? "0.0" + i : "0." + i)) + "</option>";
            }
            percents += "</select>";
        }

        /*--------------获得丢标记中账号下的子集账号结束--------*/
        /*--------------查询方法------------------------------*/
        var tr1;
        function setDate(data) {
            <% if(searchAc) { %>
            var data = "moneyType:'',upUserName:'" + upUserName + "',userName:'" + jQuery("#UserName").val() + "',status:'" + jQuery("#stateSlt").val() + "'," + data + ",roleId:" + roleId;
            <% } else { %>
            var data = "moneyType:'',upUserName:'" + upUserName + "',userName:'',status:''," + data + ",roleId:" + roleId;
            <% } %>
            jQuery.AjaxCommon("/ServicesFile/UserService.asmx/GetAgents", data, true, false, function (json) {
                if (json.d != "none") {
                    jQuery("#tab>tr").remove();
                    tr1 = jQuery("#datarow").clone();
                    var result = jQuery.parseJSON(json.d);
                    if (pd) {
                        jQuery("#pathP").html(jQuery("#pathP").html() + (roleId != 2 ? "<a onmouseover=\"this.style.cursor='hand'\" onclick=\"getCount1('" + upUserName + "','" + roleId + "','" + (++aIndex) + "'," + percent + "'" + comm + "')" + "\"> >" + upUserName + "</a>" : ""));
                    }
                    pd = 0;
                    jQuery.each(result, function (i) {
                        var f = jQuery("#datarow").clone(true);
                        f.find("#tduserName").html((roleId != 6 ? "<a onmouseover=\"this.style.cursor='hand'\" " + ("onclick=\"getCount('" + result[i].UserName + "','" + (parseInt(result[i].RoleId) + 1) + "'," + (result[i].Percent * 100) + ")") + "\">" + result[i].UserName + "</a>" : "" + result[i].UserName));
                        f.find("#tdname").html(result[i].Name);
                        group = result[i].Group;
                        f.find("#tdpercent").html(parseFloat(result[i].Percent).toFixed(2));
                        f.find("#tdstatus").html(result[i].Status == "1" ? languages.H1049 : (result[i].Status == "0" ? languages.H1050 : languages.H1101));
                        f.find("#tdlastLoginTime").html(result[i].LastLoginTime);
                        <% if(mdfAc) { %>
                        if(roleId != 6) {
                            f.find("#tdupdate").html("<a id=\"update\" style=\"cursor:hand\" onclick=\"bindClick(this,'" + result[i].ID + "')\"><img title=\"" + languages.H1009 + "\" src=\"/images/Icon/page_edit.gif\" /></a>");
                        }
                        <% } %>
                        f.show().appendTo("#tab");
                    });
                }
            });
        }

        function selectCommission(id) {
            var data = "roleId:" + roleId + ",upUserID:" + id;
            jQuery.AjaxCommon("/ServicesFile/UserService.asmx/GetRoleCommission", data, true, false, function (json) {
                if (json.d != "none") {
                    var count = 0;
                    var result = jQuery.parseJSON(json.d);
                    jQuery.each(result, function (i) {
                        a = parseFloat(result[i].CommissionA).toFixed(2);
                        b = parseFloat(result[i].CommissionB).toFixed(2);
                        c = parseFloat(result[i].CommissionC).toFixed(2);
                    });
                }
            });
        }

        function bindClick(tr, id) {
            selectCommission(id);
            percentIS = jQuery(tr).parent().parent().find("#tdpercent").text();
           // debugger;
            
           // bindEsc(tr, percentIS, 23);
            if (roleId != 2) {
                if (pcomm != 0) {
                    if (pcomm < comms) {
                        comms = 100 - (pcomm * 1 + companyPercent * 100);
                    }
                  }else{
                  if(roleId==6){
                    comms = comm;
                    }
                  }
            } else {
                comms = comm;
            }
                percents = "<select class='selpercent'>"
                //for (var i = 0; i <= parseInt(comms); i += 5) {
                for (var i = 0; i <= parseInt(comm); i += 5) {
                    percents += "<option value=\"" + (i == 100 ? "1" : (i < 10 ? "0.0" + i : "0." + i)) + "\">" + (i == 100 ? "1" : (i < 10 ? "0.0" + i : "0." + i)) + "</option>";
                }
                percents += "</select>";
                jQuery(tr).parent().parent().find("#tdpercent").html(percents);

                $(tr).parents("tr").children("td:eq(2)").find(".selpercent").val(percentIS);

                jQuery(tr).parent().parent().find("#tdupdate").html("<a style=\"cursor:hand\" id=\"saveA\" onclick=\"bindSave(this,'" + id + "')\" ><img src=\"/images/Icon/Icon321.png\" title=\"" + languages.H1025 + "\" /></a>&nbsp;&nbsp;&nbsp;&nbsp;<a style=\"cursor:hand\" onclick=\"bindEsc(this,'" + percentIS + "','" + id + "')\" id=\"escA\"><img src=\"/images/Icon/Icon390.png\"  title=\"" + languages.H1011 + "\" /></a>");
        }



        function bindSave(tr, id) {
            var percent = jQuery(tr).parent().parent().find("#tdpercent").find(".selpercent").val();

            var data = "ID:'" + id + "',percent:'" + percent + "',";
            data += "roleId:'" + roleId + "'";
            jQuery.AjaxCommon("/ServicesFile/UserService.asmx/UpdatePercent", data, false, false, function (json) {
                if (json.d == "ok") {
                    jQuery(tr).parent().parent().find("#tdpercent").html("" + percent);
                    <% if(mdfAc) { %>
                    jQuery(tr).parent().parent().find("#tdupdate").html("<a style=\"cursor:hand\" id=\"update\"onclick=\"bindClick(this,'" + id + "')\"><img title=\"" + languages.H1009 + "\"  src=\"/images/Icon/page_edit.gif\" /></a>");
                    <% } %>
                    jQuery("#delet").dialog({ modal: false });
                    $(".wrnning").html("<p>" + languages.H1012 + "</p>");
                    var y=(percent*1 + companyPercent*1);
                    pcomm =(1-y) * 100;
                    comm=pcomm;
                    //debugger;
                    //getC();
                    setConfig();
                    getpage();
                    jQuery("#deletecancel").unbind("click");
                    jQuery("#deletecancel").bind("click", function () {
                        jQuery("#delet").dialog("close");
                    });
                }
                else {
                    jQuery("#delet").dialog({ modal: false });
                    $(".wrnning").html("<p> " + json.d + " </p>");
                    jQuery("#deletecancel").unbind("click");
                    jQuery("#deletecancel").bind("click", function () {
                        jQuery("#delet").dialog({ beforeClose: function () {
                            $(".selpercent").val(percentIS);
                        }
                        });
                        $(".selpercent").val(percentIS);

                        jQuery("#delet").dialog("close");
                    });
                }
            });

           
        }

        function bindEsc(tr, percent, id) {
            jQuery(tr).parent().parent().find("#tdpercent").html("" + percent);
            <% if(mdfAc) { %>
            jQuery(tr).parent().parent().find("#tdupdate").html("<a style=\"cursor:hand\" id=\"update\"onclick=\"bindClick(this,'" + id + "')\"><img title=\"" + languages.H1009 + "\"  src=\"/images/Icon/page_edit.gif\" /></a>");
            <% } %>
        }

        function Conversion(parameter) {
            var status = ""
            if (parameter == "1") {
                status = languages.H1049;
            }
            else if (parameter == "0") {
                status = languages.H1050;
            }
            else if (parameter == "2") {
                status = languages.H1101;
            }
            return status;
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
<th width="*" class="tab_top_m"><p id="pathP"><font class="st"> <span id="yszcs">预设占成数</span></font><a onmouseover="this.style.cursor='hand'"></a></p></th>
<th width="16" class="tab_top_r"></th>
</tr>
</thead>

<tbody>
<tr>
<td class="tab_middle_l"></td>
<td >
<div id="main">
<% if (searchAc)
   { %>
<div class="top_banner h30">

&nbsp;&nbsp;<span id="H1218">帐号</span>：<input type="text" name="UserName" id="UserName" class="text_01 h20" onmouseover="this.className='text_01_h h20'" onmouseout="this.className='text_01 h20'" />
<select id="stateSlt">
    <option value="">全部</option>
    <option value="1">启用</option>
    <option value="0">禁用</option>
    <option value="2">暂停</option>
</select>
<input id="selectbutton" type="button" class="btn_01" onmouseover="this.className='btn_01_h'" onmouseout="this.className='btn_01'" value="查 找" />
</div>
<% } %>
<div id="add_list" class="new_tr undis">
<div class="new_trfoot"></div>
</div>

<div class="cl"></div>

    <table width="100%" id="tb" cellpadding="0" class="tab2" >
        <thead>
            <tr>
                <th id="zh">帐号</th>
                <th id="xm">姓名</th>
                <th id="zc">占成</th>
                <th id="zt">状态</th>
                <th id="zhdl">最后登录</th>
                <% if (mdfAc)
                   { %>
                <th id="xg">修改</th>     
                <% } %>
            </tr>
        </thead>
        <tbody id="tab">        
            </tbody>
          <tfoot><tr>
          <td colspan="9" >
              <div id="pageDiv" class="grayr"><span id="H1028">总共</span><label id="infoCount"></label><span id="H1029">条记录</span>,<span id="H10281">共</span><label id="pageCount"></label><span id="H1030">页</span><a style="cursor:hand"> <span id="H1031">首页</span> </a><a style="cursor:hand"> <span id="H1032">上一页</span> </a><span id="pageSpan"></span><a style="cursor:hand"> <span id="H1033">下一页</span> </a><a style="cursor:hand"> <span id="H1034">尾页</span> </a></div>
          </td>
          </tr>
          <tr id="datarow">
            <td id="tduserName"></td>
            <td id="tdname"></td>
            <td id="tdpercent"></td>
            <td id="tdstatus"></td>
            <td id="tdlastLoginTime"></td>
            <% if (mdfAc)
               { %>
            <td id="tdupdate"></td>
            <% } %>
            </tr>
          </tfoot>
    </table>

</div>
</td>
<td class="tab_middle_r"></td>
</tr>
</tbody>

</table>
<div class="undis">
<div id="delet" title="提示" >
<div class="showdiv">
<p class="wrnning"></p>
<div align="center" class="mtop_50">
    <input type="button" id="deletecancel" class="btn_02" onmouseover="this.className='btn_02_h'" onmouseout="this.className='btn_02'" value="确定" />
</div>
</div>
</div>
</div>
<asp:hiddenfield ID="agenId" runat="server"></asp:hiddenfield>
</form>
</body>
</html>
