package semi.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import semi.common.MyFileRenamePolicy;
import semi.member.model.vo.Member;
import semi.notice.model.service.NoticeService;
import semi.notice.model.vo.Attechment;
import semi.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeInsertControll
 */
@WebServlet("/insert.no")
public class NoticeInsertControll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertControll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10* 1024 * 1024 ;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/notice_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
			Notice n = new Notice();
			n.setNoticeTitle(multiRequest.getParameter("title"));
			n.setNoticeContent(multiRequest.getParameter("content"));
			n.setNoticeWriter(multiRequest.getParameter("userNo"));
			
		
			
			ArrayList<Attechment> list = new ArrayList<Attechment>();
			
			for(int i=1; i<=3; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					Attechment at = new Attechment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/notice_upfiles/");
					
					if( i == 1) {
						at.setFileLevel(1);
					}else {
						at.setFileLevel(2);
					}
					list.add(at);
				}
				
			}
			
		
			int result = new NoticeService().insertNotice(n , list);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "공지사항 작성성공");
				response.sendRedirect(request.getContextPath()+"/noticeList.no?cpage=1");
				
			}else {
				// 실패 
				request.getSession().setAttribute("alertMsg", "작성실패");
				response.sendRedirect(request.getContextPath()+"/noticeList.no?cpage=1");
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
