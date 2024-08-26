package semi.mypage.myReview.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.mypage.myReview.model.service.MyReviewService;

/**
 * Servlet implementation class ReviewDeleteController
 */
@WebServlet("/ReviewDelete.bo")
public class ReviewDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		
		int result = new MyReviewService().deleteMyReview(reviewNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "게시글 삭제 완료");
			response.sendRedirect(request.getContextPath()+"/mypage.myreview?cpage=1");
		}else {
			request.getSession().setAttribute("errorMsg", "게시글 삭제실패!");
			request.getAttribute("views/common/errorPage.jsp");
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
