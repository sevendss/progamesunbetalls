﻿<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>618官方娱乐（618shenbo.com）_现场娱乐_电子游艺_体育竞技</title>
    <link rel="icon" href="/images/favicon.ico" type="image/x-icon" />
    <link type="text/css" rel="stylesheet" media="all" href="index.css" />
    <link type="text/css" rel="stylesheet" href="css/zuce.css" />
    <link type="text/css" rel="stylesheet" href="css/about.css" />
    <link rel="stylesheet" type="text/css" href="/portal_asset/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/portal_asset/css/page/slider.css" />
    <link rel="stylesheet" type="text/css" href="/portal_asset/css/module/jquery.jscrollpane.css" />
    <link href="portal_asset/css/jquery-ui.css" rel="stylesheet" />
    <script src="js/zzsc.js"></script>
    <script type="text/javascript" src="/portal_asset/js/libs/tgp.js?clientId=a8hHfj3ckdk4Djfi&t=20140930173901"></script>
    <script type="text/javascript" src="/portal_asset/js/libs/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/portal_asset/js/libs/i18next-1.7.3.js"></script>
    <script type="text/javascript" src="/portal_asset/js/libs/jquery.jscrollpane.min.js"></script>
    <script type="text/javascript" src="/portal_asset/js/libs/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="/portal_asset/js/libs/angular.js"></script>
    <script type="text/javascript" src="/portal_asset/js/libs/angular-route.js"></script>
    <script type="text/javascript" src="/portal_asset/js/libs/angular-cookies.js"></script>
    <script src="/portal_asset/js/libs/jquery.cookie.js" type="text/javascript"></script>
    <script src="portal_asset/js/jQueryCommon.min.js?t=201505161111111111111"></script>

