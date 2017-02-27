<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="addRecipe.aspx.cs" Inherits="RecipeBook_addRecipe" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function autoCompleteEx_ItemSelected(sender, args) {
            __doPostBack(sender.get_element().id, "");
        }

        function uploadComplete(sender) {
            $get("<%=lblMesg.ClientID%>").innerHTML = "File Uploaded Successfully";
        }

        function uploadError(sender) {
            $get("<%=lblMesg.ClientID%>").innerHTML = "File upload failed.";
        }
    </script>
</asp:Content>
<asp:Content ID="AddRecipe" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <section id="addRecipe" class="padding100 ">
        <div class="container opacity  ">
            <div class="row">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <%-- Add photo --%>
                        <div class="col-md-4">
                            <div class="row">
                                <div class="col-md-12 vcenter">

                                    <ajaxToolkit:AsyncFileUpload OnClientUploadError="uploadError"
                                        OnClientUploadComplete="uploadComplete" runat="server"
                                        ID="fileUploader"
                                        OnUploadedComplete="FileUploadComplete" CompleteBackColor="#D2FFD2" CssClass="" />

                                    <asp:Label ID="lblMesg" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                            <div class="row">

                                <div class="col-md-12">
                                    <asp:ListView ID="lstAddPhoto" runat="server" ItemPlaceholderID="itemPlaceHolder" OnItemCommand="lstAddPhoto_ItemCommand" OnItemDeleting="lstAddPhoto_Deleting"
                                        OnSelectedIndexChanging="lstAddPhoto_SelectedIndexChanging">
                                        <LayoutTemplate>
                                            <ul class="list-group-item">
                                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                                            </ul>
                                        </LayoutTemplate>

                                        <ItemTemplate>
                                            <li>
                                                <asp:Button ID="btnClose" runat="server" CssClass="btn btn-link" UseSubmitBehavior="true" CommandName="Delete" Text="&times;" CommandArgument='<%# Container.DataItemIndex %>'></asp:Button>
                                                <img id="addImageList" src='<%# Eval("photo") %>' />
                                            </li>
                                        </ItemTemplate>
                                        <EmptyDataTemplate>
                                            <div class=" fa-camera-retro h2">Add Photo</div>
                                        </EmptyDataTemplate>
                                    </asp:ListView>

                                </div>
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="5" PagedControlID="lstAddPhoto">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>


                            </div>

                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <%-- Title and preparation --%>
                <div class="col-md-8">


                    <h4>Title</h4>
                    <asp:TextBox runat="server" ID="txtTitle" CssClass="form-control " placeholder="Title" name="title">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter the name of the recipe" ControlToValidate="txtTitle" CssClass="error" Display="Static" ValidationGroup="grSave" SetFocusOnError="True" Visible="True"></asp:RequiredFieldValidator>
                    <h4>Preparation</h4>
                    <asp:TextBox ID="txtDirections" runat="server" CssClass="form-control " placeholder="Prepartion" name="preparation"
                        TabIndex="1" TextMode="MultiLine" Rows="11"></asp:TextBox>

                </div>
            </div>

            <div class="row">

                <%-- Ingredients column --%>
                <div class="col-md-4">
                    <h3>Add Ingredients</h3>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-12">
                                    <h4>Ingredient</h4>
                                    <asp:TextBox ID="txtIngredientsSearch" runat="server" CssClass="form-control" OnTextChanged="txtIngredientsSearch_TextChanged" placeholder="Ingredient" AutoPostBack="True">
                                    </asp:TextBox><asp:Label ID="lblIngredientValidation" CssClass="error" runat="server" Text=""></asp:Label>

                                    <ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchIngredient" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                        TargetControlID="txtIngredientsSearch" ID="AutoCompleteExtender1" OnClientItemSelected="autoCompleteEx_ItemSelected" runat="server" FirstRowSelected="false" ViewStateMode="Enabled">
                                    </ajaxToolkit:AutoCompleteExtender>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Quantity</h4>
                                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control " placeholder="Quantity"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <h4>Measurement unit</h4>
                                    <asp:TextBox ID="txtUM" runat="server" CssClass="form-control " placeholder="UM"></asp:TextBox><br />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter valid a numeric value (ex: 3.25)" Display="Dynamic" CssClass="error" ValidationExpression="((\d+)((\.\d{1,2})?))$" ControlToValidate="txtQuantity" SetFocusOnError="True"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Button ID="btnAddIngredient" runat="server" Text="Add Ingredient" CssClass="btn btn-default text-center" OnClick="btnAddIngredient_Click" />
                                </div>
                            </div>
                            <div class="row rptBackground">
                                <div class="col-md-12 ">
                                    <asp:ListView ID="lstListIngredients" runat="server" OnItemCommand="lstListIngredients_ItemCommand"
                                        OnSelectedIndexChanging="lstListIngredients_SelectedIndexChanging" OnItemDeleting="lstListIngredients_Deleting">
                                        <ItemTemplate>
                                            <div class="">
                                                <asp:Label CssClass="h4" runat="server" Text='<%# Eval("quantity").ToString() %>'></asp:Label>
                                                <asp:Label CssClass="h4" runat="server" Text='<%# Eval("um").ToString() %>'></asp:Label>
                                                <asp:Label CssClass="h4" runat="server" Text='<%# Eval("name").ToString() %>'></asp:Label>
                                                <asp:Button ID="btnClose" runat="server" CssClass="btn btn-link" CommandName="Delete" Text="&times;" CommandArgument='<%# Container.DataItemIndex %>'></asp:Button>
                                            </div>
                                        </ItemTemplate>

                                    </asp:ListView>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- Column for the rest of the info --%>
                <div class="col-md-8">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <%-- Row with the textboxes for  preparation time and add tag --%>
                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Preparation Time</h4>
                                    <div class="col-md-4">
                                        <h6>Hours</h6>
                                        <asp:TextBox ID="txtPreparationHours" runat="server" CssClass="form-control " placeholder="00" ValidationGroup="Numeric"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <h6>Minutes</h6>
                                        <asp:TextBox ID="txtPreparationMinutes" runat="server" CssClass="form-control " placeholder="00" OnTextChanged="ValidateTime_TextChanged" ValidationGroup="Numeric" AutoPostBack="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6 vcenter">
                                    <div class="col-md-8">
                                        <h4>Tag</h4>
                                        <asp:TextBox ID="txtTag" runat="server" CssClass="form-control" OnTextChanged="txtTag_TextChanged" placeholder="Tag" AutoPostBack="True"></asp:TextBox>
                                        <ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchTag" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                            TargetControlID="txtTag" ID="AutoCompleteExtender2" OnClientItemSelected="autoCompleteEx_ItemSelected" runat="server" FirstRowSelected="false">
                                        </ajaxToolkit:AutoCompleteExtender>
                                    </div>
                                    <div class="col-md-4 ">
                                        <h4></h4>
                                        <asp:Button ID="btnAddTag" runat="server" Text="Add Tag" CssClass="btn btn-default" OnClick="btnAddTag_Click" />
                                    </div>

                                </div>

                            </div>
                            <%-- Row with the validators--%>
                            <div class="row">

                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Please enter valid a numeric value " Display="Dynamic" CssClass="error"
                                    ValidationExpression="[1-9]\d*|0" ControlToValidate="txtPreparationHours" SetFocusOnError="True" ValidationGroup="Numeric" ValidateRequestMode="Inherit"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter valid a numeric value " Display="Dynamic" CssClass="error"
                                    ValidationExpression="[1-9]\d*|0" ControlToValidate="txtPreparationMinutes" SetFocusOnError="True" ValidationGroup="Numeric"></asp:RegularExpressionValidator>
                            </div>
                            <%-- Row with the Cooking time and repeter for displaying the selected tags--%>
                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Cooking Time</h4>
                                    <div class="col-md-4">
                                        <h6>Hours</h6>
                                        <asp:TextBox ID="txtCookingHours" runat="server" CssClass="form-control   " placeholder="00" ValidationGroup="Numeric"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <h6>Minutes</h6>
                                        <asp:TextBox ID="txtCookingMinutes" runat="server" CssClass="form-control " placeholder="00" OnTextChanged="ValidateTime_TextChanged" ValidationGroup="Numeric" AutoPostBack="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="rptBackground">
                                    <div class="col-md-6 rptBackground ">
                                        <asp:ListView ID="rptTags" runat="server" ViewStateMode="Enabled" OnItemCommand="rptTags_ItemCommand"
                                            OnSelectedIndexChanging="rptTags_SelectedIndexChanging" OnItemDeleting="rptTags_Deleting">
                                            <ItemTemplate>
                                                <div class="marginrow">
                                                    <asp:Label CssClass="h5 repeater-inline" runat="server" Text='<%# Eval("nameTag").ToString()%>'></asp:Label>
                                                    <asp:Button ID="btnClose" runat="server" CssClass="btn btn-link" CommandName="Delete" Text="&times;" CommandArgument='<%# Container.DataItemIndex %>'></asp:Button>

                                                </div>
                                            </ItemTemplate>

                                        </asp:ListView>

                                    </div>
                                </div>
                            </div>
                            <%-- Row with the validators--%>
                            <div class="row">

                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter valid a numeric value " Display="Dynamic" CssClass="error"
                                    ValidationExpression="[1-9]\d*|0" ControlToValidate="txtCookingHours" SetFocusOnError="True" ValidationGroup="Numeric"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please enter valid a numeric value " Display="Dynamic" CssClass="error"
                                    ValidationExpression="[1-9]\d*|0" ControlToValidate="txtCookingMinutes" SetFocusOnError="True" ValidationGroup="Numeric"></asp:RegularExpressionValidator>
                            </div>


                            <%-- Row with the Calories--%>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="col-md-8">
                                        <h4>Calories</h4>
                                        <asp:TextBox ID="txtCalories" runat="server" CssClass="form-control" placeholder="Calories" ValidationGroup="Numeric"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="col-md-6 vcenter">
                                        <h4>Category</h4>
                                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="dropdown1">
                                            <asp:ListItem>Breakfast</asp:ListItem>
                                            <asp:ListItem>Lunch</asp:ListItem>
                                            <asp:ListItem>Dinner</asp:ListItem>
                                            <asp:ListItem>Snack</asp:ListItem>
                                            <asp:ListItem>Dessert</asp:ListItem>
                                            <asp:ListItem>Miscellaneous</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <%-- Row with the NrPersons and the radio buttons--%>
                            <div class="row ">
                                <div class="col-md-4">
                                    <h4>Nr Persons</h4>
                                    <asp:TextBox ID="txtNrPersons" runat="server" CssClass="form-control" placeholder="Number of persons" ValidationGroup="Numeric"></asp:TextBox><br />
                                </div>
                                <div class="col-md-8 text-right">
                                    <h5>Select if you want your recipe to be shared with the rest of the users</h5>
                                    <asp:Panel ID="PrivacyRecipe" runat="server">
                                        <asp:RadioButton ID="rdbPrivate" runat="server" CssClass="radio-inline" Text="Private" GroupName="PrivacyRecipe" Checked="True" />
                                        <asp:RadioButton ID="rdbPublic" runat="server" CssClass="radio-inline" Text="Public" GroupName="PrivacyRecipe" />
                                    </asp:Panel>
                                </div>
                            </div>
                            <%-- Row with the validators--%>
                            <div class="row">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Please enter valid a numeric value " Display="Dynamic" CssClass="error"
                                    ValidationExpression="[1-9]\d*|0" ControlToValidate="txtCalories" SetFocusOnError="True" ValidationGroup="Numeric"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Please enter valid a numeric value " Display="Dynamic" CssClass="error"
                                    ValidationExpression="[1-9]\d*|0" ControlToValidate="txtNrPersons" SetFocusOnError="True" ValidationGroup="Numeric"></asp:RegularExpressionValidator>

                            </div>
                            <%-- Row with the save and cancel buttons--%>
                            <div class="row text-right">
                                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-default btn-lg" Text="Save" OnClick="btnSave_Click" ValidationGroup="grSave" />
                                <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-default btn-lg" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="False" />
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

