package semi.mypage.myReview.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;
import semi.mypage.myReview.model.service.MyReviewService;
import semi.mypage.myReview.model.vo.Review;

/**
 * Servlet implementation class MypageReviewController
 */
@WebServlet("/mypage.myreview")
public class MypageReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		System.out.println(userId);
		
	
		
		Member loginUser = new MemberService().loginMember(userId, userPwd); 
		
		 request.setAttribute("loginUser", loginUser);
		 
		 int userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		 
		
		
		
		if(userNo != 0) { //로그인 되있을 경우 
			MyReviewService r = new MyReviewService();
			ArrayList<Review> List = r.selectList(userNo);
			//보내고,
        
        request.setAttribute("reviewList", List);
        request.getRequestDispatcher("./views/mypage/myReview.jsp").forward(request, response);
		}else { 
			request.setAttribute("errorMsg", "로그인해야 사용할 수 있음");
			RequestDispatcher view = request.getRequestDispatcher("views/member/login.jsp");
				view.forward(request, response);
			
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
