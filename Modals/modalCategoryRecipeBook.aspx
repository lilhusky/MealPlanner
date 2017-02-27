<%@ Page Language="C#" AutoEventWireup="true" CodeFile="modalCategoryRecipeBook.aspx.cs" Inherits="Modals_modalCategoryRecipeBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  
</head>


<body>
    <form id="formCategoryRecipe" runat="server">
      
        <%-- Modal --%>
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <asp:Label ID="lblModalTitle" runat="server" CssClass="modal-title"></asp:Label>
        </div>

        <div class="modal-body">
            test
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Back</button>

        </div>

    </form>
     <script>
            $('#categoryModal').on('show.bs.modal', function renews(event) {
                var button = $(event.relatedTarget) // Button that triggered the modal
                var recipient = button.data('category') // Extract info from data-* attributes
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                var modal = $(this)
                modal.find('.modal-header #lblModalTitle ').text(recipient)
            });
            modal.onload = renews;
     </script>
      <%-- Script that on the closing of this modal clears it's content --%>
    <script>
        $(document).on("hidden.bs.modal", ".modal:not(.local-modal)", function (e) {
            $(e.target).removeData("bs.modal").find(".modal-content").empty();
        });
    </script>
</body>
</html>
