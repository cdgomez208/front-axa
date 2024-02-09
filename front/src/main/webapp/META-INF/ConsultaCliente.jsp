<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Strings</title>
</head>
<body>
    <h1>Lista de Strings</h1>
    <ul>
        <% 
           String[] stringList = request.getAttribute("stringList").toString().split(",");
           for (String str : stringList) {
        %>
        <li><%= str %></li>
        <% } %>
    </ul>
</body>
</html>
