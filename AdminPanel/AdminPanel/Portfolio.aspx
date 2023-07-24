<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Portfolio.aspx.cs" Inherits="AdminPanel.Portfolio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<style>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }

    .container {
        display: flex;
        min-height: 100vh;
    }

    .sidebar {
        background-color: #333;
        color: #fff;
        flex-basis: 200px;
        padding: 20px;
        flex-shrink: 0;
        position: fixed;
        top: 0;
        left: 0;
        bottom: 0;
    }

    .sidebar ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .sidebar li {
        margin-bottom: 10px;
    }

    .sidebar a {
        text-decoration: none;
        color: #fff;
    }

    .sidebar a:hover {
        color: #ccc;
    }

    .content {
        flex-grow: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .form-container {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        align-items: center;
        width: 100%;
        max-width: 600px;
    }

    .form-container label {
        font-weight: bold;
        flex-basis: 20%;
        text-align: right;
    }

    .form-container input[type="text"],
    .form-container textarea {
        flex-basis: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
        box-sizing: border-box;
        width: 100%;
    }

    .button-container {
        display: flex;
        gap: 10px;
    }

    .button-container button {
        padding: 10px 15px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        font-size: 14px;
        transition: background-color 0.3s;
    }

    .button-container button:hover {
        background-color: #0056b3;
    }
</style>

</style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="sidebar">
                <h2>Admin Panel</h2>
                <ul>
                    <li><a href="Portfolio.aspx">Portfolio</a></li>
                    <li><a href="Skills.aspx">Skills</a></li>
                    <li><a href="Galery.aspx">Galery</a></li>
                    <li><a href="Whatido.aspx">What I do</a></li>
                </ul>
            </div>
            <div class="content">
                <div class="form-container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="Name">Name:</label>
                                <asp:TextBox ID="Name" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="Surname">Surname:</label>
                                <asp:TextBox ID="Surname" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="Username">Username:</label>
                                <asp:TextBox ID="Username" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="Password">Password:</label>
                                <asp:TextBox ID="Password" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="Job">Job:</label>
                                <asp:TextBox ID="Job" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="Jobdesc">Job Description:</label>
                                <asp:TextBox ID="Jobdesc" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="About">About:</label>
                                <asp:TextBox ID="About" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="City">City:</label>
                                <asp:TextBox ID="City" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="Phone">Phone:</label>
                                <asp:TextBox ID="Phone" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="Email">Email:</label>
                                <asp:TextBox ID="Email" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="button-container">
                    <asp:Button ID="ButtonRefreshData" runat="server" Text="Refresh Data" OnClick="ButtonRefreshData_Click" CssClass="btn btn-primary" />
                    <asp:Button ID="ButtonUpdate" runat="server" Text="Update" OnClick="ButtonUpdate_Click" CssClass="btn btn-success" />
                </div>
            </div>
        </div>
    </form>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
