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
        </c:forEach>
    </tr>
</table>
<%--<h2>Таблица студентов только sex="MAN":</h2>--%>
<%--<table border="4" cellspacing="5" cellpadding="5">--%>
<%--<tr align="center">--%>
<%--<td> <font color="#FF0000">name</font></td>--%>
<%--<td><font color="#FF0000">sec_name</font></td>--%>
<%--<td><font color="#FF0000">sex</font></td>--%>
<%--<td><font color="#FF0000">phone</font></td>--%>
<%--</tr>--%>
<%--<c:forEach var="studentTest" items="${studentsListNew}">--%>
<%--<c:if test="${studentTest.sex.equals(\"MAN\")}">--%>
<%--<tr>--%>
<%--<td>${studentTest.name}</td>--%>
<%--<td>${studentTest.secName}</td>--%>
<%--<td>${studentTest.sex}</td>--%>
<%--<td>${studentTest.phone}</td>--%>
<%--</c:if>--%>
<%--</c:forEach>--%>
<%--</tr>--%>
<%--</table>--%>
<%--<b><i><h4><a href="index.jsp">Возврат на главную страницу</a> </h4></i></b>--%>

<br>
<form action="studentTest.jsp">
    <input type="radio" name="chooseSex" value="MAN"> MAN
    <input type="radio" name="chooseSex" value="WOMAN"> WOMAN
    <input type="submit" value="Submit"/></form>

<%--<c:forEach var="studentTest" items="${studentsListNew}">--%>
<%--<c:if test="${studentTest.sex.equals(request.getParam(\"chooseSex\"))}">--%>
<%--<table border="4" cellspacing="5" cellpadding="5">--%>
    <%--<tr align="center">--%>
        <%--<td><font color="#FF0000">name</font></td>--%>
        <%--<td><font color="#FF0000">sec_name</font></td>--%>
        <%--<td><font color="#FF0000">sex</font></td>--%>
        <%--<td><font color="#FF0000">phone</font></td>--%>
    <%--</tr>--%>
    <% boolean flag=true;
        for (StudentTest s : studentsListNew) {
            if (s.getSex().equals(request.getParameter("chooseSex"))) {
                if (flag) {
                    out.print("<br/> <table border = " + "4" + " cellspacing = " + "5" + " cellpadding = " + "5" + ">\n" +
                            "<tr align="+"center"+">\n" +
                            "<td><font color=\"#FF0000\">name</font></td>\n" +
                            "<td><font color=\"#FF0000\">sec_name</font></td>\n" +
                            "<td><font color=\"#FF0000\">sex</font></td>\n" +
                            "<td><font color=\"#FF0000\">phone</font>\n" +
                            "</tr>");
                    flag = false;
                }
                out.print("<tr>");
                out.print("<td>" + s.getName() + "</td>");
                out.print("<td>" + s.getSecName() + "</td>");
                out.print("<td>" + s.getSex() + "</td>");
                out.print("<td>" + s.getPhone() + "</td>");
                out.print("</tr>");
            }
        }
    %>
    <%--<tr>--%>
    <%--<td>${studentTest.name}</td>--%>
    <%--<td>${studentTest.secName}</td>--%>
    <%--<td>${studentTest.sex}</td>--%>
    <%--<td>${studentTest.phone}</td>--%>
    <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
    <%--</tr>--%>
<%--</table>--%>
<%--</c:if>--%>
<%--</c:forEach>--%>
</body>
</html>
