package db.com.semi.adOneDay.controller;

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

import db.com.semi.adOneDay.model.service.adOneDayService;
import db.com.semi.adOneDay.model.vo.Attechment;
import db.com.semi.adOneDay.model.vo.adOneDayClass;
import semi.common.MyFileRenamePolicy;


/**
 * Servlet implementation class adOneDayInsertController
 */
@WebServlet("/adOneinsert.ai")
public class adOneDayInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adOneDayInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
				
				
				
				if(ServletFileUpload.isMultipartContent(request)) {
					int maxSize = 10 * 1024 * 1024;
					String savePath = request.getSession().getServletContext().getRealPath("/resources/oneday_upfiles/");
					MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());

			
				
				adOneDayClass a = new adOneDayClass();
				a.setLocationNo(Integer.parseInt(multipartRequest.getParameter("areaSelect")));
				a.setOneTitle(multipartRequest.getParameter("onetitle"));
				a.setEntPeople(Integer.parseInt(multipartRequest.getParameter("entpeople")));
				a.setTemCateNo(Integer.parseInt(multipartRequest.getParameter("temcateSelect")));
				a.setOnecategoryNo(Integer.parseInt(multipartRequest.getParameter("oneCateSelect")));
				a.setPrice(Integer.parseInt(multipartRequest.getParameter("price")));
				a.setOnePlace(multipartRequest.getParameter("onePlace"));
				a.setStartTime(multipartRequest.getParameter("startTime"));
				a.setEndTime(multipartRequest.getParameter("endTime"));
				a.setPhone(multipartRequest.getParameter("phone"));
				
				
			
				ArrayList<Attechment> list = new ArrayList<Attechment>();
				
				
				for(int i=1; i<=4; i++) {
					String key = "file"+i;
					
					if(multipartRequest.getOriginalFileName(key) !=null) {
						Attechment at = new Attechment();
						
						at.setOriginName(multipartRequest.getOriginalFileName(key));
						at.setChangeName(multipartRequest.getFilesystemName(key));
						at.setFilePath("resources/oneday_upfiles/");
						if(i == 1) {// 대표이미지일경우
							at.setFileLevel(1);
						}else {//상세이미지일경우
							at.setFileLevel(2);
						}
						list.add(at);
					}
				
				}
				int result = new adOneDayService().adonedayInsert(a,list);
				if(result>0) {
					HttpSession session = request.getSession();
					session.setAttribute("adAlertMsg", "성공적으로 등록되었습니다");
//					request.getRequestDispatcher(request.getContextPath()+"/views/adOneDayClass/adminOneDayClassListView.jsp").forward(request, response);
					response.sendRedirect(request.getContextPath()+"/adoneclass.ac");
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
