package semi.mypage.editInformation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;
import semi.mypage.editInformation.model.service.InformationEditService;
import semi.mypage.editInformation.model.vo.MemberInformation;
import semi.mypage.editProfile.model.service.EditProfileService;
import semi.mypage.editProfile.model.vo.EditProfile;
import semi.mypage.myReview.model.service.MyReviewService;
import semi.mypage.myReview.model.vo.Review;


/**
 * Servlet implementation class InformationEditController
 */
@WebServlet("/information.edit")
public class InformationEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InformationEditController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

        // 정보 수정 폼에서 전달된 데이터를 받아옴
        int userNo = Integer.parseInt(request.getParameter("userNo"));
        String userName = request.getParameter("name");
        String userPwd = request.getParameter("password");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");


        MemberInformation memberinformation = new MemberInformation(userNo, userName, userPwd, phone, email);

        int result = new InformationEditService().updateMember(memberinformation, userNo);

        
        if (result > 0) {
        	//성공했으니 수정된 회원정보를 다시 가져와야 함
            HttpSession session = request.getSession();
            Member loginUser = (Member) session.getAttribute("loginUser");
            
            loginUser.setUserName(userName);
            loginUser.setUserPwd(userPwd);
            loginUser.setPhone(phone);
            loginUser.setEmail(email);

            session.setAttribute("alertMsg", "회원정보 수정 완료.");

            // 상단 프로필 구문
            ArrayList<EditProfile> profile = new EditProfileService().myProfile(userNo);
		    request.setAttribute("profile", profile);

		    
            response.sendRedirect(request.getContextPath() + "/information.view?userNo=" + userNo);
        } else {
            // 실패했을 시
            request.setAttribute("errorMsg", "회원 정보 수정에 실패했습니다.");
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
