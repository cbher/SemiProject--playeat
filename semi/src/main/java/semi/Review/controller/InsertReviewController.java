package semi.restaurant.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertReviewController
 */
@WebServlet("/insertReview.pl")
public class InsertReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewController() {
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
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 3. DB에 기록할 데이터를 뽑아서 VO에 담기
			//	  > 카테고리 번호, 제목, 내용, 작성자 회원번호 뽑아서 Board 테이블 insert
			//	  > 넘어온 첨부파일이 있다면 원본명, 수정명, 저장폴더경로 뽑아서 Attachment 테이블 insert
			String category = multiRequest.getParameter("category");
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			String boardWriter = multiRequest.getParameter("userNo");
			
			
			
			String ReviewTitle = multiRequest.getParameter("title");
			
			Board b = new Board();
			b.setCategory(category);
			b.setBoardTitle(boardTitle);
			b.setBoardContent(boardContent);
			b.setBoardWriter(boardWriter);
			
			Attachment at = null; // 처음에는 null로 초기화, 넘어온 첨부파일이 있다면 생성
			// multiRequest.getOriginalFileName("키") : 넘어온 첨부파일이 있었을 경우 "원본명" | 없었을 경우 null
			if(multiRequest.getOriginalFileName("upfile") != null) {
				
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/board_upfiles/");
			}
			
			// 4. 서비스 요청(요청 처리)
			int result = new BoardService().insertBoard(b, at);
			
			// 5. 응답뷰 지정
			// 성공 => /jsp/list.bo?cpage=1		url 재요청 => 목록페이지
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "게시글 등록 성공");
				response.sendRedirect(request.getContextPath() + "/list.bo?cpage=1");
			}else {
				// 실패 => 첨부파일이 있었다면 업로드된 파일 찾아서 삭제시킨후 => 에러페이지
				if(at != null) {
					new File(savePath + at.getChangeName()).delete();
				}
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
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
