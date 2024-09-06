package semi.Review.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import semi.Review.model.service.ReviewService;
import semi.Review.model.vo.Review;
import semi.common.MyFileRenamePolicy;
import semi.cooking.model.vo.Attachment;

/**
 * Servlet implementation class ReviewUpdateController
 */
@WebServlet("/updateReview.re")
public class ReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
		
		int maxSize = 10*1024*1024;
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/review_upfiles/");
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		 String rNo = multiRequest.getParameter("rNo");
		 String rTitle = multiRequest.getParameter("rTitle");
         String rContent = multiRequest.getParameter("rContent");
         String score = multiRequest.getParameter("score");
         String userNo = multiRequest.getParameter("userNo");
         String placeNo = multiRequest.getParameter("placeNo");
         
         
         Review review = new Review();
         review.setrTitle(rTitle);
         review.setrContent(rContent);
         review.setScore(score);
         review.setUserNo(userNo);
         review.setpNo(placeNo);
         review.setrNo(rNo);
         
		Attachment at = null; // 처음에는 null로 초기화, 넘어온 첨부파일이 있다면 생성
		if(multiRequest.getOriginalFileName("file1") != null) {
			
			at = new Attachment();
			at.setOriginName(multiRequest.getOriginalFileName("file1"));
			at.setChangeName(multiRequest.getFilesystemName("file1"));
			at.setFilePath("/resources/review_upfiles/");
			
			if(multiRequest.getParameter("originFileNo") != null) {
				// 기존의 첨부파일이 있었을 경우 => Update Attachment (기존의 첨부파일 번호)
				at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
		}
		int result = new ReviewService().reviewUpdate(review, at);
		if(result > 0) {
			 request.getSession().setAttribute("alertMsg", "리뷰 수정 성공");
			 request.getSession().setAttribute("rNo", rNo);
			 response.sendRedirect("restaurantDetail.pl?placeNo=" + placeNo);
		}else {
			if(at != null) {
				new File(savePath + at.getChangeName()).delete();
			}
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
		}
	}
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
