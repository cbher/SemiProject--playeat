package semi.play.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.play.model.service.PlayService;

/**
 * Servlet implementation class AjaxLikeStatusController
 */
@WebServlet("/likeStatus.pl")
public class AjaxLikeStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxLikeStatusController() {
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
			response.getWriter().print(likeCount);
			
		}else {
			response.getWriter().print(0);
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
