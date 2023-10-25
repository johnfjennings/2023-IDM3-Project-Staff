<%--
  Created by IntelliJ IDEA.
  User: Elizabeth.Bourke
  Date: 27/09/2023
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
<head>
    <title>TODO supply a title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/lcstyle.css">
</head>
<body>

<form action="MainGalleryController" method="Post">
    <input type="hidden" name="action" value="createUser">

    <label for="FirstName">FirstName:</label>
    <input type="text" id="FirstName" name="FirstName"><br>

    <label for="Surname">Surname:</label>
    <input type="text" id="Surname" name="Surname"><br>

    <label for="EmailAddress">EmailAddress:</label>
    <input type="text" id="EmailAddress" name="EmailAddress"><br>

    <label for="Password">Password:</label>
    <input type="text" id="Password" name="Password"><br>

    <label for="UserName">Username:</label>
    <input type="text" id="UserName" name="UserName"><br>

    <label for="UserType">UserType</label>
    <input type="text" id="UserType" name="UserType"><br>

    <label for="Organization">Organization</label>
    <input type="text" id="Organization" name="Organization"><br>

    <input type="submit" value="Submit">

</form>
</body>
</html>
