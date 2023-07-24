<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Galery.aspx.cs" Inherits="AdminPanel.Galery" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gallery</title>
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
            padding: 20px;
        }

        h2 {
            margin-top: 0;
        }

        .upload-section {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .upload-button {
            display: block;
            padding: 8px 15px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 14px;
        }

        .upload-button:hover {
            background-color: #0056b3;
        }

        .about-button {
            display: block;
            padding: 8px 15px;
            background-color: #ccc;
            color: #333;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 14px;
            margin-left: 10px;
        }

        .about-button:hover {
            background-color: #bbb;
        }

        .upload-input {
            margin-right: 10px;
        }

        .gridview-container {
            margin-top: 40px;
        }

        .gridview-table {
            width: 100%;
            border-collapse: collapse;
        }

        .gridview-table th,
        .gridview-table td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        .gridview-table th {
            background-color: #f2f2f2;
            text-align: left;
            font-weight: bold;
        }

        .gridview-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .gridview-table tr:hover {
            background-color: #f5f5f5;
        }

        .text-label {
            margin-right: 10px;
            font-weight: bold;
        }

        .text-box {
            padding: 5px;
        }

        .image-container {
            width: 200px;
            height: 200px;
            overflow: hidden;
            margin-top: 10px;
        }

        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
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
                <h2>Gallery</h2>
                <div class="upload-section">
                    <asp:FileUpload ID="GaleryFileUpload" runat="server" CssClass="upload-input" />
                    <asp:Label ID="LabelDescription" runat="server" Text="Description:" CssClass="text-label"></asp:Label>
                    <asp:TextBox ID="DescriptionTextBox" runat="server" CssClass="text-box"></asp:TextBox>
                    <asp:Button ID="ButtonUpload" runat="server" Text="Upload" CssClass="upload-button" OnClick="ButtonUpload_Click" />
                    <asp:Button ID="ButtonDelete" runat="server" Text="Delete" CssClass="about-button" OnClick="ButtonDelete_Click" />
                    <asp:Button ID="ButtonShowImage" runat="server" Text="Show Image" CssClass="about-button" OnClick="ButtonShowImage_Click" BackColor="#FF9933" />
                    <div class="image-container">
                        <asp:Image ID="Pic" runat="server" />
                    </div>
                </div>
                <div class="gridview-container">
                    <asp:GridView ID="PathGridView" runat="server" CssClass="gridview-table">
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
