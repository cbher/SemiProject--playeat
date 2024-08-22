package semi.cooking.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.cooking.model.service.CookingService;
import semi.cooking.model.vo.CookingBoard;

/**
 * Servlet implementation class CookingUpdateController
 */
@WebServlet("/update.co")
public class CookingUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CookingUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int cBoardNo = Integer.parseInt(request.getParameter("bno"));
		int category = Integer.parseInt(request.getParameter("category"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		CookingBoard cBoard = new CookingBoard();
		cBoard.setcBoardNo(cBoardNo);
		cBoard.setcBoardTitle(title);
		cBoard.setCookCategory(category);
		cBoard.setcBoardContent(content);
		
		int result = new CookingService().updateCookBoard(cBoard);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "게시물 수정이 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/clist.co");
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
