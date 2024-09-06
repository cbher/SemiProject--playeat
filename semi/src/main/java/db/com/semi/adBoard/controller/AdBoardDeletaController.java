package db.com.semi.adBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.com.semi.adBoard.model.service.AdBoardService;

/**
 * Servlet implementation class AdBoardDeletaController
 */
@WebServlet("/adBoard.de")
public class AdBoardDeletaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /*
     * @see HttpServlet#HttpServlet()
     */
    public AdBoardDeletaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int bno = Integer.parseInt(request.getParameter("bno"));
	int result = new AdBoardService().adboarddelete(bno);
	response.sendRedirect(request.getContextPath()+"/Detailbo.bo?bno="+bno);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
