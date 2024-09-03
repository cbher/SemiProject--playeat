package db.com.semi.adOneDay.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.com.semi.adOneDay.model.service.adOneDayService;
import db.com.semi.adOneDay.model.vo.adOneDayClass;
import db.com.semi.common.model.vo.PageInfo;

/**
 * Servlet implementation class adOneDayList
 */
@WebServlet("/adoneclass.ac")
public class adOneDayList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adOneDayList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		

		 ArrayList<adOneDayClass> list = null;
		String select = request.getParameter("select");
		if( request.getParameter("select")== null) {
			select = "all";
			 list = new adOneDayService().adOnedayList();
		}else {
			 switch(select) {
			 case "all" :
				 list = new adOneDayService().adOnedayList();
				 break;
			 case "ready" : 
				 list = new adOneDayService().adOnedayReadyList();
			
				 break;
			 case "clear" :
				list = new adOneDayService().adOnedayClearList();
				 break;
			 case "fail" :
				list = new adOneDayService().adOnedayFailList();
				 break;
				 
			 
			 }
		}
			 
				int listCount = list.size(); 		 // 현재 총 게시글의 개수
				int currentPage ;	 // 현재 페이지(즉, 사용자가 요청한 페이지)
			
				
				int pageLimit ; 	 // 페이지 하단에 보여질 페이지바의 페이지 최대갯수(몇개 단위인가?)
				int boardLimit; 	 // 한 페이지 내에 보여질 게시글 최대 갯수(몇개 단위씩 보여줄것인가
				
				int maxPage; 		 // 가장 마지막페이지(총 페이지 수)
				int startPage; 	     // 해당 페이징바의 시작수
				int endPage ;	     // 해당 페이징바의 끝수
				//가져온 cpage 기본값은 1로
				if(request.getParameter("cpage")==null){
					 currentPage=1;
				}
				else{
				 currentPage = Integer.parseInt(request.getParameter("cpage"));
				}
				 //*pageLimit : 페이징바의 페이지 최대 개수(단위)
				 pageLimit = 10;
				 
				 //*boardLimit : 게시글 최대 개수(단위)
				 boardLimit = 10;
				
				 maxPage = (int)Math.ceil((double)listCount / boardLimit);
				 startPage = (currentPage-1)/ pageLimit *pageLimit+1;
				 endPage = startPage + pageLimit -1;
				 if(endPage> maxPage) {
						endPage = maxPage;
					}
				 PageInfo pi = null;
				 //만들어진 애들 페이징바 처리
				 pi =  new PageInfo(listCount, currentPage, pageLimit, boardLimit,maxPage, startPage,endPage);
				
				 
			 
			 
		 
				ArrayList<adOneDayClass> Readylist = new adOneDayService().adOnedayReadyList();
				
		 
		 
			HttpSession session = request.getSession();
			session.setAttribute("oneclasspi", pi);
			session.setAttribute("oneselect", select);
			session.setAttribute("oneclasscount", Readylist.size());
	
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/adOneDayClass/adminOneDayClassListView.jsp?cpgae=1").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
