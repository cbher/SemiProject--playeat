package semi.mypage.editInformation.controller;

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


/**
 * Servlet implementation class InformationViewController
 */
@WebServlet("/information.view")
public class InformationViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InformationViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 	
		 	HttpSession session = request.getSession();  
	        Member loginUser = (Member) session.getAttribute("loginUser");
	        int userNo = loginUser.getUserNo();
	        
	        /* 상단 프로필 구문*/ 
	        ArrayList<EditProfile> profile = new EditProfileService().myProfile(userNo);
		    request.setAttribute("profile", profile); 
		    
		    
		    
		    
	        request.getRequestDispatcher("./views/mypage/information.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
