﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;   
using System.Web.Security;  
using System.Web.SessionState;  
using System.Timers;  
using System.Net;  
using System.IO;  
using System.Text;  
using System.Threading;
using Model;
using DAL;
using System.Data;
using MySql.Data.MySqlClient;



namespace Admin
{
    public class Global : System.Web.HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {

        }

        void Application_End(object sender, EventArgs e)
        {

        }

  void Application_Error(object sender, EventArgs e)
        {
            // 在出现未处理的错误时运行的代码

        }

  void Session_Start(object sender, EventArgs e)
        {
            //// 在新会话启动时运行的代码
            ////设置session超时时间
            //Session.Timeout = 60 * 24;

        }

  void Session_End(object sender, EventArgs e)
        {
            // 在会话结束时运行的代码。 
            // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
            // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer 
            // 或 SQLServer，则不会引发该事件。

        }

    }
}
