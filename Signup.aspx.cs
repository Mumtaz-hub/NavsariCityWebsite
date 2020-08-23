using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

public partial class Signup : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["NCConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillCapctha();

        }
    }
    protected void btnSignup_Click(object sender, EventArgs e)
    {
        if (Session["captcha"].ToString() != txtCaptcha.Value.ToString())
            lblErrorMsg.Text = "Invalid Captcha Code";
        else
        {

            string uname = usernamesignup.Value.ToString();
            string upwd = passwordsignup.Value.ToString();
            string uemail = emailsignup.Value.ToString();

            SqlConnection cn = new SqlConnection(constr);
            cn.Open();
            SqlCommand cmd = new SqlCommand("insert into User_Master(User_Name,User_Password,User_Email,User_Type) values(@User_Name,@User_Password,@User_Email,@User_Type)", cn);
            cmd.Parameters.AddWithValue("@User_Name", uname);
            cmd.Parameters.AddWithValue("@User_Password", upwd);
            cmd.Parameters.AddWithValue("@User_Email", uemail);
            cmd.Parameters.AddWithValue("@User_Type", "U");

            cmd.ExecuteNonQuery();
            Session["UserName"] = uname;
            Response.Redirect("Login.aspx");
            cn.Close();
        }
    }

    void FillCapctha()
    {
        try
        {
            Random random = new Random();
            string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            StringBuilder captcha = new StringBuilder();
            for (int i = 0; i < 6; i++)
                captcha.Append(combination[random.Next(combination.Length)]);
            Session["captcha"] = captcha.ToString();
            imgCaptcha.ImageUrl = "GenerateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
        }
        catch
        {


            throw;
        }
    }
    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        FillCapctha();

    }
}