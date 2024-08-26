package db.com.semi.adminMember.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.com.semi.adminMember.model.service.AdMemberService;
import db.com.semi.adminMember.model.vo.AdReport;
import db.com.semi.common.model.vo.PageInfo;

/**
 * Servlet implementation class AdminReportList
 */
@WebServlet("/adReportList.rl")
public class AdminReportList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReportList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 ArrayList<AdReport> list = null;
		 int reportlistcount = 0;
		
		 String select =  request.getParameter("select");
		 if(request.getParameter("select") == null) {
			list = new AdMemberService().adReportList();
				select = "all"; 
		 }else {
			 switch(select) {
			 
			 case "all" :
				list = new AdMemberService().adReportList();
				 
				 break;
			 case "ready" :
				 list = new AdMemberService().adReportReadyList();
				 reportlistcount = list.size();
				 break;
			 case "clear" :
				 list = new AdMemberService().adReportClearList();
				 
				 break;
			 }
		
		
		 }
			int currentPage  ;
		
		int listCount = list.size(); 		 // 현재 총 게시글의 개수  //사이즈 받아오면 그게 LIST카우늩임
		if(request.getParameter("cpage") == null) {
			currentPage = 1;
		}else {
		 currentPage = Integer.parseInt(request.getParameter("cpage")) ;	 // 현재 페이지(즉, 사용자가 요청한 페이지) 현제 페이지는 CPAGE로 받아오는중이다 못받아올경우 없음 단 intger로 변환해줘야지
		}
	
		
		int pageLimit = 10 ; 	 // 페이지 하단에 보여질 페이지바의 페이지 최대갯수(몇개 단위인가?)
		int boardLimit = 10; 	 // 한 페이지 내에 보여질 게시글 최대 갯수(몇개 단위씩 보여줄것인가
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit); 		 // 가장 마지막페이지(총 페이지 수)
	int	 startPage = (currentPage-1)/ pageLimit *pageLimit+1;
	int	 endPage = startPage + pageLimit -1  ;  // 해당 페이징바의 끝수
	 if(endPage> maxPage) {
			endPage = maxPage;
		}
	 PageInfo pi = null;
	 //만들어진 애들 페이징바 처리
	 pi =  new PageInfo(listCount, currentPage, pageLimit, boardLimit,maxPage, startPage,endPage);
	 
	 

		 
		 
		 
	 
	 
	 
		
	 HttpSession session = request.getSession();
	 
	session.setAttribute("adReportPi", pi);	
		request.setAttribute("list", list);
		session.setAttribute("reportselectview", select);
		session.setAttribute("reportlistcount", reportlistcount);
		
		
		request.getRequestDispatcher("/views/adminMember/adminReportListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
