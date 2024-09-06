package semi.oneday.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semi.oneday.model.service.OnedayService;
import semi.oneday.model.vo.Comment;

/**
 * Servlet implementation class AjaxCommentInsertController
 */
@WebServlet("/commentInsert.on")
public class CommentInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
		
		int oneNo = Integer.parseInt(request.getParameter("oneNo"));
        int userNo = Integer.parseInt(request.getParameter("userNo"));
        int score = Integer.parseInt(request.getParameter("score")); 
        String comContent = request.getParameter("comContent");

        // Create a Comment object
        Comment com = new Comment();
        com.setOneNo(oneNo);
        com.setUserNo(userNo);
        com.setScore(score);
        com.setComContent(comContent);

        int result = new OnedayService().insertComment(com);

        if (result > 0) {
            response.sendRedirect("onedayDetail.on?oneNo=" + oneNo);
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
