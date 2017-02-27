<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/1-col-portfolio.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    </div>
                   <asp:Login ID="Login2" runat="server" CssClass="User" DestinationPageUrl="~/Login/Home.aspx">
                    <LayoutTemplate>
                        <div id="loginform" class="form-horizontal" role="form">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" placeholder="User Name"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" Display="Dynamic" ValidationGroup="Login" ErrorMessage="Please enter an User Name" CssClass="error">Please enter an User Name</asp:RequiredFieldValidator>

                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <asp:TextBox runat="server" ID="Password" CssClass="form-control" placeholder="Password"
                                    TextMode="Password"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="Password" Display="Dynamic" ValidationGroup="Login" ErrorMessage="Please enter a password" CssClass="error">Please enter a password</asp:RequiredFieldValidator>

                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me" />
                                </label>
                            </div>
                            <div class="form-group">
                                <div>
                                    Don't have an account!
                                <%--Pressing the link will take us to the desired modal by using a javascript function --%>
                                    <a href="javascript:$('#myModal .modal-content').load('Modals/modalDefaultRegister.aspx',function(e){$('#myModal').modal('show');});">Register here</a>
                                </div>

                            </div>
                            <button type="button" id="btnClose" class="btn btn-default" data-dismiss="modal">Close</button>
                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" class="btn btn-primary" ValidationGroup="Login" Text="Log in" UseSubmitBehavior="false" OnClick="LoginButton_Click"  />
                        </div>
                    </LayoutTemplate>
                    
                </asp:Login>
    </form>
</body>
</html>
