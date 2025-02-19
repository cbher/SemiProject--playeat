package semi.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import semi.notice.model.service.NoticeService;
import semi.notice.model.vo.Attechment;
import semi.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeDetailView
 */
@WebServlet("/detail.no")
public class NoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
		int noticeNo = Integer.parseInt(request.getParameter("num"));
		
		int result = new NoticeService().increaseCount(noticeNo);
		
		if(result > 0) {
			Notice n = new NoticeService().noticeDetailView(noticeNo);
			ArrayList<Attechment> list = new NoticeService().selectAttechment(noticeNo);
			request.setAttribute("notice", n);
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/notice/NoticeDetailView.jsp").forward(request, response);
			
		} else {
			request.setAttribute("alertMsg", "상세페이지 접속실패");
			request.getRequestDispatcher("views/notice/NoticeMainView.jsp").forward(request, response);
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
