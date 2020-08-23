using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindTable();
        }
    }

    private void BindTable()
    {
        //Building an HTML string.
        StringBuilder html = new StringBuilder();

        //Table start.
        html.Append("<h2>Places</h2>");
        html.Append("<ul>");
        DataTable dt = new DataTable();
        string query = @"SELECT *from Category_Master Order By Category_Id";

        dt = DataAccessLayer.GetDataTable(query);

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            //html.Append("<li><span>&raquo;</span><a href='#'>");
            html.Append("<li><span>&raquo;</span>");
            html.Append("<a href='ShowDetail.aspx?Text=" + dt.Rows[i]["Category_Id"].ToString() + "'>");
            html.Append(dt.Rows[i]["Category_Name"].ToString());
            html.Append("</a></li>");
        }
        html.Append("</ul>");
                
        //Append the HTML string to Placeholder.
        Control myControl1 = FindControl("sidebar");
        if (myControl1 != null)
        {
            myControl1.Controls.Add(new Literal { Text = html.ToString() });
        }
                
    }
}
