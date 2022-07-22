<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspf/directive/page.jspf" %>
<%@ include file="/WEB-INF/jspf/directive/taglib.jspf" %>

<html>

<c:set var="title" value="New orders" scope="page" />
<%@ include file="/WEB-INF/jspf/head.jspf" %>

<body>
<table id="main-container">

    <%@ include file="/WEB-INF/jspf/header.jspf" %>

    <tr>
        <td class="content">
            <h1>New orders</h1>
            <c:choose>
                <c:when test="${fn:length(newOrderDriverBeanList) == 0}">No new orders</c:when>

                <c:otherwise>
                    <table id="list_order_table">
                        <thead>
                        <tr>
                            <td>Id</td>
                            <td>User_id</td>
                            <td>Departure_address</td>
                            <td>Destination_address</td>
                            <td>Passengers number</td>
                            <td>Order date</td>
                            <td>Status</td>
                        </tr>
                        </thead>

                        <c:forEach var="bean" items="${newOrderDriverBeanList}">
                        <form id="order_form" action="controller" method="get">
                            <input type="hidden" name="command" value="driverConfirmOrder" />
                            <tr>
                                <input type="hidden" name="confirmedOrder_id" value="${bean.confirmedOrder_id}">
                                <td>${bean.confirmedOrder_id}</td>
                                <td>${bean.user_id}</td>
                                <td>${bean.departure_address}</td>
                                <td>${bean.destination_address}</td>
                                <td>${bean.passengers_number}</td>
                                <td>${bean.order_date}</td>
                                <td>${bean.status} <input id="submit" type="submit" value="confirm"></td>
                            </tr>
                        </form>
                        </c:forEach>
                    </table>
                </c:otherwise>
            </c:choose>

        </td>
    </tr>

    <%@ include file="/WEB-INF/jspf/footer.jspf" %>

</table>
</body>
</html>
