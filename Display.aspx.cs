using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;

public partial class Display : System.Web.UI.Page
{
    static int CategoryId;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserName"] == null)
                Response.Redirect("Login.aspx");

            if (Request.QueryString["Text"] != null)
            {
                CategoryId = int.Parse(Request.QueryString["Text"].ToString());
            }
            this.BindDummyRow();
        }
    }

    private void BindDummyRow()
    {
        DataTable dummy = new DataTable();
        dummy.Columns.Add("Place_Code");
        dummy.Columns.Add("Place_Name");
        dummy.Columns.Add("Place_Address");
        dummy.Columns.Add("Place_Mobile");
        dummy.Rows.Add();
       gvView.DataSource = dummy;
        gvView.DataBind();
    }

    [WebMethod]
    public static string GetView()
    {
        string query = @"select * from Place_Master where Category_Id=" + CategoryId;

        DataSet ds = new DataSet();
        ds = DataAccessLayer.GetDataSet(query);
        return ds.GetXml();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }
}