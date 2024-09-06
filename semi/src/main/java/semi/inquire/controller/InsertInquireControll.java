package semi.inquire.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.io.File;

import com.oreilly.servlet.MultipartRequest;

import semi.common.MyFileRenamePolicy;
import semi.inquire.model.service.InquireService;
import semi.inquire.model.vo.Inquire;
import semi.member.model.vo.Member;
import semi.notice.model.vo.Attechment;

/**
 * Servlet implementation class InsertInquireControll
 */
@WebServlet("/insertInq.inq")
public class InsertInquireControll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertInquireControll() {
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
			String savaPath = request.getSession().getServletContext().getRealPath("/resources/inquire_upfiles/");
		
			MultipartRequest multi = new MultipartRequest(request, savaPath, maxSize ,"utf-8", new MyFileRenamePolicy());
			
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			String userNo = multi.getParameter("userNo");
			

			Inquire inq = new Inquire();
			inq.setInquireTitle(title);
			inq.setInquireContent(content);
			inq.setInquireWriter(String.valueOf(userNo));
		
			ArrayList<Attechment> list = new ArrayList<Attechment>();
			
			for(int i=1; i<=3; i++) {
				String key = "upfile" + i;
				
				if(multi.getOriginalFileName(key) != null) {
					Attechment at = new Attechment();
					at.setOriginName(multi.getOriginalFileName(key));
					at.setChangeName(multi.getFilesystemName(key));
					at.setFilePath("resources/inquire_upfiles/");
					
					if( i == 1) {
						at.setFileLevel(1);
					}else {
						at.setFileLevel(2);
					}
					list.add(at);
				}
				
			}
			
			int result = new InquireService().insertInquire(inq, list);
			
		
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "공지사항 작성성공");
				response.sendRedirect(request.getContextPath()+"/iqList.ip?cpage=1");
				
			}else {
				
				request.getSession().setAttribute("alertMsg", "작성실패");
				response.sendRedirect(request.getContextPath()+"/iqList.ip?cpage=1");
				
				
			
			
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
