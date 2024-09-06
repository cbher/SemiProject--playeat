package db.com.semi.adOneDay.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.com.semi.adOneDay.model.service.adOneDayService;

/**
 * Servlet implementation class adOneDayDeteleController
 */
@WebServlet("/adOnedelete.dt")
public class adOneDayDeteleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adOneDayDeteleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int ono = Integer.parseInt(request.getParameter("ono"));
      int result = new adOneDayService().adOneDayDetele(ono);
      response.sendRedirect(request.getContextPath()+"/Detail.ao?Ano="+ono);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
