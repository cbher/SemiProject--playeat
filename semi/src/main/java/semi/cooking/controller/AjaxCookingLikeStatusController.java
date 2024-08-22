package semi.cooking.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.cooking.model.service.CookingService;

/**
 * Servlet implementation class AjaxCookingLikeStatusController
 */
@WebServlet("/like.li")
public class AjaxCookingLikeStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCookingLikeStatusController() {
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
		
		response.getWriter().print(likeCount);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
