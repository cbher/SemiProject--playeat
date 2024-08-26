package semi.cooking.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.cooking.model.service.CookingService;

/**
 * Servlet implementation class CookDeleteController
 */
@WebServlet("/delete.co")
public class CookDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CookDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cBoardNo = Integer.parseInt(request.getParameter("bno"));
		int result = new CookingService().deleteCookBoard(cBoardNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "게시물이 성공적으로 삭제되었습니다.");
		}else {
			request.getSession().setAttribute("alertMsg", "게시물 삭제에 실패하였습니다.");			
		}
		response.sendRedirect(request.getContextPath() + "/clist.co?cpage=1");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
