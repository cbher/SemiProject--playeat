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
import semi.mypage.editProfile.model.service.EditProfileService;
import semi.mypage.editProfile.model.vo.EditProfile;
import semi.mypage.myInquire.model.service.InquireService;
import semi.mypage.myInquire.model.vo.Inquire;
import semi.mypage.myReview.model.service.MyReviewService;
import semi.mypage.myReview.model.vo.Review;

/**
 * Servlet implementation class InquireEditController
 */
@WebServlet("/myinquire")
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
        int currentPage;
        int pageLimit = 10;
        int boardLimit = 20;
        int maxPage;
        int startPage;
        int endPage;

        String cpage = request.getParameter("cpage");
        
        if (cpage == null) {
            currentPage = 1;
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

        //총 게시글 개수
        listCount = new InquireService().selectInquireCount(userNo);

        
        maxPage = (int) Math.ceil((double) listCount / boardLimit);
        //총 페이지
        
        startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
        //시작페이지
        
        endPage = startPage + pageLimit - 1;
        // 마짐막페이지
        if (endPage > maxPage) {
            endPage = maxPage;
        }

        PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

        ArrayList<Inquire> list = new InquireService().inquireList(pi, userNo);
       
        /* 상단 프로필 구문*/ 
        ArrayList<EditProfile> profile = new EditProfileService().myProfile(userNo);
	    request.setAttribute("profile", profile); 
	    
	    
        request.setAttribute("pi", pi);
        request.setAttribute("inquireList", list);
        request.getRequestDispatcher("./views/mypage/inquire.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}