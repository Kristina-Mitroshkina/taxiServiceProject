<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 19.07.2022
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspf/directive/page.jspf" %>
<%@ include file="/WEB-INF/jspf/directive/taglib.jspf" %>

<html>

<c:set var="title" value="Sorry" scope="page" />
<%@ include file="/WEB-INF/jspf/head.jspf" %>

<body>
<table id="main-container">

    <%@ include file="/WEB-INF/jspf/header.jspf" %>

    <tr>
        <td class="content">

            <form id="sorry_form">
                <img id="img" src="style/images/img5.png">
                <p>Thanks, client is waiting for you!<p>
            </form>

        </td>
    </tr>

    <%@ include file="/WEB-INF/jspf/footer.jspf" %>

</table>
</body>
</html>
