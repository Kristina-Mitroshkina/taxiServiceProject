package ua.kharkov.epam.mitroshkina.taxiService.web.command;

import org.apache.log4j.Logger;
import ua.kharkov.epam.mitroshkina.taxiService.Path;
import ua.kharkov.epam.mitroshkina.taxiService.db.ClientOrderDao;
import ua.kharkov.epam.mitroshkina.taxiService.db.bean.ConfirmedOrderBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class ListNewOrdersDriverCommand extends Command{
    private static final long serialVersionUID = -4626071636517987394L;

    private static final Logger log = Logger.getLogger(ListNewOrdersDriverCommand.class);

    @Override
    public String execute(HttpServletRequest request,
                          HttpServletResponse response) throws IOException, ServletException, SQLException {
        log.debug("Commands starts");

        List<ConfirmedOrderBean> newOrderDriverBeanList = new ClientOrderDao().getNewOrderForDriverBeans();
        log.trace("Found in DB: newOrderDriverBeanList --> " + newOrderDriverBeanList);

        // put confirmed order beans list to request
        request.setAttribute("newOrderDriverBeanList", newOrderDriverBeanList);
        log.trace("Set the request attribute: newOrderDriverBeanList --> " + newOrderDriverBeanList);

        log.debug("Commands finished");
        return Path.PAGE__LIST_NEW_ORDERS;
    }
}

