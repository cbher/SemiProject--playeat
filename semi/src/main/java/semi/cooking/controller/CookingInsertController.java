package semi.cooking.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import oracle.net.aso.b;
import semi.common.MyFileRenamePolicy;
import semi.cooking.model.service.CookingService;
import semi.cooking.model.vo.Attachment;
import semi.cooking.model.vo.CookingBoard;

/**
 * Servlet implementation class CookingInsertController
 */
@WebServlet("/insert.co")
public class CookingInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CookingInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/cooking_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
			CookingBoard c = new CookingBoard();
			c.setUserNo(multiRequest.getParameter("userNo"));
			c.setcBoardTitle(multiRequest.getParameter("title"));
			c.setcBoardContent(multiRequest.getParameter("content"));
			c.setCookCategory(Integer.parseInt(multiRequest.getParameter("category")));
			ArrayList<Attachment> list = new ArrayList<Attachment>();
			
			for(int i = 1; i<10; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/cooking_upfiles/");
					
					if(i == 1) {
						at.setFileLevel(1);
					}else {
						at.setFileLevel(2);
					}
					list.add(at);
				}
			}
			int result = new CookingService().insertCookingBoard(c, list);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "성공적으로 게시물이 작성되었습니다.");
				response.sendRedirect(request.getContextPath() + "/clist.co");
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
