<%@ Page Language="C#" AutoEventWireup="true" CodeFile="modalDefaultLogin.aspx.cs" Inherits="Modals_modalDefaultLogin" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
    <%-- Script that on the closing of this modal clears it's content --%>
    <script>
        $(document).on("hidden.bs.modal", ".modal:not(.local-modal)", function (e) {
            $(e.target).removeData("bs.modal").find(".modal-content").empty();
        });

    </script>
    <script type="text/javascript">
        $(function () {
            $(document).on({
                buttons: {
                    OK: function () {
                        $("[id*=LoginButton]").click();
                    },
                    Close: function () {
                        $(this).dialog('close');
                    }
                }
            });
        });
    </script>
</head>


<body>
    <form id="formLogin" runat="server">

        <%-- Modal --%>

        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <asp:Label ID="lblModalTitle" runat="server" CssClass="modal-title">Log in</asp:Label>
            </div>

            <div class="modal-body">

                <asp:Login ID="Login2" runat="server" CssClass="User" DestinationPageUrl="~/Default.aspx">
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
                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" class="btn btn-primary" ValidationGroup="Login" Text="Log in" UseSubmitBehavior="false"  />
                        </div>
                    </LayoutTemplate>
                    
                </asp:Login>

            </div>
            <div class="modal-footer">
            </div>
        </div>

    </form>

</body>
</html>
