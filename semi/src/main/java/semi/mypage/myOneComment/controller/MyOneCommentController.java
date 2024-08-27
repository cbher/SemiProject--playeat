package semi.mypage.myOneComment.controller;

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
import semi.mypage.myOneComment.model.service.MyOneCommentService;
import semi.mypage.myOneComment.model.vo.OneComment;
import semi.mypage.myReview.model.service.MyReviewService;
import semi.mypage.myReview.model.vo.Review;


/**
 * Servlet implementation class myOneCommentController
 */
@WebServlet("/myonecomment")
public class MyOneCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOneCommentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			 
		int listCount;    
		int currentPage;  // 기본값으로 현재 페이지를 1로 설정
		int pageLimit = 5;   // 페이징 바의 페이지 갯수
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
		
		
		HttpSession session = request.getSession();  
        Member loginUser = (Member) session.getAttribute("loginUser");

        if (loginUser == null) { 
            response.sendRedirect("views/member/MemberLogin.jsp");
            return; 
        }

        int userNo = loginUser.getUserNo(); 

		listCount = new MyReviewService().selectListCount(userNo); 

		maxPage = (int)Math.ceil((double)listCount / boardLimit);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		endPage = startPage + pageLimit - 1; 

		if(endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		ArrayList<OneComment> list = new MyOneCommentService().selectList(pi, userNo);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);  // 리뷰 리스트를 요청에 설정하고 My Review 페이지로 포워드
		request.getRequestDispatcher("./views/mypage/oneComment.jsp").forward(request, response);
		
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
