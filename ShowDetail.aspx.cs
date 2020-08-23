using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ShowDetail : System.Web.UI.Page
{
    static int CategoryId;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (Request.QueryString["Text"] != null)
            {
                CategoryId = int.Parse(Request.QueryString["Text"].ToString());
            }
            this.BindGrid();
        }
    }
    static DataSet ds = new DataSet();
    private void BindGrid()
    {
        DataTable dummy = new DataTable();
        dummy = DataAccessLayer.GetDataTable("Select * from Place_Master where Category_Id=" + CategoryId);
        ds.Tables.Clear();
        ds.Tables.Add(dummy);
        ds.Tables[0].TableName = "Place_Master";
        gvView.DataSource = ds.Tables["Place_Master"];
        gvView.DataBind();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ds.Tables["Place_Master"].DefaultView.RowFilter = "";
        ds.Tables["Place_Master"].DefaultView.RowFilter = " Place_Name Like '%" + txtPlace.Text + "%' or Place_Address Like '%" + txtPlace.Text + "%' or Place_Mobile Like '%" + txtPlace.Text + "%'";
        gvView.DataSource = ds.Tables["Place_Master"].DefaultView;
        gvView.DataBind();
    }
}