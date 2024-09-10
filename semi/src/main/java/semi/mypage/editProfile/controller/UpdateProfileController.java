package semi.mypage.editProfile.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import semi.common.MyFileRenamePolicy;
import semi.mypage.editProfile.model.service.EditProfileService;
import semi.mypage.editProfile.model.vo.Attachment;
import semi.mypage.editProfile.model.vo.EditProfile;
import semi.member.model.vo.Member;

@WebServlet("/updateProfile.bo")
public class UpdateProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateProfileController() {
        super();
    }

    // GET 요청은 페이지 조회를 처리
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
        Member loginUser = (Member) session.getAttribute("loginUser");

        if (loginUser == null) {
        	
            response.sendRedirect("views/member/MemberLogin.jsp");
            return;
        }

        // 사용자 번호 가져오기
        int userNo = loginUser.getUserNo();
        
        // 파일 업로드 및 데이터 처리
        if (ServletFileUpload.isMultipartContent(request)) {
            int maxSize = 10 * 1024 * 1024; // 파일 최대 크기 (10MB)
            String savePath = request.getSession().getServletContext().getRealPath("/resources/images/profile/");
            // MultipartRequest 객체 생성 (파일 및 폼 데이터 처리)
            MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
            
           
            String nickname = multiRequest.getParameter("nickname");
            String introduce = multiRequest.getParameter("intro");
            
            ArrayList<Attachment> attList = new ArrayList<>();

            String fileName = multiRequest.getOriginalFileName("profileImage");

            if (fileName != null) {
                // 첨부 파일이 있을 경우 파일 정보를 저장
                Attachment att = new Attachment();
                att.setOriginName(multiRequest.getOriginalFileName("profileImage"));
                att.setChangeName(multiRequest.getFilesystemName("profileImage"));
                att.setFilePath("resources/profile/");
                att.userNo(userNo);
                attList.add(att);
            }

            // 서비스로 프로필 수정 요청
            int result = new EditProfileService().EditMyProfile(userNo, nickname, introduce, attList);

            // 처리 결과에 따른 페이지 이동
            if (result > 0) {
                
            	
            	
            	 /* 상단 프로필 구문*/ 
                ArrayList<EditProfile> profile = new EditProfileService().myProfile(userNo);
        	    request.setAttribute("profile", profile); 
        	    
        	    
                request.getSession().setAttribute("alertMsg", "프로필이 성공적으로 수정되었습니다.");
                response.sendRedirect(request.getContextPath() + "/editProfile.eo?userNo=" + userNo);
           } else {
                // 실패 시 에러 페이지로 이동
               request.setAttribute("alertMsg", "프로필 수정에 실패했습니다.");
               request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
            }
            
            
   
            
            
        }
        
        
    }

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
     // TODO Auto-generated method stub
     		doGet(request, response);
    }
}