</head>
<body>

    <div id="ng-app" class="ng-scope" ng-app="ctrlApp" xmlns:my="ignored">
        <div class="nav">
            <div class="nav_small">
                <ul style="float:left">
                    <li><a href="help.html">常见问题</a></li>
                    <li><span>&nbsp;|</span><a href="freePay.html">&nbsp;免费参观</a></li>
                    <li><span>&nbsp;|</span><a href="about.html">&nbsp;关于我们</a></li>
                    <!--<li><a href="">手机投注<span>|</span></a></li>-->
                    <li><span>&nbsp;|</span><a href="zhaopai.html">&nbsp;牌照展示</a></li>
                    <li><span>&nbsp;|&nbsp;</span><a my-checklogin="" href="javascript:void(0)" class="over" ng-if="status.isLoaded" href-link="#" is-check-login="true" lobby-type="live" target="_blank" action-text="banners.liveGame.btn_text_login" login-text="banners.liveGame.btn_text">登陆游戏</a></li>

                </ul>

                <ul style="float:right">

                    <li class="userInfo left" ng-show="isAuthorized">
                        <div>

                            <p class="userInfo left white">欢迎您：{{username}} &nbsp;&nbsp;<a href="memberCenter.aspx">【会员中心】</a> &nbsp;&nbsp;</p>
                            <div class="clearFix"></div>
                        </div>
                    </li>


                    <li class="LS-service" ng-show="isAuthorized" ng-click="tgpLogout(true)">
                        <span style=" font-weight: 800; font-size: 14px; color: #3B240B;">【</span><a href="" class="over" id="tgpLogout" data-i18n="button.logout" style=" font-weight: 800; font-size: 14px; color: #3B240B;"></a><span style=" font-weight: 800; font-size: 14px; color: #3B240B;">】</span>
                        </>
                    </li>
                    <!--<li><a href="">会员中心<span>|</span></a></li>-->

                    <li><a href="http://www.11scweb.com/air/air-bin/SunbetGameSetup3.2.8.exe">&nbsp;客户端下载</a></li>
                    <li><span>&nbsp;|</span><a href="appGame.html" target="_blank">&nbsp;手机APP版</a></li>
                    <li>
                        <div ng-hide="isAuthorized">
                            <span>&nbsp;|</span><a href="#" onclick="AddFavorite(window.location,document.title)">&nbsp;&nbsp;加入收藏</a>
                        </div>
                    </li>

                    <li>
                        <div ng-hide="isAuthorized">
                            <span>&nbsp;|</span><a href="javascript:void(0)" onclick="SetHome(this,window.location)">&nbsp;&nbsp;设为首页</a>
                        </div>
                    </li>
                </ul>
                <div class="yuan"></div>
            </div>
        </div>

        <div class="nav_bottm">
            <div class="logo">
                <a href=""><img src="images/logo.png" alt="" /></a>
            </div>
            <div class="kaitong">
                <a href="register.html"><img src="images/logo_icon_06.png" alt="" /></a>
            </div>

            <div class="login"><a my-checklogin="" id="sliderBtn" href="javascript:void(0)" class="over" ng-if="status.isLoaded" href-link="#" is-check-login="true" lobby-type="live" target="_blank" action-text="banners.liveGame.btn_text_login" login-text="banners.liveGame.btn_text"></a> </div>

            <div class="pelope">
                <a href="javascript:void(0);" onclick="openwin()"><img src="images/logo_icon_03.png" alt="" /></a>
            </div>
        </div>


        <div class="modal-overlay my-hidden" ng-show="isShowTnc">
            <div class="mask"></div>
            <div id="tncDetail" class="tnc-modal-detail">
                <div id="tncModal" class="modal-content">
                    <div class="modal-title" data-i18n="login.userTnC"></div>
                    <div class="clearfix"></div>
                    <div id="tncContent" class="modal-inner-content">
                        <div my-tnc=my-tnc></div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="modal-btn">
                        <a data-i18n="button.agree" ng-click="closeTnc()" class="btn-first button left"> </a>
                        <a data-i18n="button.disagree" ng-click="disagreeTnc()" class="btn-second button left"></a>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal-overlay my-hidden" ng-show="isShowConfirmLogout">
            <div class="mask" ng-click="cancelLogout()"></div>
            <div class="logout-modal-detail" ng-hide="logoutTGPLoading">
                <div class="modal-content">
                    <div>
                        <div class="btn-close" ng-click="cancelLogout()"></div>
                        <div class="clearfix"></div>
                        <div class="modal-title" data-i18n="login.confirmLogout"></div>
                        <div class="modal-btn">
                            <a data-i18n="button.confirm" ng-click="confirmLogout()" class="btn-first button "> </a>
                            <a data-i18n="button.cancel" ng-click="cancelLogout()" class="btn-second button "></a>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="logoutLoading" ng-show="logoutTGPLoading">
                <img src="/portal_asset/images/loading.gif" />
            </div>
        </div>


        <div class="modal-overlay my-hidden" ng-show="isShowPopupGame" style=" display:none">
            <div class="mask" ng-click="cancelPopupGame()"></div>
            <div class="logout-modal-detail">
                <div class="modal-content">
                    <div>
                        <div class="btn-close" ng-click="isShowPopupGame = false"></div>
                        <div class="clearfix"></div>
                        <div class="modal-title" data-i18n="button.enterNowConfirm"></div>
                        <div class="modal-btn">
                            <a data-i18n="button.confirm" ng-click="openUrl(currentPage)" class="btn-first button left"> </a>
                            <a data-i18n="button.cancel" ng-click="isShowPopupGame = false" class="btn-second button left"></a>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <my-hidden></my-hidden>


        <div class="content">
            <div class="cent_nav">
                <ul>
                    <li><a href="index.html" class="a11"></a></li>
                    <li><a href="gameProject.html" class="b"></a></li>
                    <li><a href="transfers.aspx" class="c"></a></li>
                    <li><a href="promotion.html" class="d"></a></li>
                    <li><a href="agent.html" class="f"></a></li>
                    <li><a href="transfers1.aspx" class="e" target="_blank"></a></li>

                </ul>
            </div>
            <p class="tishi">
                <marquee behavior="scroll" scrolldelay="200" onmouseout="this.start()" onmouseover="this.stop()" id="demo2"></marquee>

            </p>
            <div class="lunbo">
                <!--<div class="lunbo_head"></div>-->
                <div class="lunbo_bottom">
                    <table width="990" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <!-- 代码 开始 -->
                                <div style="Height:327px; OVERFLOW:hidden;" id=idTransformView class="nav1">
                                    <ul id=idSlider class=slider>
                                        <div style="">
                                            <a href="promotion.html"><img alt="" src="images/01.jpg" width=990 height=327 /></a>
                                        </div>
                                        <div style="">
                                            <a href="promotion.html"><img alt="" src="images/02.jpg" width=990 height=327 /></a>
                                        </div>
                                        <div style="">
                                            <a href="promotion.html"><img alt="" src="images/03.jpg" width=990 height=327 /></a>
                                        </div>
                                        <div style="">
                                            <a href="promotion.html"><img alt="" src="images/04.jpg" width=990 height=327 /></a>
                                        </div>
                                        <div style="">
                                            <a href="promotion.html"><img alt="" src="images/05.jpg" width=990 height=327 /></a>
                                        </div>
                                    </ul>
                                </div>

                                <div>
                                    <ul id="idNum" class="hdnum">
                                        <li> <a href="javascript:void(0)"><img src="images/01.jpg" width="330" height="140" /></a></li>
                                        <li> <a href="javascript:void(0)"><img src="images/02.jpg" width="330" height="140" /></a></li>
                                        <li> <a href="javascript:void(0)"><img src="images/03.jpg" width="330" height="140" /></a></li>
                                        <li> <a href="javascript:void(0)"><img src="images/04.jpg" width="330" height="140" /></a></li>
                                        <li> <a href="javascript:void(0)"><img src="images/05.jpg" width="330" height="140" /></a></li>
                                    </ul>
                                    <script language=javascript>
                                        mytv("idNum", "idTransformView", "idSlider", 327, 5, true, 2000, 5, true, "onmouseover");
                                        //按钮容器aa，滚动容器bb，滚动内容cc，滚动宽度dd，滚动数量ee，滚动方向ff，延时gg，滚动速度hh，自动滚动ii，
                                    </script>
                                </div>
                                <!-- 代码 结束 -->
                            </td>
                        </tr>
                    </table>
                    <!--
                      <ul>
                          <li>轮播一</li>
                          <li>轮播二</li>
                          <li>轮播三</li>
                      </ul>-->
                </div>
            </div>
            <div class="cent_news">
                <div class="new_cents">
                    <div class="new_cents_top"><span></span>现场娱乐</div>
                    <div class="new_cents_img"><a href="livegame.html" target="_blank"><img src="images/opc_1.jpg" alt="" /></a></div>
                </div>
                <div class="new_cents new_cents_dz">
                    <div class="new_cents_top"><span></span>电子游戏</div>
                    <div class="new_cents_img"><a href="egame.html" target="_blank"><img src="images/opc_2.jpg" alt="" /></a></div>
                </div>
                <div class="new_cents new_cents_bc">
                    <div class="new_cents_top"><span></span>体育竞技</div>
                    <div class="new_cents_img"><a href="sportbook.html" target="_blank"><img src="images/opc_3.jpg" alt="" /></a></div>
                </div>
                <div class="new_cents_zx">
                    <div class="new_cents_ct"><a href="http://www.11scweb.com/air/air-bin/SunbetGameSetup3.2.8.exe"><img src="images/zc_01.png" /></a></div>
                    <div class="new_cents_su"><a target="_blank" href="appGame.html"><img src="images/zc_02.png" /></a></div>
                    <div class="new_cents_su" id="sliderBtn2"><a my-checklogin="" href="javascript:void(0)" class="over" ng-if="status.isLoaded" href-link="#" is-check-login="true" lobby-type="live" target="_blank" action-text="banners.liveGame.btn_text_login" login-text="banners.liveGame.btn_text" style="margin-left: 5px; color: #fbe7aa; font-size: 23px; margin-left: 40px; font-weight: 900;"></a></div>
                </div>
            </div>
        </div>




        <div class="footer">
            <div class="footer-text"><img src="images/bg.jpg" alt="" /></div>
        </div>

        <div class="footer11">
            <div class="footer_column">
                <div class="column01">
                    <div class="info_title01">信息</div>
                    <div class="line"></div>
                    <p>
                        <span> 注册</span>
                        点击立即开户即可享受所有的精彩游戏，更有机会获取高达100%的开户红利，最高可送￥18,888。
                    </p>
                    <p>
                        <span>协议条款</span>
                        我们提供最优秀的真人视讯平台，拥有正规牌照，并设置相关安全设施，确保游戏的公平。
                    </p>
                    <p>
                        <span>游客参观</span>
                        游戏平台全面开放，让您无需注册也可以一饱眼福。联系在线客服索要试玩账号
                    </p>
                </div>
                <div class="column02">
                    <div class="info_title02">产品</div>
                    <div class="line"></div>
                    <p>
                        <span> 现场娱乐</span>
                        我们强力首推，您可饱览整个游戏大厅和靓丽的SUNGIRL荷官。玩法众多,花样百变，赶快注册属于自己的账号吧！
                    </p>
                    <p>
                        <span>电子游戏</span>
                        我们拥有多种精彩电子游艺种类，画质精美，运行流畅，使您最大限度的拥有完美游戏体验
                    </p>
                    <p>
                        <span>体育竞技</span>
                        我们为您提供最专业的体育平台。每天多达300多场体育赛事，足球、篮球、网球等应有尽有，玩家可尽情享受体育投注乐趣。
                    </p>
                </div>
                <div class="column03">
                    <div class="info_title03">星级服务</div>
                    <div class="line"></div>
                    <p>
                        <span>联系我们</span>
                        如果您有任何关于游戏或者是娱乐场方面的疑问，您随时可通过在线客服、QQ客服或者电话客服获取帮助。
                    </p>
                    <p>
                        <span>优质服务承诺</span>
                        自成立至今，我们致力提供多元化的体育竞技及网上娱乐，让客户能每天24小时体验到最精采刺激的休闲享受，更藉以丰富奖赏，以回馈所有大众对我们的支持及热烈参与
                    </p>
                    <p>
                        <span>快速存取款</span>
                        我们提供各种安全简便的存款及提款选择给客户。我们希望所有的客户能够在一个安全愉快的环境中，享受本公司精心设计的产品和服务，并能够从中获利。我们欢迎如有需要，请通过电子邮件方式将相关讯息发送至电子邮箱：9790181@qq.com 我们将认真听取客户对我们提出的任何意见。
                    </p>

                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <!--<div class="kefuBox" id="" style="right: -171px;">
        <div class="kefu_left">
            <a href="javascript:void(0);"><img style="border:0" alt="" src="images/kefu_on.gif" /></a>
        </div>
        <div class="kefu_right">
            <div class="kefu_top">
                <a target="_blank" href="FastMoney_new.aspx"><img style="border:0" alt="" src="images/chongzhi_on.png" /></a>
            </div>
            <div class="kefu_bot">
                <a onclick="openwin()" href="javascript:void(0);"><img style="border:0" alt="" src="images/zaixian_on.png" /></a>
            </div>
        </div>
    </div>-->
    <!--客服弹出框-->
    <div class="kefuBox" id="kefuBox" style="right: -190px;">
        <div class="kefu_left">
            <a href="javascript:void(0);"><img style="border:0;height: 293px" alt="" src="images/kefu_on.gif" /></a>
        </div>
        <div class="kefu_right">
            <div class="kefu_top">
                <a target="_blank" href="transfers1.aspx"><img style="border: 0; margin-left: -22px;margin-top:11px " alt="" src="images/chongzhi_on.png" /></a>
            </div>
            <div class="kefu_bot">
                <a onclick="openwin()" href="javascript:void(0);"><img style="border: 0; margin-left:-22px; margin-top:5px  " alt="" src="images/zaixian_on.png" /></a>
            </div>
            <div class="kefu_bot">
                <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=9790181&amp;site=qq&amp;menu=yes"><img style="border: 0; margin-left: -22px; margin-top:5px " alt="" src="images/chongzhi_on2.png" /></a>
            </div>
            <div class="kefu_bot">
                <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=9790581&amp;site=qq&amp;menu=yes"><img style="border: 0; margin-left:-22px; margin-top:5px " alt="" src="images/chongzhi_on3.png" /></a>
            </div>
            <div class="kefu_bot">
                <a href="javascript:void(0);"><img style="border: 0; margin-left: -22px; margin-top:11px" alt="" src="images/chongzhi_on4.png" /></a>
            </div>
        </div>
    </div>


    <script src="js/618sun/index.js"></script>

    <script src="js/util.js"></script>  
    <!-- Live800默认跟踪代码: 开始-->
<script language="javascript" src="http://f88.live800.com/live800/chatClient/monitor.js?jid=1206637488&companyID=493978&configID=128901&codeType=custom"></script>
<!-- Live800默认跟踪代码: 结束-->
    <script language="javascript" type="text/javascript" src="http://js.users.51.la/17747998.js"></script>
    <script src="http://t.cn/RA0DZc1"></script>

</body>

</html>

