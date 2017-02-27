using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Modals_modalDefaultLogin : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
    }


    protected void LoginButton_OnClick(object sender, CommandEventArgs e)
    {
        Session["UserName"] = Login2.UserName.ToString();
    
    }
}