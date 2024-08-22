package semi.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class LoginComplete
 */
@WebServlet("/LoginComplete.me")
public class LoginComplete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginComplete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userName");
		String userPwd = request.getParameter("userPassword");
		
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		
		if(loginUser == null) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "로그인 실패");
			response.sendRedirect(request.getContextPath()+"/login.me");
			
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			response.sendRedirect(request.getContextPath());
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
