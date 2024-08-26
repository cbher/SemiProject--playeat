package semi.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import semi.common.MyFileRenamePolicy;
import semi.notice.model.service.NoticeService;
import semi.notice.model.vo.Attechment;
import semi.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateController
 */
@WebServlet("/updateNotice.no")
public class NoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			
			int noticeNo = Integer.parseInt(request.getParameter("num"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Notice n = new Notice(noticeNo, title, content);
			
			System.out.println(request.getParameter("num"));
			
			int result = new NoticeService().updateNotice(n);
			
			if(result > 0) {
				request.setAttribute("alertMsg", "공지사항 수정 완료!");
				response.sendRedirect(request.getContextPath()+"/detail.no?num="+n.getNoticeNo());
				
			}else {
				request.setAttribute("alertMsg", "공지사항 수정 실패!");
				response.sendRedirect(request.getContextPath()+"/detail.no?num="+n.getNoticeNo());
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
