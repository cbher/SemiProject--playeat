package semi.play.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.play.model.service.PlayService;
import semi.play.model.vo.PlayReply;

/**
 * Servlet implementation class AjaxReplyInsertController
 */
@WebServlet("/insertReply.ar")
public class AjaxReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int star = Integer.parseInt(request.getParameter("star"));
		String content = request.getParameter("content");
		int placeNo = Integer.parseInt(request.getParameter("placeNo"));
		
		PlayReply pr = new PlayReply();
		pr.setUserId(userNo+"");
		pr.setScore(star);
		pr.setComment(content);
		pr.setPlaceNo(placeNo);
		int result = new PlayService().insertReply(pr);
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
