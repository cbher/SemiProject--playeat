package semi.mypage.myInquire.controller;

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
import semi.mypage.myInquire.model.service.InquireService;
import semi.mypage.myInquire.model.vo.Inquire;
import semi.mypage.myReview.model.service.MyReviewService;
import semi.mypage.myReview.model.vo.Review;

/**
 * Servlet implementation class InquireEditController
 */
@WebServlet("/myinquire.1")
public class InquireController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquireController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				int listCount;    
				int currentPage = 1;  
				int pageLimit = 10;   
				int boardLimit = 20; 
				int maxPage;          
				int startPage;	     
				int endPage;	      
		
				
				
				HttpSession session = request.getSession();  
		        Member loginUser = (Member) session.getAttribute("loginUser");

		        if (loginUser == null) { 
		            response.sendRedirect("views/member/MemberLogin.jsp");
		            return; 
		        }

		        int userNo = loginUser.getUserNo(); // 로그인된 사용자의 userNo를 가져옴

				// listCount : 총 게시글 개수 
				listCount = new MyReviewService().selectListCount(userNo);  // 총 게시글 수 가져오기

				// maxPage : 총 페이지 수 계산
				maxPage = (int)Math.ceil((double)listCount / boardLimit);

				// startPage : 페이징 바의 시작 페이지 번호 계산
				startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

				// endPage : 페이징 바의 마지막 페이지 번호 계산
				endPage = startPage + pageLimit - 1; 

				if(endPage > maxPage) {
					endPage = maxPage;
				}

				
				
				
				
			
				PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

				
				
				
				
		
        
		        ArrayList<Inquire> list= new InquireService().inquireList(pi, userNo);
			
		        request.setAttribute("pi", pi);
		        request.setAttribute("inquireList", list);
		        request.getRequestDispatcher("./views/mypage/inquire.jsp").forward(request, response);
		
	
	       
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
