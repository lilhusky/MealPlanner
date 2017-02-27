using System.IO;
using AjaxControlToolkit;
using System.Web.Services;
using System.Web.Script.Services;
using System.Collections.Generic;
using System;
using System.Web;
using System.Web.Security;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    [ScriptMethod]
    public static Slide[] GetImages()
    {
        List<Slide> slides = new List<Slide>();
        string path = HttpContext.Current.Server.MapPath("~/img/");
        if (path.EndsWith("\\"))
        {
            path = path.Remove(path.Length - 1);
        }
        Uri pathUri = new Uri(path, UriKind.Absolute);
        string[] files = Directory.GetFiles(path);
        foreach (string file in files)
        {
            Uri filePathUri = new Uri(file, UriKind.Absolute);
            slides.Add(new Slide
            {
                Name = Path.GetFileNameWithoutExtension(file),
                Description = Path.GetFileNameWithoutExtension(file) + " Description.",
                ImagePath = pathUri.MakeRelativeUri(filePathUri).ToString()
            });
        }
        return slides.ToArray();
    }






    protected void LoginButton_Click(object sender, EventArgs e)
    {
        Session["UserName"] = Login2.UserName.ToString();
    }
}