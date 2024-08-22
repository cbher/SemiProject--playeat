package semi.cooking.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semi.cooking.model.service.CookingService;
import semi.cooking.model.vo.CookingBoard;

/**
 * Servlet implementation class AjaxCookingLikeController
 */
@WebServlet("/increaseLike.il")
public class AjaxCookingLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCookingLikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cBoardNo = Integer.parseInt(request.getParameter("bno"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int likeCount = new CookingService().selectLikeList(cBoardNo, userNo);
		
		if(likeCount == 0) {
			
			int result = new CookingService().increaseLike(cBoardNo);
			int insertResult = new CookingService().insertLikeList(cBoardNo, userNo);
			
			
		}else {
			
			int result = new CookingService().decreaseLike(cBoardNo);
			int deleteResult = new CookingService().deleteLikeList(cBoardNo, userNo);
		}
		
		CookingBoard cBoard = new CookingService().selectCookBoard(cBoardNo); 
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(cBoard,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
