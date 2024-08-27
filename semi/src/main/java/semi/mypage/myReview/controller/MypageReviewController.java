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
		int currentPage;  // 기본값으로 현재 페이지를 1로 설정
		int pageLimit=10;  // 페이징 바의 페이지 갯수
		int boardLimit = 5;  // 게시글 최대 개수(단위)  		
		int maxPage;          // 가장 마지막 페이지(총 페이지 수)
		int startPage;	      // 페이징 바의 시작 수
		int endPage;	      // 페이징 바의 끝 수
		
		String cpage = request.getParameter("cpage");
		if (cpage == null) {
			 currentPage = 1; // 기본값 설정
		} else {
			 currentPage = Integer.parseInt(cpage);
		}
		// 쿼런트 페이지 : 현재 페이지 (즉, 사용자가 요청한 페이지)
		//currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		
		// 사용자 정보를 가져옴
		HttpSession session = request.getSession();  
        Member loginUser = (Member) session.getAttribute("loginUser");

        if (loginUser == null) { // 로그인이 되어 있지 않은 경우
            response.sendRedirect("views/member/MemberLogin.jsp");
            return; // 이후 코드를 실행하지 않음
        }

        int userNo = loginUser.getUserNo(); // 로그인된 사용자의 userNo를 가져옴

		// listCount : 총 게시글 개수 
		listCount = new MyReviewService().selectListCount(userNo);  // 총 게시글 수 가져오기
		System.out.println("listcount"+listCount);
		System.out.println(listCount);
		
		// maxPage : 총 페이지 수 계산
		maxPage = (int)Math.ceil((double)listCount / boardLimit);

		// startPage : 페이징 바의 시작 페이지 번호 계산
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		// endPage : 페이징 바의 마지막 페이지 번호 계산
		endPage = startPage + pageLimit - 1; 

		if(endPage > maxPage) {
			endPage = maxPage;
		}

		// PageInfo 객체 생성
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		// 리뷰 리스트를 가져옴
		ArrayList<Review> list = new MyReviewService().selectList(pi, userNo);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);  // 리뷰 리스트를 요청에 설정하고 My Review 페이지로 포워드
		request.getRequestDispatcher("./views/mypage/myReview.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}