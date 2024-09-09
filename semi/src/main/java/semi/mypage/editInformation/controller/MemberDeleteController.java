package semi.mypage.editInformation.controller;

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
import semi.mypage.editInformation.model.service.InformationEditService;
import semi.mypage.myInquire.model.service.InquireService;
import semi.mypage.myInquire.model.vo.Inquire;
import semi.mypage.myReview.model.service.MyReviewService;

/**
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/Delete.m")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
        int userNo = Integer.parseInt(request.getParameter("uno"));    
        
        int result= new InformationEditService().DeleteMember(userNo);
	
        if(result > 0) { //성공했을 경우
            request.getSession().setAttribute("alertMsg", "회원 탈퇴되었습니다.");
            response.sendRedirect("views/member/MemberLogin.jsp");
            //일단 로그인 창으로 이동
        
        } else { //실패
            request.setAttribute("errorMsg", "수정 실패함");
            request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
