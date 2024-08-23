package semi.inquire.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.inquire.model.service.InquireService;
import semi.inquire.model.vo.Inquire;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class InsertInquireControll
 */
@WebServlet("/insertInq.inq")
public class InsertInquireControll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertInquireControll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
	
		Inquire inq = new Inquire();
		inq.setInquireTitle(title);
		inq.setInquireContent(content);
		inq.setInquireWriter(String.valueOf(userNo));
				
				
		int result = new InquireService().insertInquire(inq);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "공지사항 작성성공");
			response.sendRedirect(request.getContextPath()+"/iqList.ip?cpage=1");
			
		}else {
			// 실패 
			request.getSession().setAttribute("alertMsg", "작성실패");
			response.sendRedirect(request.getContextPath()+"/iqList.ip?cpage=1");
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
