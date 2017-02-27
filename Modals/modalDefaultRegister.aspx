<%@ Page Language="C#" AutoEventWireup="true" CodeFile="modalDefaultRegister.aspx.cs" Inherits="Modals_modalDefaultRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <%-- Script that on the closing of this modal clears it's content --%>
    <script>
        $(document).on("hidden.bs.modal", ".modal:not(.local-modal)", function (e) {
            $(e.target).removeData("bs.modal").find(".modal-content").empty();

        });
       

    </script>

    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />

    <link href="../css/1-col-portfolio.css" rel="stylesheet" type="text/css" />

</head>
<body>

    <form runat="server" id="signupForm">

        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <asp:Label ID="lblModalTitle" runat="server" CssClass="modal-title">Register</asp:Label>
            </div>

            <div class="modal-body">
          <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser" CssClass="User" ContinueDestinationPageUrl="~/Login/preferences.aspx">
                    <WizardSteps>
                        <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                            <ContentTemplate>                              
                                    <div id="signupbox" class="form-horizontal" role="form">
                                        <div class="input-group">
                                            <span class="input-group-addon">User</span>
                                            <asp:TextBox runat="server" ID="UserName" CssClass="form-control " placeholder="UserName" name="username">
                                            </asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" Display="Dynamic" ValidationGroup="Register" ErrorMessage="User Name is required." CssClass="error">User name is required</asp:RequiredFieldValidator>

                                        <div class="input-group">
                                            <span class="input-group-addon">Email</span>
                                            <asp:TextBox runat="server" ID="Email" CssClass="form-control " placeholder="Email" name="email">
                                            </asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="Email" Display="Dynamic" ValidationGroup="Register" ErrorMessage="Please enter a valid email address" SetFocusOnError="True" CssClass="error">Please enter a valid email address</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="Email" Display="Dynamic" ValidationGroup="Register"  ErrorMessage="Enter a valid email address" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="error">Enter a valid email address</asp:RegularExpressionValidator>
                                        <div class="input-group">
                                            <span class="input-group-addon">First Name</span>
                                            <asp:TextBox runat="server" ID="txtFirstName" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-addon">Last Name</span>
                                            <asp:TextBox runat="server" ID="txtLastName" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-addon">Password</span>
                                            <asp:TextBox runat="server" ID="Password" CssClass="form-control " placeholder="Password"
                                                TextMode="Password" name="password"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="Password" Display="Dynamic" ValidationGroup="Register" ErrorMessage="Please enter a password" CssClass="error">Please enter a password</asp:RequiredFieldValidator>


                                        <div style="margin-bottom: 25px" class="input-group">
                                            <span class="input-group-addon">Repeat Password</span>
                                            <asp:TextBox runat="server" ID="ConfirmPassword" CssClass="form-control" placeholder="Repeat Password"
                                                TextMode="Password"></asp:TextBox>
                                        </div>
                                        <asp:CompareValidator ID="cvRepeatPassword" runat="server" ControlToCompare="Password" ValidationGroup="Register" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="Passwords do not match" CssClass="error">Passwords do not match</asp:CompareValidator>
                                        <br />
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error" ShowMessageBox="True" />
                                                                            </div>
                            </ContentTemplate>
                            <CustomNavigationTemplate>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <asp:Button ID="StepNextButton" runat="server" class="btn btn-primary" Text="Register" CommandName="MoveNext"  ValidationGroup="Register"/>
                            </CustomNavigationTemplate>
                        </asp:CreateUserWizardStep>
                        <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server" AllowReturn="False">

                        </asp:CompleteWizardStep>
                    </WizardSteps>
                </asp:CreateUserWizard>
            </div>
          
        </div>

    </form>

</body>
</html>
