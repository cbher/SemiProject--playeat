package semi.oneday.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.oneday.model.service.OnedayService;

/**
 * Servlet implementation class AjaxLikeInsertController
 */
@WebServlet("/onedayLike.on")
public class AjaxLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxLikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			if(request.getParameter("userNo") != null) {
			
			int oneNo = Integer.parseInt(request.getParameter("bno"));
			int userNo = Integer.parseInt(request.getParameter("userNo"));
			
			int like = new OnedayService().selectLike(oneNo, userNo);
			response.getWriter().print(like);
			
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
