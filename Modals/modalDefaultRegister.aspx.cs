using MealPlanner.BLL;
using System;
using System.Web.Security;

public partial class Modals_modalDefaultRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        User newUser = new User();
        //newUser.EmailAddress = txtEmail.Text;
        //newUser.FirstName = txtFirstName.Text;
        //newUser.LastName = txtLastName.Text;
        //newUser.Password = txtPassword.Text;
       
    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        Roles.AddUserToRole(CreateUserWizard1.UserName, "Members");
        Session["UserName"] = CreateUserWizard1.UserName.ToString();
    }
}
   