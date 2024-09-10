package semi.mypage.myReview.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.common.PageInfo;
import semi.member.model.vo.Member;
import semi.mypage.editProfile.model.service.EditProfileService;
import semi.mypage.editProfile.model.vo.EditProfile;
import semi.mypage.myReview.model.service.MyReviewService;
import semi.mypage.myReview.model.vo.Review;

/**
 * Servlet implementation class MypageReviewController
 */
@WebServlet("/mypage.myreview")
public class MypageReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MypageReviewController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// ----------------- 페이징 처리 -----------------
		int listCount;    
		int currentPage;  
		int pageLimit=10;  
		int boardLimit = 5; 	
		int maxPage;         
		int startPage;	     
		int endPage;	     
		
		String cpage = request.getParameter("cpage");
		if (cpage == null) {
			 currentPage = 1; // 기본값 설정
		} else {
			 currentPage = Integer.parseInt(cpage);
		}
	
		HttpSession session = request.getSession();  
        Member loginUser = (Member) session.getAttribute("loginUser");

        if (loginUser == null) { // 로그인이 되어 있지 않은 경우
            response.sendRedirect("views/member/MemberLogin.jsp");
            return; // 이후 코드를 실행하지 않음
        }

        int userNo = loginUser.getUserNo(); // 로그인된 사용자의 userNo를 가져옴

		
		listCount = new MyReviewService().selectListCount(userNo);  // 총 게시글 수 가져오기

		
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);

		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		
		endPage = startPage + pageLimit - 1; 

		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		 String sort = request.getParameter("sort");
		    if (sort == null || sort.isEmpty()) { 
		        sort = "date";  // 기본적으론 날짜순으로 정렬시킴
		    }

		    // PageInfo
		    PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		    //sort 정렬 포함
		    ArrayList<Review> list = new MyReviewService().selectList(pi, userNo, sort);
		    
		    
		    ArrayList<EditProfile> profile = new EditProfileService().myProfile(userNo);
		    
		    
		    request.setAttribute("pi", pi);
		    request.setAttribute("list", list);
		    request.setAttribute("profile", profile); 
		    request.setAttribute("sort", sort);
		    
		    request.getRequestDispatcher("./views/mypage/myReview.jsp").forward(request, response);
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}