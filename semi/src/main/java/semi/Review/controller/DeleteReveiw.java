package semi.Review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.Review.model.service.ReviewService;

/**
 * Servlet implementation class DeleteReveiw
 */
@WebServlet("/deleteReview.re")
public class DeleteReveiw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReveiw() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		int placeNo = Integer.parseInt(request.getParameter("placeNo"));
		int result = new ReviewService().deleteReview(rNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "리뷰 삭제 성공");
			response.sendRedirect("restaurantDetail.pl?placeNo=" + placeNo);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
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
