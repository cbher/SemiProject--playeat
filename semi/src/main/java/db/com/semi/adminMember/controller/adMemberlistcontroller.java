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
import db.com.semi.adminMember.model.vo.AdMember;
import db.com.semi.common.model.vo.PageInfo;

/**
 * Servlet implementation class MemberlistSort
 */
@WebServlet("/adMemberlist.ml")
public class adMemberlistcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adMemberlistcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String select = request.getParameter("select");
	//list 담아둘 arraylist 미리만들어두기
	ArrayList<AdMember> list = null;
	

	
	
	
	//기본은 값이 입력 안되어있으니 기본값으로 sortNo로 정렬되게 해두기
		if(select == null) {
			select = "sortNo";
		}
		//스위치문으로 ~~일때 나올 문장들
		switch(select) {
		//번호순정렬이면?
		case "sortNo" : 
			list = new AdMemberService().adMemberList();
			
			break;
		//가입일자순 정렬이면?
		case "sortDate" :
			list = new AdMemberService().adMemberDateList();
			break;
			//신고 누적순 정렬이면?
		case "sortReport" : 
			list = new AdMemberService().adMemberReportList();
			break;
		}
		
		//페이징 처리용
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
	
		HttpSession session = request.getSession();
		session.setAttribute("Memberpi", pi);
		session.setAttribute("select", select);
		session.setAttribute("adMemberlistCount", list.size());
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/adminMember/adminMemberListView.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
