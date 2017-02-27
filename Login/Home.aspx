<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <!-- Products Section -->
    <section id="products" class="products-list padding100">
        <div class="container">
            <div class="row">
                <div class="section-title col-sm-8 col-sm-offset-2 col-md-8 col-md-offset-2 col-lg-8 col-lg-offset-2">
                    <h2 class="animated wow fadeInLeft" data-wow-delay="0.4s">
                        Our Innovative Latest <span class="common">' Products ' </span>All are free to download.
                        Get more ...</h2>                   
                </div>
            </div>
            <!-- ./end row -->
            <div class="row">
                <div class="col-sm-12 animated wow fadeInUp" data-wow-delay="0.6s">
                    <div id="screens" class="owl-carousel">
                        <div>
                            <img src="img/Weekdays/monday.png" class="img-responsive" alt="screens">
                        </div>
                        <div>
                            <img src="img/Weekdays/tuesday.png" class="img-responsive" alt="screens">
                        </div>
                        <div>
                            <img src="img/Weekdays/wednesday.png" class="img-responsive" alt="screens">
                        </div>
                        <div>
                            <img src="img/Weekdays/thursday.png" class="img-responsive" alt="screens">
                        </div>
                        <div>
                            <img src="img/Weekdays/friday.png" class="img-responsive" alt="screens">
                        </div>
                        <div>
                            <img src="img/products/3.jpg" class="img-responsive" alt="screens">
                        </div>
                        <div>
                            <img src="img/products/1.jpg" class="img-responsive" alt="screens">
                        </div>
                    </div>
                    <!-- ./ end slider -->
                </div>
            </div>
            <!-- ./ end row -->
        </div>
    </section>
</asp:Content>

