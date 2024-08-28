package semi.oneday.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import semi.oneday.model.service.OnedayService;
import semi.oneday.model.vo.Comment;

/**
 * Servlet implementation class CommentViewController
 */
@WebServlet("/commentView.on")
public class CommentViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int oneNo = Integer.parseInt(request.getParameter("oneNo")); // Get the ONE_NO from the request parameter
        


        ArrayList<Comment> commentList = new OnedayService().getCommentsByOneNo(oneNo);
        request.setAttribute("c", commentList); // Set the comment list in the request scope

        // Forward to the JSP page
        request.getRequestDispatcher("/views/oneday/onedayDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
