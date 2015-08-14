<%@ include file="/WEB-INF/template/include.jsp"%>

<%@ include file="/WEB-INF/template/header.jsp"%>

<%@ include file="template/localHeader.jsp"%>

html>

<head>
    <title> </title>
    <% if (Boolean.valueOf("${isRunning}")) { %>
        <SCRIPT LANGUAGE="JavaScript">
            setTimeout("location='continueMigration.jsp'", 1000);
        </SCRIPT>
    <% } %>
    
<h1 align="center">Data Validation and Translation...</h1>

<h2 align="center">
    Result: <%= Integer.parseInt("${getResult}") %><br />
    <% int percent = Integer.parseInt("${getPercent}") %>
    <%= percent %>%
</h2>

<table width="60%" align="center"
        border="1" cellpadding="0" cellspacing="2">
    <TR>
        <% for (int i = 10; i <= percent; i += 10) { %>
            <td width="10%" bgcolor="#000080">&nbsp;</td>
        <% } %>
        <% for (int i = 100; i > percent; i -= 10) { %>
            <td width="10%">&nbsp;</TD>
        <% } %>
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td align="center">
            <% if (Boolean.valueOf("{isRunning}")) { %>
                Running
            <% } else { %>
                <% if (Boolean.valueOf("${isCompleted}")) { %>
                   <jsp:forward page="status.jsp"/>
                <% } else if (!Boolean.valueOf("${isStarted}")) { %>
                     Data Migration Not Started
                <% } else { %>
                    <jsp:forward page="error.jsp"/>
                <% } %>
            <% } %>
        </td>
    </tr>
</head>

<body>

<%@ include file="/WEB-INF/template/footer.jsp"%>
