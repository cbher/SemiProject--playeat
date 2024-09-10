package semi.mypage.mylist.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.mypage.mylist.model.service.MyListService;

/**
 * Servlet implementation class MyListDeleteController
 */
@WebServlet("/MyListDelete")
public class MyListDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyListDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
        int likeNo = Integer.parseInt(request.getParameter("listNo"));
        
        int result = new MyListService().deleteMyList(likeNo);
        
        if (result > 0) {
            request.getSession().setAttribute("alertMsg", "찜 리스트가 삭제되었습니다.");
            response.sendRedirect(request.getContextPath() + "/mylist.mo");
        } else {
            request.setAttribute("errorMsg", "삭제 실패");
            request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
