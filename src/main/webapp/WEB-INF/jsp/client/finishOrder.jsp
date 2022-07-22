<%@ page pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jspf/directive/page.jspf" %>
<%@ include file="/WEB-INF/jspf/directive/taglib.jspf" %>

<html>

<c:set var="title" value="Finish order" scope="page"/>
<%@ include file="/WEB-INF/jspf/head.jspf" %>

<body>
<table id="main-container">

    <%@ include file="/WEB-INF/jspf/header.jspf" %>

    <tr>
        <td class="content">
<%--            <form id="thanks_form">--%>
                <form id="thanks_form" action="controller" method="get">
                    <input type="hidden" name="command" value="updateStatus" />
                <img id="img" src="style/images/img5.png">
                <p>Thank you for the order!</p>
                <p><span id="time">Waiting for approval!</span></p>
                <script>
                    var time = '${time}';
                    var status = '${status}'

                    function startTimer(duration, display) {
                        var timer = duration, minutes, seconds;
                        setInterval(function () {
                            if (status !== "confirmed"){
                                document.getElementById("time").innerHTML = "Waiting for approval!";
                            } else {
                                minutes = parseInt(timer / 60, 10);
                                seconds = parseInt(timer % 60, 10);

                                minutes = minutes < 10 ? "0" + minutes : minutes;
                                seconds = seconds < 10 ? "0" + seconds : seconds;

                                display.textContent = minutes + ":" + seconds + " min to wait";

                                if (--timer < 0) {
                                    clearInterval()
                                    document.getElementById("time").innerHTML = "The car is waiting!";
                                }
                            }
                        }, 1000);
                    }

                    window.onload = function () {
                        var fiveMinutes = 60 * time,
                            display = document.querySelector('#time');
                        startTimer(fiveMinutes, display);
                    };
                </script>
            </form>
        </td>
    </tr>

    <%@ include file="/WEB-INF/jspf/footer.jspf" %>

</table>
</body>
</html>