<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucShowPlannedMeal.ascx.cs" Inherits="Controls_ucShowPlannedMeal" %>
<%@ Register Src="~/Controls/btnMealPhotoName.ascx" TagPrefix="uc1" TagName="btnMealPhotoName" %>



<asp:Panel ID="Panel1" runat="server">
    <div>
        <asp:Label ID="lblMealType" runat="server" Text="MealType" ></asp:Label>
        <uc1:btnMealPhotoName runat="server" ID="btnMealPhotoName"/>
    </div>
    
</asp:Panel>

