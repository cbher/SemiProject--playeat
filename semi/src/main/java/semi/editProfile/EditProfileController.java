package semi.editProfile;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.member.model.vo.Member;
import semi.mypage.myInquire.model.service.InquireService;
import semi.mypage.myInquire.model.vo.Inquire;

/**
 * Servlet implementation class EditProfileController
 */
@WebServlet("/editProfile.bo")
public class EditProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();  //사용자 정보를 가져옴
        Member loginUser = (Member) session.getAttribute("loginUser");

        if (loginUser == null) { // 로그인이 되어 있지 않은 경우
           
            response.sendRedirect("views/member/MemberLogin.jsp");
            return; // 이후 코드를 실행하지 않음
        }

        // 로그인이 되어 있는 경우
        
        else {
        	
        
	        int userNo = loginUser.getUserNo(); // 로그인된 사용자의 userNo를 가져옴
	        
	
    
	        //ArrayList<Inquire> list= new InquireService().inquireList(userNo);
	        //프로필 사진, 닉네임, 자기소개 불러와야함(수정)
	        
	        //request.setAttribute("inquireList", list);
	        request.getRequestDispatcher("./views/profile/profile.jsp").forward(request, response);
	

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
