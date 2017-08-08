using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using static System.Net.WebRequestMethods;
using System.Data.SqlClient;
using System.Data;

namespace ASPMultiFileUpload
{
    public partial class _Default : Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=CWW-IAH-9JJ13G2\SQLREAL;Initial Catalog=NewDatabase;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Form.Enctype = "multipart/form-data"; // this is required to enable multifile upload
            if(!IsPostBack)
            {
                PopulateUploadFiles();
            }
        }

        private void PopulateUploadFiles()
        {
            //Populate data
            using (NewDatabaseEntities dc = new NewDatabaseEntities())
            {
                GridView1.DataSource = dc.UploadFiles.ToList();
                GridView1.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void btnUploadAll_Click(object sender, EventArgs e)
        {
            HttpFileCollection filesColl = Request.Files;
            using (NewDatabaseEntities dc = new NewDatabaseEntities())
            {
                foreach (string uploader in filesColl)
                {
                    HttpPostedFile file = filesColl[uploader];

                    if(file.ContentLength > 0)
                    {
                        BinaryReader br = new BinaryReader(file.InputStream);
                        byte[] buffer = br.ReadBytes(file.ContentLength);

                        dc.UploadFiles.Add(new UploadFile
                        {
                            FileID = 0,
                            FileName = file.FileName,
                            ContentType = file.ContentType,
                            FileExtension = Path.GetExtension(file.FileName),
                            FileSize = file.ContentLength,
                            FileContent = buffer
                        });                    }
                }
                dc.SaveChanges();
            }
            PopulateUploadFiles(); // for refrence grid data
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //Add code for downloading files
            if(e.CommandName == "Download")
            {
                int fildID = Convert.ToInt32(e.CommandArgument.ToString());
                using (NewDatabaseEntities dc = new NewDatabaseEntities())
                {
                    var v = dc.UploadFiles.Where(a => a.FileID.Equals(fildID)).FirstOrDefault();
                    if(v != null)
                    {
                        Response.ContentType = v.ContentType;
                        Response.AddHeader("content-disposition", "attachment; filename=" + v.FileName);
                        Response.BinaryWrite(v.FileContent);
                        Response.Flush();
                        Response.End();
                    }

                }
            }
        }
  
        protected void Button1_Click1(object sender, EventArgs e)
        {
            //start code from here
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into InvoiceInfo values ('" + TextBox1.Text + "','" + TextBox2.Text + "', '" + TextBox3.Text + "', '" + TextBox4.Text + "', '" + TextBox5.Text + "', '" + TextBox6.Text + "', '" + TextBox7.Text + "', '" + TextArea1.Text + "')";
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}