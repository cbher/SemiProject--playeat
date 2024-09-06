package db.com.semi.adBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.com.semi.adBoard.model.service.AdBoardService;
import db.com.semi.adBoard.model.vo.AdBoard;
import db.com.semi.adBoard.model.vo.Attechment;

/**
 * Servlet implementation class dBoardDetailController
 */
@WebServlet("/Detailbo.bo")
public class AdBoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdBoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		AdBoard list = new AdBoardService().adBoardDetail(bno);
		ArrayList<Attechment> at = new AdBoardService().adBoardDetailat(bno);
		HttpSession session = request.getSession();
		session.setAttribute("adBoardDetaillist", list);
		session.setAttribute("adBoardDetaiatllist", at);

		request.getRequestDispatcher("/views/adminBoard/adminBoardDetailView.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
