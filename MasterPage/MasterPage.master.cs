using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"]!=null)
        {
            lblUsername.Text = Session["UserName"].ToString();
        }
       

    }
    

    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Abandon();

        FormsAuthentication.SignOut();
        //clear cache also
        foreach (System.Collections.DictionaryEntry entry in HttpContext.Current.Cache)
        {
            HttpContext.Current.Cache.Remove((string)entry.Key);
        }
        Response.Redirect("../Default.aspx");
    }
}
