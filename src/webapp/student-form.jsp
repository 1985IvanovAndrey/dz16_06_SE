<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.StudentTest" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.ConnectionToBd" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    List<StudentTest> studentsListNew = new ArrayList<>();
    Connection connection = null;
    ConnectionToBd connectionToBd = new ConnectionToBd();
    connection = connectionToBd.myCreateConnection();
    String script = "Select * From studentsmanandwoman";
    PreparedStatement pr = connection.prepareStatement(script);
    ResultSet rs = pr.executeQuery();
    while (rs.next()) {
        studentsListNew.add(new StudentTest(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
    }
    pageContext.setAttribute("studentsListNew", studentsListNew);
%>
<body>
<h2>Таблица всех студентов:</h2>
<table border="4" cellspacing="5" cellpadding="5">
    <tr align="center" c>
        <td><font color="#FF0000">name</font></td>
        <td><font color="#FF0000">sec_name</font></td>
        <td><font color="#FF0000">sex</font></td>
        <td><font color="#FF0000">phone</font></td>
    </tr>
    <c:forEach var="studentTest" items="${studentsListNew}">
    <tr>
        <td>${studentTest.name}</td>
        <td>${studentTest.secName}</td>
        <td>${studentTest.sex}</td>
        <td>${studentTest.phone}</td>
    </tr>
    </c:forEach>
</table>

<br>
<h2>Таблица студентов только sex=${param.sex}:</h2>
    <table border="4" cellspacing="5" cellpadding="5">
        <tr align="center">
            <td><font color="#FF0000">name</font></td>
            <td><font color="#FF0000">sec_name</font></td>
            <td><font color="#FF0000">sex</font></td>
            <td><font color="#FF0000">phone</font></td>
        </tr>
<c:forEach var="studentTest" items="${studentsListNew}">
<c:if test="${studentTest.sex.equals(param.sex)}">
    <tr>
        <td>${studentTest.name}</td>
        <td>${studentTest.secName}</td>
        <td>${studentTest.sex}</td>
        <td>${studentTest.phone}</td>
    </tr>
</c:if>
</c:forEach>
</table>
<br>
<a href="student-form.html"><h2><b>Возврат на страницу выбора таблиц</b></h2></a>

</body>
</html>
