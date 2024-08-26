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
 * Servlet implementation class CookingUpdateController
 */
@WebServlet("/updateEnrollForm.co")
public class CookingUpdateEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CookingUpdateEnrollFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int cBoardNo = Integer.parseInt(request.getParameter("bno"));
		
		CookingService cService = new CookingService();
		ArrayList<Attachment> list = cService.selectAttachmentList(cBoardNo);
		CookingBoard cBoard = cService.selectCookBoard(cBoardNo);
		
		request.setAttribute("list", list);
		request.setAttribute("cBoard", cBoard);
		request.getRequestDispatcher("views/cooking/cookingUpdateForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
