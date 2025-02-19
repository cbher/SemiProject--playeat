package semi.Review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.Review.model.service.ReviewService;
import semi.Review.model.vo.Attachment2;
import semi.Review.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateController
 */
@WebServlet("/updateForm.re")
public class ReviewUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		ReviewService rService = new ReviewService();
		
		Review r = rService.selectReview(rNo);
		Attachment2 at = rService.selectAttachment(rNo);
		
		request.setAttribute("r", r);
		request.setAttribute("at", at);
		
		request.getRequestDispatcher("views/Review/updateReview.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
