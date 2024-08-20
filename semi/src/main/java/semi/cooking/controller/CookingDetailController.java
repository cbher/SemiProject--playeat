package semi.cooking.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.cooking.model.service.CookingService;
import semi.cooking.model.vo.Attachment;
import semi.cooking.model.vo.CookingBoard;

/**
 * Servlet implementation class CookingDetailController
 */
@WebServlet("/detail.co")
public class CookingDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CookingDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cookBoardNo = Integer.parseInt(request.getParameter("bno"));
		CookingService cService = new CookingService();
		int result = cService.increaseCount(cookBoardNo);
		
		if(result > 0) {
			CookingBoard cookBoard = cService.selectCookBoard(cookBoardNo);
			ArrayList<Attachment> list = cService.selectAttachmentList(cookBoardNo); 
			
			request.setAttribute("cBoard", cookBoard);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("views/cooking/cookingDetailView.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
