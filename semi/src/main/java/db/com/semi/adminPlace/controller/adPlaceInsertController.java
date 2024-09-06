package db.com.semi.adminPlace.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import db.com.semi.adminPlace.model.service.adPlaceService;
import db.com.semi.adminPlace.model.vo.Attechment;
import db.com.semi.adminPlace.model.vo.Place;
import semi.common.MyFileRenamePolicy;

/**
 * Servlet implementation class adPlaceInsertController
 */
@WebServlet("/AdPlaceInsert.ap")
public class adPlaceInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adPlaceInsertController() {
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
			String savePath = request.getSession().getServletContext().getRealPath("/resources/place_upfiles/");
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());

	
		
		Place p = new Place();
		p.setpTitle(multipartRequest.getParameter("ptitle"));
		p.setpCall(multipartRequest.getParameter("pcall"));
		p.setAddress(multipartRequest.getParameter("address"));
		p.setTemCateNo(Integer.parseInt(multipartRequest.getParameter("tCate")));
		p.setLocationNo(Integer.parseInt(multipartRequest.getParameter("lCate")));
		p.setpSelectNum(Integer.parseInt(multipartRequest.getParameter("psNum")));
		p.setRcategoryNo(Integer.parseInt(multipartRequest.getParameter("rCate")));
		p.setBusinesstime(multipartRequest.getParameter("startTime")+"~"+multipartRequest.getParameter("endTime"));
		
		ArrayList<Attechment> list = new ArrayList<Attechment>();
		
		
		for(int i=1; i<=4; i++) {
			String key = "file"+i;
			
			if(multipartRequest.getOriginalFileName(key) !=null) {
				Attechment at = new Attechment();
				at.setOriginName(multipartRequest.getOriginalFileName(key));
				at.setChangeName(multipartRequest.getFilesystemName(key));
				at.setFilePath("resources/place_upfiles/");
				
				if(i == 1) {// 대표이미지일경우
					at.setFileLevel(1);
				}else {//상세이미지일경우
					at.setFileLevel(2);
				}
				list.add(at);
			}
		}
		int result = new adPlaceService().insertPlace(p,list);
		
		response.sendRedirect(request.getContextPath()+"/adPlace.pl");
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
