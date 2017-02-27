using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MealPlanner.BLL;
using System.Data;
using System.Drawing;
using AjaxControlToolkit;

public partial class RecipeBook_addRecipe : System.Web.UI.Page
{
    private static DataSet _tempDB = new DataSet();
    private static List<Tag> _TagList;
    private static List<Ingredient> _ingredients;
    private static List<Tag> _tag;
    private int _idIngredient;
    private int _idTag;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            _tempDB = TempDB_Recipe();
            this.ViewState.Add("TempDB", _tempDB);LoadImages();
        }
        _tempDB = (DataSet)this.ViewState["TempDB"];
        lstAddPhoto.DataSource = _tempDB.Tables["RecipeImg"];
        lstAddPhoto.DataBind();


    }
    #region Ingredient
    //Method used by the Autocomplete Extender 
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchIngredient(string prefixText, int count)
    {
        _ingredients = IngredientBLL.SearchIngredients(prefixText, count);
        List<string> searchResults = new List<string>();
        foreach (Ingredient item in _ingredients)
        {
            searchResults.Add(item.Name);
        }
        return searchResults;
    }
    protected void btnAddIngredient_Click(object sender, EventArgs e)
    {
        if (txtIngredientsSearch.Text == string.Empty)
        {
            lblIngredientValidation.Text = "This is a requierd field!!";
            txtIngredientsSearch.Focus();
        }
        else
        {
            decimal? quantity = null;
            decimal val;
            string name = txtIngredientsSearch.Text;
            string um = txtUM.Text;
            decimal.TryParse(txtQuantity.Text, out val);
            if (val != 0)
            {
                quantity = val;
            }
            else quantity = 1;

            Ingredient _ingredient = new Ingredient();
            _idIngredient = (int)this.ViewState["idIngredient"];
            if (_idIngredient == -1)
            {
                _ingredient.Name = name;
                _ingredient = IngredientBLL.Insert(_ingredient);

            }
            _tempDB = (DataSet)this.ViewState["TempDB"];
            int i = 0;
            foreach (DataRow dr in _tempDB.Tables["RecipeIngredient"].Rows)
            {
                if (name == dr["name"].ToString())
                {
                    i++;
                }
            }
            if (i == 0)
            {
                _tempDB.Tables["RecipeIngredient"].Rows.Add(quantity, um, name, _idIngredient);
                lstListIngredients.DataSource = _tempDB.Tables["RecipeIngredient"];

                lstListIngredients.DataBind();
                this.ViewState.Add("TempDB", _tempDB);
            }
            EmptyFields(new List<Control> { txtIngredientsSearch, txtQuantity, txtUM });
        }

    }
    protected void txtIngredientsSearch_TextChanged(object sender, EventArgs e)
    {
        // check if the item in the textbox already exists in the database. If true than it saves the id in the view state.
        this.ViewState.Add("idIngredient", -1);
        TextBox txt = (TextBox)sender;
        foreach (Ingredient item in _ingredients)
        {
            if (txt.Text == item.Name)
            {
                _idIngredient = item.ID;
                this.ViewState.Add("idIngredient", _idIngredient);
            }

        }
    }
    protected void lstListIngredients_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        _tempDB = (DataSet)this.ViewState["TempDB"];

        if (e.CommandName == "Delete")
        {
            int index = Convert.ToInt32(e.CommandArgument);

            int listcount = lstListIngredients.Items.Count;


            _tempDB.Tables["RecipeIngredient"].Rows[index].Delete();
            lstListIngredients.DataSource = _tempDB.Tables["RecipeIngredient"];
            lstListIngredients.DataBind();


        }
    }
    protected void lstListIngredients_SelectedIndexChanging(object sender, EventArgs e)
    {
        //
    }

    protected void lstListIngredients_Deleting(object sender, EventArgs e)
    {
        //
    }

    #endregion

    #region tag

    //Method used by the Autocomplete Extender 
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchTag(string prefixText, int count)
    {
        _tag = TagBLL.SearchTag(prefixText, count);
        List<string> searchResults = new List<string>();
        foreach (Tag item in _tag)
        {
            searchResults.Add(item.Name);
        }
        return searchResults;
    }
    protected void btnAddTag_Click(object sender, EventArgs e)
    {

        string name = txtTag.Text;

        Tag _tag = new Tag();
        _idTag = (int)this.ViewState["idTag"];
        if (_idTag == -1)
        {
            _tag.Name = name;
            _tag = TagBLL.Insert(_tag);
            _idTag = _tag.ID;

        }
        _tempDB = (DataSet)this.ViewState["TempDB"];

        int i = 0;
        foreach (DataRow dr in _tempDB.Tables["RecipeTags"].Rows)
        {
            if (name == dr["nameTag"].ToString())
            {
                i++;
            }
        }
        if (i == 0)
        {
            _tempDB.Tables["RecipeTags"].Rows.Add(name, _idTag);
            rptTags.DataSource = _tempDB.Tables["RecipeTags"];
            rptTags.DataBind();
            this.ViewState.Add("TempDB", _tempDB);
        }

        EmptyFields(new List<Control> { txtTag });
    }
    protected void txtTag_TextChanged(object sender, EventArgs e)
    {
        // check if the item in the textbox is from the database. If true than it saves the id in the view state.
        this.ViewState.Add("idTag", -1);
        TextBox txt = (TextBox)sender;
        foreach (Tag item in _tag)
        {
            if (txt.Text == item.Name)
            {
                _idTag = item.ID;
                this.ViewState.Add("idTag", _idTag);
            }
        }
    }
    protected void rptTags_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
    {
        //
    }

    protected void rptTags_Deleting(object sender, ListViewDeleteEventArgs e)
    {
        //
    }

    protected void rptTags_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        _tempDB = (DataSet)this.ViewState["TempDB"];

        if (e.CommandName == "Delete")
        {
            int index = Convert.ToInt32(e.CommandArgument);

            int listcount = rptTags.Items.Count;



            _tempDB.Tables["RecipeTags"].Rows[index].Delete();
            rptTags.DataSource = _tempDB.Tables["RecipeTags"];
            rptTags.DataBind();

        }
    }

    #endregion

    #region Empty&Create
    public static DataSet TempDB_Recipe()

    {
        DataTable RecipeIngredient = new DataTable();
        RecipeIngredient.TableName = "RecipeIngredient";
        RecipeIngredient.Columns.Add("quantity", typeof(decimal));
        RecipeIngredient.Columns.Add("um", typeof(string));
        RecipeIngredient.Columns.Add("name", typeof(string));
        RecipeIngredient.Columns.Add("idIngredient", typeof(int));


        DataTable RecipeTags = new DataTable("RecipeTags");
        RecipeTags.Columns.Add("nameTag", typeof(string));
        RecipeTags.Columns.Add("idTag", typeof(int));


        DataTable RecipeImg = new DataTable("RecipeImg");
        RecipeImg.Columns.Add("nameImg", typeof(string));
        RecipeImg.Columns.Add("photo", typeof(string));

        DataSet tempDB = new DataSet();
        tempDB.Tables.Add(RecipeIngredient);
        tempDB.Tables.Add(RecipeTags);
        tempDB.Tables.Add(RecipeImg);
        return tempDB;


    }
    private void EmptyFields(List<Control> controls)
    {
        foreach (Control item in controls)
        {
            if (item is TextBox)
            {
                ((TextBox)item).Text = string.Empty;
            }
        }
    }
    private void EmptyTempFolder()
    {
        System.IO.DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/img/UploaderTemp/"));

        foreach (FileInfo file in di.GetFiles())
        {
            file.Delete();
        }

    }
    #endregion

    #region ClickEvent
    protected void btnSave_Click(object sender, EventArgs e)
    {
        _tempDB = (DataSet)this.ViewState["TempDB"];
        int count = _tempDB.Tables["RecipeIngredient"].Rows.Count;
        Page.Validate("grSave");
        if ((count != 0) && Page.IsValid)
        {

            int var, h, min;
            // adding the recipe values that go directly in the recipe table from the textboxes
            Recipe recipe = new Recipe();

            recipe.Title = txtTitle.Text;

            recipe.Preparation = txtDirections.Text;

            int.TryParse(txtCalories.Text, out var);
            recipe.Calories = var;

            int.TryParse(txtNrPersons.Text, out var);
            recipe.NrPersons = Convert.ToByte(var);

            int.TryParse(txtCookingHours.Text, out h);
            int.TryParse(txtCookingMinutes.Text, out min);
            if ((h != 0) || (min != 0))
            {
                recipe.CookingTime = new TimeSpan(h, min, 0);
            }

            int.TryParse(txtPreparationHours.Text, out h);
            int.TryParse(txtPreparationMinutes.Text, out min);
            if ((h != 0) || (min != 0))
            {
                recipe.PreparationTime = new TimeSpan(h, min, 0);
            }


            recipe.Category = ddlCategory.SelectedValue;

            if (rdbPrivate.Checked) recipe.IsPublic = false;
            else recipe.IsPublic = true;

            recipe.UserID = Session["UserName"].ToString();

            recipe.AddedOn = DateTime.Now;



            //adding the values from the dataset into the junction tables

            _tempDB = (DataSet)this.ViewState["TempDB"];

            RecipeIngredient recipeIngredient;
            DataTable dt = new DataTable();
            dt = _tempDB.Tables["RecipeIngredient"];
            decimal dec;
            List<RecipeIngredient> listIngredients = new List<RecipeIngredient>();
            foreach (DataRow dr in dt.Rows)
            {
                recipeIngredient = new RecipeIngredient();
                decimal.TryParse((dr["quantity"].ToString()), out dec);
                recipeIngredient.Quantity = dec;
                recipeIngredient.UM = dr["um"].ToString();
                int.TryParse(dr["idIngredient"].ToString(), out var);
                recipeIngredient.ingredient = IngredientBLL.GetIngredientByID(var);
                recipeIngredient.recipe = recipe;
                listIngredients.Add(recipeIngredient);
            }

            recipe.ID = RecipeBLL.Insert(recipe);
            dt = _tempDB.Tables["RecipeTags"];
            Tag tag;
            List<Tag> listTag = new List<Tag>();
            foreach (DataRow dr in dt.Rows)
            {
                tag = new Tag();
                tag.ID = Convert.ToInt32(dr["idTag"]);
                listTag.Add(tag);

            }

            //dt = _tempDB.Tables["RecipeImage"];
            //Photo image = new Photo();
            //foreach (DataRow dr in dt.Rows)
            //{
            //    image.ID = Convert.ToInt32(dr["idImage"]);
            //    RecipeImageBLL.Insert(recipe, image);

            //}
            recipe.Tags = listTag;
            recipe.RecipeIngredients = listIngredients;

            RecipeBLL.Update(recipe);

            EmptyTempFolder();
            Response.Redirect(Request.RawUrl);
        }
        else
        {
            lblIngredientValidation.Text = "Please add at least one ingredient!!";
            txtIngredientsSearch.Focus();
        }


    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyTempFolder();
        Response.Redirect(Request.RawUrl);
    }
    #endregion

    /// <summary>
    /// Validates the text boxes for minutes, sees which one it is and if the value is over an hour then it transforms the value in hours and minutes and fill in the boxes accordingly
    /// </summary>
    /// <param name="sender"> is the textbox</param>
    /// <param name="e"></param>
    protected void ValidateTime_TextChanged(object sender, EventArgs e)
    {
        int var;
        TextBox time = (TextBox)sender;
        int minutes = Convert.ToInt32(time.Text);
        if (minutes > 59)
        {
            switch (time.ID)
            {
                case "txtCookingMinutes":
                    int.TryParse(txtCookingHours.Text, out var);
                    txtCookingHours.Text = (var + (minutes / 60)).ToString();
                    txtCookingMinutes.Text = (minutes % 60).ToString();
                    break;
                case "txtPreparationMinutes":
                    int.TryParse(txtPreparationHours.Text, out var);
                    txtPreparationHours.Text = (var + (minutes / 60)).ToString();
                    txtPreparationMinutes.Text = (minutes % 60).ToString();
                    break;
            }
        }
    }

    protected void FileUploadComplete(object sender, AsyncFileUploadEventArgs e)
    {
        string filename = Session["UserName"].ToString() + DateTime.Now.ToString().Replace(':', '-').Replace('/', '-') + Path.GetFileName(e.FileName);
        string strPath = "";
        if (fileUploader.HasFile)
        {
            strPath = MapPath("~/img/UploaderTemp/") + filename;
            fileUploader.SaveAs(strPath);
        }
        _tempDB = (DataSet)this.ViewState["TempDB"];
        _tempDB.Tables["RecipeImg"].Rows.Add(filename, "../img/UploaderTemp/" + filename);
        ViewState["TempDB"] = _tempDB;
    }
    protected void LoadImages()
    {
        System.IO.DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/img/UploaderTemp/"));

        foreach (FileInfo file in di.GetFiles())
        {

            _tempDB = (DataSet)this.ViewState["TempDB"];
            _tempDB.Tables["RecipeImg"].Rows.Add(file.Name, "../img/UploaderTemp/" + file.Name);

            lstAddPhoto.DataSource = _tempDB.Tables["RecipeImg"];
            lstAddPhoto.DataBind();
        }
    }


    protected void lstAddPhoto_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        _tempDB = (DataSet)this.ViewState["TempDB"];
        if (e.CommandName == "Delete")
        {
            int index = Convert.ToInt32(e.CommandArgument);

            int listcount = lstAddPhoto.Items.Count;


            _tempDB.Tables["RecipeImg"].Rows[index].Delete();
            System.IO.DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/img/UploaderTemp/"));
            foreach (FileInfo file in di.GetFiles())
            {
                int i = 0;
                foreach (DataRow dr in _tempDB.Tables["RecipeImg"].Rows)
                {
                    if (file.Name == dr["nameImg"].ToString())
                        i++;
                }
                if (i == 0)
                    file.Delete();
            }
        }
    }

    protected void lstAddPhoto_Deleting(object sender, ListViewDeleteEventArgs e)
    {
        //
    }

    protected void lstAddPhoto_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
    {
        //
    }
}

