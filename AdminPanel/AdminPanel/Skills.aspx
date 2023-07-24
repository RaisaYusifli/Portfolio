<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Skills.aspx.cs" Inherits="AdminPanel.Skills" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Skills</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />

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
            min-width: 300px; /* Adjust the width as needed */
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
                                <label for="id">ID:</label>
                                <asp:TextBox ID="ID" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="Name">Name:</label>
                                <asp:TextBox ID="Name" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="percentage">Percentage:</label>
                                <asp:TextBox ID="Percentage" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="button-container">
                    <asp:Button ID="ButtonInsert" runat="server" Text="Insert" OnClick="ButtonInsert_Click" CssClass="btn btn-primary" />
                    <asp:Button ID="ButtonUpdate" runat="server" Text="Update" OnClick="ButtonUpdate_Click" CssClass="btn btn-success" />
                    <asp:Button ID="ButtonDelete" runat="server" Text="Delete" OnClick="ButtonDelete_Click" CssClass="btn btn-success" />
                    <asp:Button ID="ButtonGet" runat="server" Text="Get" OnClick="ButtonGet_Click" CssClass="btn btn-success" />
                </div>
                <br /> <br /> <br />
                <asp:GridView ID="SkillsView" runat="server" CssClass="table table-striped table-bordered table-responsive">
                </asp:GridView>
            </div>
        </div>
    </form>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
