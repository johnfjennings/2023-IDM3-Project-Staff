<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.idm3projectbasic.model.User"%>
<%--
  Created by IntelliJ IDEA.
  User: Elizabeth.Bourke
  Date: 27/09/2023
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>

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
    <input type="hidden" name="action" value="saveUserDetails">

    <label for="FirstName">FirstName:</label>
    <input type="text" id="FirstName" name="FirstName" value="${User.firstName}"><br>

    <label for="Surname">Surname:</label>
    <input type="text" id="Surname" name="Surname" value="${User.firstName}"><br>

    <label for="EmailAddress">EmailAddress:</label>
    <input type="text" id="EmailAddress" name="EmailAddress" value="${User.emailAddress}"><br>

    <label for="Password">Password:</label>
    <input type="text" id="Password" name="Password" value="${User.password}"><br>

    <label for="UserName">Username:</label>
    <input type="text" id="UserName" name="UserName" value="${User.userName}"><br>

    <label for="UserType">UserType</label>
    <input type="text" id="UserType" name="UserType" value="${User.userType}"><br>

    <label for="Organization">Organization</label>
    <input type="text" id="Organization" name="Organization" value="${User.organization}"><br>

    <input type="submit" value="Submit">

</form>
</body>
</html>
