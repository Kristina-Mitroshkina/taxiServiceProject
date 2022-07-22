package ua.kharkov.epam.mitroshkina.taxiService.web.command;

import org.apache.log4j.Logger;
import ua.kharkov.epam.mitroshkina.taxiService.Path;
import ua.kharkov.epam.mitroshkina.taxiService.db.ClientOrderDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class DriverConfirmOrderCommand extends Command{
    private static final long serialVersionUID = 1656156165557020610L;

    private static final Logger log = Logger.getLogger(ConfirmOrderCommand.class);

    @Override
    public String execute(HttpServletRequest request,
                          HttpServletResponse response) throws IOException, ServletException, SQLException {

        log.debug("Command starts");

        int confirmedOrder_id = Integer.parseInt(request.getParameter("confirmedOrder_id"));
        new ClientOrderDao().updateConfirmOrderStatus(confirmedOrder_id);
        int time = new ClientOrderDao().timeToWait();
        request.setAttribute("time", time);

        log.debug("Command finished");
        return Path.PAGE__CLIENT_IS_WAITING;

    }
}
