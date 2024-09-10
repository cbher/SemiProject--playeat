package semi.mypage.myOneComment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.member.model.vo.Member;
import semi.mypage.editProfile.model.service.EditProfileService;
import semi.mypage.editProfile.model.vo.EditProfile;
import semi.mypage.myOneComment.model.service.MyOneCommentService;
import semi.mypage.myReview.model.service.MyReviewService;

/**
 * Servlet implementation class OneCommentDeleteController
 */
@WebServlet("/OneCommentDelete.no")
public class OneCommentDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OneCommentDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
        Member loginUser = (Member) session.getAttribute("loginUser");
        
		int oneComment = Integer.parseInt(request.getParameter("cno"));
		
		int result = new MyOneCommentService().DeleteComment(oneComment);
		int userNo = loginUser.getUserNo();
		
		
		 /* 상단 프로필 구문*/ 
        ArrayList<EditProfile> profile = new EditProfileService().myProfile(userNo);
	    request.setAttribute("profile", profile); 
	    
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "한줄평 삭제 완료");
			response.sendRedirect(request.getContextPath()+"/myonecomment/?cpage=1");
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
