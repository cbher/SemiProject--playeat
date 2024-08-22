package semi.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
<<<<<<<< HEAD:semi/src/main/java/semi/notice/controller/MemberEnrollForm.java
 * Servlet implementation class MemberEnrollForm
 */
@WebServlet("/enrollForm.me")
public class MemberEnrollForm extends HttpServlet {
========
 * Servlet implementation class NoticeInsertPage
 */
@WebServlet("/createIN.no")
public class NoticeInsertPage extends HttpServlet {
>>>>>>>> entance3:semi/src/main/java/semi/notice/controller/NoticeInsertPage.java
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
<<<<<<<< HEAD:semi/src/main/java/semi/notice/controller/MemberEnrollForm.java
    public MemberEnrollForm() {
========
    public NoticeInsertPage() {
>>>>>>>> entance3:semi/src/main/java/semi/notice/controller/NoticeInsertPage.java
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<<< HEAD:semi/src/main/java/semi/notice/controller/MemberEnrollForm.java
		RequestDispatcher view = request.getRequestDispatcher("views/member/MemberEnrollForm.jsp");
========
		RequestDispatcher view = request.getRequestDispatcher("views/notice/NoticeInsert.jsp");
>>>>>>>> entance3:semi/src/main/java/semi/notice/controller/NoticeInsertPage.java
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
