package semi.inquire.controller;

import java.io.IOException;
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
		
			Attechment at = null;
			
			if(multi.getOriginalFileName("upfile") != null) {
				at = new Attechment();
				at.setOriginName(multi.getOriginalFileName("upfile"));
				at.setChangeName(multi.getFilesystemName("upfile"));
				at.setFilePath("resources/inquire_upfiles/");
			}
				int result = new InquireService().insertInquire(inq, at);
			
				System.out.println(inq);
				System.out.println(at);
		
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "공지사항 작성성공");
				response.sendRedirect(request.getContextPath()+"/iqList.ip?cpage=1");
				
			}else {
				if(at != null) {
					new File(savaPath + at.getChangeName()).delete();
				}
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
