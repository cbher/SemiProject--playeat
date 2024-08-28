package semi.play.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.cooking.model.service.CookingService;
import semi.play.model.service.PlayService;

/**
 * Servlet implementation class AjaxChangeLikeController
 */
@WebServlet("/changeLike.pl")
public class AjaxChangeLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxChangeLikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("userNo") != null) {
			int placeNo = Integer.parseInt(request.getParameter("bno"));
			int userNo = Integer.parseInt(request.getParameter("userNo"));
			int likeCount = new PlayService().selectLikeCount(placeNo, userNo);

			if(likeCount == 0) {
				int result = new PlayService().insertLikeList(placeNo, userNo);
			}else {
				int result = new PlayService().deleteLikeList(placeNo, userNo);
			}
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
