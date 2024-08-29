package semi.inquire.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.inquire.model.service.InquireService;
import semi.inquire.model.vo.Inquire;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class checkEmailInquire
 */
@WebServlet("/checkEmail.inq")
public class checkEmailInquire extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkEmailInquire() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
	        Member loginUser = (Member) session.getAttribute("loginUser");
		int inquireNo =   Integer.parseInt(request.getParameter("inquireNo"));
		String email = request.getParameter("email");
		
		Inquire inq = new InquireService().checkEmail(inquireNo);
		
		if (loginUser != null && loginUser.getEmail().equals(inq.getEmail()) 
	            && loginUser.getEmail().equals(email)) {
	            response.getWriter().write("success");
	        } else {
	            response.getWriter().write("fail");
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
