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
import semi.mypage.editProfile.model.service.EditProfileService;
import semi.mypage.editProfile.model.vo.EditProfile;
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

    public MyOneCommentController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int currentPage;
        int pageLimit = 5;
        int boardLimit = 5;
        int maxPage;
        int startPage;
        int endPage;
        
        String sort = request.getParameter("sort");
        if (sort == null) {
            sort = "date"; // 기본 정렬을 날짜 순으로 설정
        }
        
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
        
        // listCount 가져오기
        int listCount = new MyOneCommentService().selectListCount(userNo); 
        
        maxPage = (int)Math.ceil((double)listCount / boardLimit);
        startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
        endPage = startPage + pageLimit - 1;

        if (endPage > maxPage) {
            endPage = maxPage;
        }
        
        PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
        ArrayList<OneComment> list = new MyOneCommentService().selectList(pi, userNo, sort);
        
        // 상단 프로필 구문
        ArrayList<EditProfile> profile = new EditProfileService().myProfile(userNo);
	    request.setAttribute("profile", profile); 
	    
        request.setAttribute("pi", pi);
        request.setAttribute("list", list); 
        request.setAttribute("sort", sort);
        request.getRequestDispatcher("./views/mypage/oneComment.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}