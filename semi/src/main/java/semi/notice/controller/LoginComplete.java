package semi.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.notice.model.service.NoticeService;
import semi.notice.model.vo.Notice;

/**
<<<<<<<< HEAD:semi/src/main/java/semi/notice/controller/LoginComplete.java
 * Servlet implementation class LoginComplete
 */
@WebServlet("/LoginComplete.me")
public class LoginComplete extends HttpServlet {
========
 * Servlet implementation class NoticeUpdateController
 */
@WebServlet("/updateNotice.no")
public class NoticeUpdateController extends HttpServlet {
>>>>>>>> entance3:semi/src/main/java/semi/notice/controller/NoticeUpdateController.java
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
<<<<<<<< HEAD:semi/src/main/java/semi/notice/controller/LoginComplete.java
    public LoginComplete() {
========
    public NoticeUpdateController() {
>>>>>>>> entance3:semi/src/main/java/semi/notice/controller/NoticeUpdateController.java
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
<<<<<<<< HEAD:semi/src/main/java/semi/notice/controller/LoginComplete.java
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
========
		int noticeNo = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Notice n = new Notice(noticeNo, title, content);
		
		int result = new NoticeService().updateNotice(n);
	
		if(result > 0) {
			request.setAttribute("alertMsg", "공지사항 수정완료!");
			response.sendRedirect(request.getContextPath()+"/detail.no?num="+noticeNo);
			
		}else {
		
>>>>>>>> entance3:semi/src/main/java/semi/notice/controller/NoticeUpdateController.java
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
