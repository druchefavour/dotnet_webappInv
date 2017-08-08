<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InvoiceForm.aspx.cs" Inherits="ASPMultiFileUpload._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--Here add java script code for adding dynamic file upload control  --%>    
    <script src="Scripts/jquery-1.10.2.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            var scntDiv = $('#FileUploaders');
            var i = $('#FileUploaders p').size() + 1;
 
            $('#addUploader').on('click', function (){
                $('<p><input type="file" id="FileUploader' + i + '" name="FileUploader' + i + '" /></label> <a href="#" id="removeUploader">Remove</a></p>').appendTo(scntDiv);
                    i++;
                    return false;
            });
 
            $('#removeUploader').on('click', function () {
                    if (i > 2) {
                        $(this).parents('p').remove();
                        i--;
                    }
                    return false;
            });
        });
 
    </script> 
    
    <h1 style="font-family: Tahoma; font-size: 40px; font-weight: bolder; color: #000080;">Crane Invoice Processing Application</h1>
    <br /><br />
    
    <%--Here we create a table to hold invoice and email information--%>  
    <div>
        <table>
            <tr>
                <th colspan="2" style="padding: 15px; margin: 15px; font-family: Tahoma; font-size: 32px; text-decoration: underline; font-weight: bold; color: #000099;">Invoice Information</th>
            </tr>
            <tr>
                <td colspan="5" style="font-family: 'Lucida Console'; font-size: 20px"> *Client Code: </td>
                <td><asp:TextBox ID="TextBox1" runat="server" BorderStyle="Solid" ToolTip="Kewell's Client Code" BorderWidth="2px" required="true">Enter Kewell&#39;s Client Code</asp:TextBox></td>
                <td><a href="#" data-toggle="tooltip" title="Client Code #: Kewill Customer Code Number"><span class="glyphicon glyphicon-info-sign"></span></a></td>
            </tr>
            <tr>
                <td colspan="5" style="font-family: 'Lucida Console'; font-size: 20px"> *Invoice Number: </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" BorderStyle="Solid" BorderWidth="2" Text="Enter Kewell's Invoice Number"></asp:TextBox>
                </td>
                <td><a href="#" data-toggle="tooltip" title="Invoice #: Kewill Invoice Number"><span class="glyphicon glyphicon-info-sign"></span></a></td>
            </tr>
            <tr>
                <td colspan="5" style="font-family: 'Lucida Console'; font-size: 20px"> *AWB or BL Number: </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Text="Enter Kewell's AWB or BL number" BorderStyle="Solid" BorderWidth="2"></asp:TextBox>
                </td>
                <td><a href="#" data-toggle="tooltip" title="AWB or BL #: Kewill AWB or BL Number"><span class="glyphicon glyphicon-info-sign"></span></a></td>
            </tr>
            <tr>
                <th colspan="2" style="padding: 15px; margin: 15px; font-family: Tahoma; font-size: 32px; text-decoration: underline; font-weight: bold; color: #000099;">Email Information</th>
            </tr>
            <tr>
                <td style="font-family: 'Lucida Console'; font-size: 20px" colspan="5">*From: </td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" ValidationGroup="email" AutoCompleteType="Email" ClientIDMode="AutoID" ToolTip="Enter Sender's Email" Width="100%" BorderStyle="Solid" Columns="5" CssClass="col-md-8" required="true"> Enter Sender&#39;s Email</asp:TextBox>
                </td>
                <td>
                    <a href="#" data-toggle="tooltip" title="Enter all email addresses to be in the From field on this email, individually separated by a semicolon. (Example:  Mike@abc.com; Bob@abc.com; Jill@abc.com)"><span class="glyphicon glyphicon-info-sign"></span></a>
                </td>
            </tr>
            <tr>
                <td colspan="5" style="font-family: 'Lucida Console'; font-size: 20px">*To: </td>
                <td>
                   <asp:TextBox ID="TextBox5" runat="server" ValidationGroup="email" AutoCompleteType="Email" ClientIDMode="AutoID" ToolTip="Enter Sender's Email" Width="100%" BorderStyle="Solid" Columns="5" CssClass="col-md-8" required="true"></asp:TextBox>
                </td>
                <td><a href="#" data-toggle="tooltip" title="Enter all email addresses to be in the To field on this email, individually separated by a semicolon. (Example:  Mike@abc.com; Bob@abc.com; Jill@abc.com)"><span class="glyphicon glyphicon-info-sign"></span></a></td>
            </tr>
            <tr>
               <td colspan="5" style="font-family: 'Lucida Console'; font-size: 20px">*CC: </td>
             <td>
               <asp:TextBox ID="TextBox6" runat="server" ValidationGroup="email" AutoCompleteType="Email" ClientIDMode="AutoID" ToolTip="Ender Sender's Email" Width="100%" BorderStyle="Solid" Columns="5" CssClass="col-md-8" required="true"></asp:TextBox>
             </td>
             <td><a href="#" data-toggle="tooltip" title="Enter all email addresses to be in the CC field on this email, individually separated by a semicolon. (Example:  Mike@abc.com; Bob@abc.com; Jill@abc.com)"><span class="glyphicon glyphicon-info-sign"></span></a></td>
             </tr>
             <tr>
                <td colspan="5" style="font-family: 'Lucida Console'; font-size: 20px">Subject: </td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server" AutoCompleteType="Email" ClientIDMode="AutoID" ToolTip="Ender Sender's Email" Width="100%" BorderStyle="Solid" Columns="5" CssClass="col-md-8" required="true"></asp:TextBox>
                </td>
               <td><a href="#" data-toggle="tooltip" title="Enter subject of email"><span class="glyphicon glyphicon-info-sign"></span></a></td>

             </tr>
            <tr>
                <td colspan="5" style="font-family: 'Lucida Console'; font-size: 20px">*Email Body: </td>
                <td>
                    <asp:TextBox id="TextArea1" TextMode="multiline" Columns="50" Rows="5" runat="server" AutoCompleteType="Email" ClientIDMode="AutoID" ToolTip="Ender Sender's Email" Width="100%" BorderStyle="Solid" CssClass="col-md-8" required="true" BorderWidth="2px" />
                </td>
                <td> <a href="#" data-toggle="tooltip" title="Body: Email body"><span class="glyphicon glyphicon-info-sign"></span></a></td>
            </tr>
            <tr>
       <td colspan="2" align="center">
           <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click1" Font-Bold="True" />
           <asp:Button ID="Button2" runat="server" Text="Cancel" />
       </td>
    </tr>
    </table>
        <br /><hr />
        <table>
            <tr>
                <th colspan="2" style="padding: 5px; margin: 5px; font-family: Tahoma; font-size: 32px; text-decoration: underline; font-weight: bold; color: #000099; text-align: center; ">Invoice Upload and Download</th>
            </tr>
            <tr>
                <td style="font-family: 'Lucida Console'; font-size: 20px">*Billing Packet: </td>
                <td><a href="#" data-toggle="tooltip" title="Attach invoice to be send to the client"><span class="glyphicon glyphicon-info-sign"></span></a></td>
            </tr>
        </table>
    </div>
        <div style="padding:10px; border:1px solid black">
            <div id="FileUploaders">
                <p></p>
                <p>
                    <input type="file" id="FileUploader1" name="FileUploader1" />
                </p>
                <div>
                    <a href="#" id="addUploader" style="font-size:12pt; color:blue; text-decoration:underline">Add Another</a>
                </div>
                <br />
                <asp:Button ID="btnUploadAll" runat="server" Text="Upload File(s)" OnClick="btnUploadAll_Click" />

        </div>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="10" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="FileName" HeaderText="File name" />
                    <asp:BoundField DataField="FileSize" HeaderText="File Size" />
                    <asp:TemplateField HeaderText="fileID">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDownload" runat="server" CommandName="Download" CommandArgument='<%#Eval("FileID") %>'>Download</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            
        </div>
</asp:Content>
