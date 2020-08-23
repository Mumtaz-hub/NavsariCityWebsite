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

public partial class Admin_Places : System.Web.UI.Page
{
    static int IntPcode;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserName"] == null)
                Response.Redirect("../Login.aspx");

            this.BindDummyRowForCategory();
            this.BindDummyRowForPlaces();
        }
    }

    private void BindDummyRowForCategory()
    {
        DataTable dummy = new DataTable();
        dummy.Columns.Add("Category_Id");
        dummy.Columns.Add("Category_Name");
        dummy.Rows.Add();
        gvPlaceCategory.DataSource = dummy;
        gvPlaceCategory.DataBind();
    }

    private void BindDummyRowForPlaces()
    {
        DataTable dummy = new DataTable();
        dummy.Columns.Add("Place_Code");
        dummy.Columns.Add("Place_Name");
        dummy.Columns.Add("Place_Address");
        dummy.Columns.Add("Place_Mobile");
        dummy.Rows.Add();
        gvPlaces.DataSource = dummy;
        gvPlaces.DataBind();
    }

    [WebMethod]
    public static string GetCategory()
    {
        string query = "SELECT Category_Id, Category_Name FROM Category_Master";
        DataSet ds = new DataSet();
        ds = DataAccessLayer.GetDataSet(query);
        return ds.GetXml();
    }

    [WebMethod]
    public static string GetPlaceByCategoryId(string CCode)
    {
        IntPcode = int.Parse(CCode);
        string query = "SELECT Place_Code,Place_Name,Place_Address,Place_Mobile FROM Place_Master where Category_Id=" + Convert.ToInt32(CCode);
        DataSet ds = new DataSet();
        ds = DataAccessLayer.GetDataSet(query);
        return ds.GetXml();
    }

    [WebMethod]
    public static int InsertPlaces(string Place_Name, string Place_Address, string Place_Mobile)
    {
        string Query = "INSERT INTO Place_Master VALUES(@Place_Name,@Place_Address,@Place_Mobile,@Category_Id) SELECT SCOPE_IDENTITY()";
        SqlParameter[] parameters = new SqlParameter[4];
        parameters[0] = DataAccessLayer.AddParamater("@Place_Name", Place_Name, System.Data.SqlDbType.VarChar, 50);
        parameters[1] = DataAccessLayer.AddParamater("@Place_Address", Place_Address, System.Data.SqlDbType.VarChar, 50);
        parameters[2] = DataAccessLayer.AddParamater("@Place_Mobile", Place_Mobile, System.Data.SqlDbType.VarChar, 50);
        parameters[3] = DataAccessLayer.AddParamater("@Category_Id", IntPcode, System.Data.SqlDbType.Int, 100);
        int NewId = DataAccessLayer.ExecuteNonQuery(Query, parameters);
        return NewId;
    }

    [WebMethod]
    public static void UpdatePlaces(int Place_Code, string Place_Name, string Place_Address, string Place_Mobile)
    {
        string Query = "UPDATE Place_Master SET Place_Name = @Place_Name,Place_Address = @Place_Address,Place_Mobile = @Place_Mobile WHERE Place_Code = @Place_Code";

        SqlParameter[] parameters = new SqlParameter[4];
        parameters[0] = DataAccessLayer.AddParamater("@Place_Code", Place_Code, System.Data.SqlDbType.Int, 100);
        parameters[1] = DataAccessLayer.AddParamater("@Place_Name", Place_Name, System.Data.SqlDbType.VarChar, 50);
        parameters[2] = DataAccessLayer.AddParamater("@Place_Address", Place_Address, System.Data.SqlDbType.VarChar, 50);
        parameters[3] = DataAccessLayer.AddParamater("@Place_Mobile", Place_Mobile, System.Data.SqlDbType.VarChar, 50);
        DataAccessLayer.ExecuteNonQuery(Query, parameters);
    }

    [WebMethod]
    public static void DeletePlaces(int Place_Code)
    {
        string Query = "DELETE FROM Place_Master WHERE Place_Code = @Place_Code";
        SqlParameter[] parameters = new SqlParameter[1];
        parameters[0] = DataAccessLayer.AddParamater("@Place_Code", Place_Code, System.Data.SqlDbType.Int, 100);
        DataAccessLayer.ExecuteNonQuery(Query, parameters);
    }
}