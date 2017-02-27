using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for DetectRefresh
/// </summary>
public  class DetectRefresh :  Page
{
    //    private bool mRefreshState;

    //    private bool mIsRefresh;
    //    public bool IsRefresh
    //    {
    //        get { return mIsRefresh; }
    //    }

    //    protected override void LoadViewState(object savedState)
    //    {
    //        object[] allStates = (object[])savedState;
    //        base.LoadViewState(allStates[0]);
    //        mRefreshState = Convert.ToBoolean(allStates[1]);
    //if (mRefreshState == Convert.ToBoolean(Session["__ISREFRESH"]))
    //        mIsRefresh = mRefreshState;
    //    }

    //    protected override object SaveViewState()
    //    {
    //        Session["__ISREFRESH"] = mRefreshState;
    //        object[] allStates = new object[3];
    //        allStates[0] = base.SaveViewState();
    //        allStates[1] = !mRefreshState;
    //        return allStates;
    //    }
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        this.Session["LastViewedPage"] = Request.RawUrl;
    }

}

