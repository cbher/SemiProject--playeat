package semi.member.controller;

import java.io.IOException;
import java.lang.reflect.Member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.member.model.service.MemberService;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("/Member.bo")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
	        String userPwd = request.getParameter("userPwd");

	        MemberService memberService = new MemberService();
	        /*Member loginUser = memberService.loginMember(userId, userPwd);

	        if (loginUser != null) {
	            HttpSession session = request.getSession();
	            session.setAttribute("loginUser", loginUser);
	            response.sendRedirect("mypage.jsp");
	        } else {
	            request.setAttribute("msg", "로그인 실패");*/
	            //request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
	            //에러페이지 만들어야함
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
