package semi.oneday.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.cooking.model.vo.Attachment;
import semi.oneday.model.service.OnedayService;
import semi.oneday.model.vo.Comment;
import semi.oneday.model.vo.Oneday;

/**
 * Servlet implementation class OnedayDetailController
 */
@WebServlet("/onedayDetail.on")
public class OnedayDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OnedayDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int oneNo = Integer.parseInt(request.getParameter("oneNo"));
			OnedayService oService = new OnedayService();
		
			Oneday o = oService.detailOneday(oneNo);
			
			//ArrayList<Attachment> list = oService.DetailAttachmentList(oneNo);
	        ArrayList<Comment> commentList = new OnedayService().getCommentsByOneNo(oneNo);
	        request.setAttribute("c", commentList);
			request.setAttribute("o", o);
			//request.setAttribute("list", list);
			
			request.getRequestDispatcher("views/oneday/onedayDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
