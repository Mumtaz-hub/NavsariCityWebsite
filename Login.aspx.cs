using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string uname = username.Value.ToString();
        string upwd = password.Value.ToString();

        string constr = ConfigurationManager.ConnectionStrings["NCConnectionString"].ConnectionString;

        SqlConnection cn = new SqlConnection(constr);
        cn.Open();
        SqlCommand cmd = new SqlCommand("select COUNT(*)From User_Master where User_Name='" + uname + "' and User_Password='" + upwd + "' and User_Type='U'");
        cmd.Connection = cn;

        int obj = Convert.ToInt32(cmd.ExecuteScalar());

        if (obj > 0)
        {
            Session["UserName"] = uname;
            Response.Redirect("Default.aspx");
        }
        else
        {
            lblMessage.Text = "Invalid UserName or Password";
            this.lblMessage.ForeColor = Color.Red;
        }
        cn.Close();

    }
}