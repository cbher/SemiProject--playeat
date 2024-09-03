package db.com.semi.adminPlace.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.com.semi.adminPlace.model.service.adPlaceService;
import db.com.semi.adminPlace.model.vo.Attechment;
import db.com.semi.adminPlace.model.vo.Place;
import semi.cooking.model.vo.Attachment;

/**
 * Servlet implementation class adPlaceDetailController
 */
@WebServlet("/Detail.apo")
public class adPlaceDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adPlaceDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int pno = Integer.parseInt(request.getParameter("pno"));
		Place list = new adPlaceService().adplaceDetial(pno);
		ArrayList<Attechment> at = new adPlaceService().adplaceDetialat(pno);
		
		HttpSession session = request.getSession();
		session.setAttribute("placeDetaillist", list);
		session.setAttribute("placeDetailat", at);
		

		request.getRequestDispatcher("views/adminPlace/adminPlaceDetail.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
