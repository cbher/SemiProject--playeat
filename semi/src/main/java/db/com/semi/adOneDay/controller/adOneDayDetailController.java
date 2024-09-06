package db.com.semi.adOneDay.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.com.semi.adOneDay.model.service.adOneDayService;
import db.com.semi.adOneDay.model.vo.Attechment;
import db.com.semi.adOneDay.model.vo.adOneDayClass;


/**
 * Servlet implementation class adOneDayDetailController
 */
@WebServlet("/Detail.ao")
public class adOneDayDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adOneDayDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ano = Integer.parseInt(request.getParameter("Ano"));
	
		adOneDayClass list = new adOneDayService().adOnedayDetail(ano);
		ArrayList<Attechment> at = new adOneDayService().adOnedayDetailat(ano);
		
		request.setAttribute("list", list);
		request.setAttribute("at", at);
	
		request.getRequestDispatcher("views/adOneDayClass/adminOneDayClassDetailViews.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
