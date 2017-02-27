<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="recipeBook.aspx.cs" Inherits="recipeBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section id="services" class="padding100">
        <div class="container opacity">
            <div class="row">
                <h2 class="background double animated wow fadeInUp" data-wow-delay="0.2s"><span><strong>R</strong>ecipe <strong>B</strong>ook</span></h2>
            </div>
            <!-- ./ end row -->

            <div class="row">
                <div class="col-md-4">
                    <asp:LinkButton runat="server" ID="btnBreakfast" CssClass="animated wow fadeInDown" href="Modals/modalCategoryRecipeBook.aspx" data-target="#categoryModal" data-toggle="modal" data-category="Breakfast">  
                        <asp:Image CssClass="buttonCategory animated wow fadeInDown" runat="server" src="../img/breakfast.png"  /> 
                    </asp:LinkButton>
                    <div class="sc-inner">
                        <h4>
                            <asp:Label ID="lblBreakfast" runat="server" Text="Breakfast"></asp:Label>
                        </h4>
                        <p>
                            Breakfast is the most important meal of the day. So get cracking and try one of the nutritious, high-quality protein breakfast recipes.
                        </p>

                    </div>
                </div>
                <!-- ./ end service box -->
                <div class="col-md-4">
                    <asp:LinkButton runat="server" ID="btnLunch" CssClass="animated wow fadeInDown" href="Modals/modalCategoryRecipeBook.aspx" data-target="#categoryModal" data-toggle="modal" data-category="Lunch">  
                        <asp:Image CssClass="buttonCategory animated wow fadeInDown" data-wow-delay="0.2s" runat="server" src="../img/lunch.png"/> 
                    </asp:LinkButton>
                    <div class="sc-inner">
                        <h4>Lunch</h4>
                        <p>
                            Whether it's a simple desk lunch or a more leisurely weekend affair,here are easy recipes and ideas to make lunch special.
                        </p>
                    </div>
                </div>
                <!-- ./ end service box -->
                <div class="col-md-4">
                    <asp:LinkButton runat="server" ID="btnDinner" CssClass="animated wow fadeInDown" href="Modals/modalCategoryRecipeBook.aspx" data-target="#categoryModal" data-toggle="modal" data-category="Dinner">  
                        <asp:Image CssClass="buttonCategory animated wow fadeInDown" data-wow-delay="0.4s" runat="server" src="../img/dinner.png"/> 
                    </asp:LinkButton>
                    <div class="sc-inner">
                        <h4>Dinner</h4>
                        <p>
                            Sit down with the family for a delicious dinner everyone will enjoy. Here'll you find delicious comforting recipes perfect for a night in. 
                        </p>
                    </div>
                </div>
                <!-- ./ end service box -->
            </div>
            <!-- ./ end row -->
            <div class="row">
                <div class="col-md-4">
                    <asp:LinkButton runat="server" ID="btnSnacks" CssClass="animated wow fadeInDown" href="Modals/modalCategoryRecipeBook.aspx" data-target="#categoryModal" data-toggle="modal" data-category="Snacks">  
                        <asp:Image CssClass="buttonCategory animated wow fadeInDown" data-wow-delay="0.6s" runat="server" src="../img/snack.png"/> 
                    </asp:LinkButton>
                    <div class="sc-inner">
                        <h4>Snacks</h4>
                        <p>
                            Every dish deserves as much love as your main course, so take a look at our lovely suggestions and make every mouthful magical.
                        </p>
                    </div>
                </div>
                <!-- ./ end service box -->
                <div class="col-md-4">
                    <asp:LinkButton runat="server" ID="btnDesserts" CssClass="animated wow fadeInDown" href="Modals/modalCategoryRecipeBook.aspx" data-target="#categoryModal" data-toggle="modal" data-category="Desserts">  
                        <asp:Image CssClass="buttonCategory animated wow fadeInDown" data-wow-delay="0.6s" runat="server" src="../img/dessert.png"/> 
                    </asp:LinkButton>
                    <div class="sc-inner">
                        <h4>Desserts</h4>
                        <p>
                            Whether you crave sweet, savory, decadent or healthy,here are some dessert recipes to satisfy your taste buds.
                        </p>
                    </div>
                </div>
                <!-- ./ end service box -->
                <div class="col-md-4">
                    <asp:LinkButton runat="server" ID="btnMiscellaneous" CssClass="animated wow fadeInDown" href="Modals/modalCategoryRecipeBook.aspx" data-target="#categoryModal" data-toggle="modal" data-category="Miscellaneous">  
                        <asp:Image CssClass="buttonCategory animated wow fadeInDown" data-wow-delay="0.8s" runat="server" src="../img/miscellaneous.png"/> 
                    </asp:LinkButton>
                    <div class="sc-inner">
                        <h4>Miscellaneous</h4>

                    </div>
                </div>
                <!-- ./ end service box -->

            </div>

        <%-- Empty modal that will be filed in with data--%>
        <div class="modal fade" id="categoryModal" tabindex="-1" role="dialog" aria-labelledby="categoryModalLabel" aria-hidden="true">
            <div class="modal-dialog">

                <div class="modal-content">
                    Here goes the content.
                </div>
            </div>
        </div>
        <!-- ./ end row -->
        </div>

    </section>


</asp:Content>

