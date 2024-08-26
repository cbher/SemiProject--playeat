package db.com.semi.adminPlace.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.com.semi.adminPlace.model.service.adPlaceService;
import db.com.semi.adminPlace.model.vo.Place;
import db.com.semi.common.model.vo.PageInfo;

/**
 * Servlet implementation class Placelist
 */
@WebServlet("/adPlace.pl")
public class Placelist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Placelist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//받아온 select값이 ps
		String select = null;
		//받아올 list
		ArrayList<Place> list = null;
		//받아온 값이 없으면 기본값 all로 준비
		if(request.getParameter("select")==null) {
			select = "all";
		}else {
		 select = request.getParameter("select");
		}
		
		//검색용 카드 가져오자
		String Pname = request.getParameter("Pname");
		if(Pname==null) {
			Pname = "";
		}
		
		
		//있을경우 3종류로 나눠서 준비
		switch(select) {
		case "all" : 
			//올은 그냥 서치랑 같다 생각하면된다
			list = new adPlaceService().adPlaceList(Pname);
			break;
		case "rest" : 
			//rest의 경우 식당인 애들
			list = new adPlaceService().adPlaceRestList(Pname);
			break;
		case "place" :
			//place의 경우 놀거리
			list = new adPlaceService().adPlacePlayList(Pname);
			break;
		}
		
		//페이징 처리용
		//페이지값 받아오기
		
		
		
		int listCount = list.size(); 		 // 현재 총 게시글의 개수
		
		int currentPage ;	 // 현재 페이지(즉, 사용자가 요청한 페이지)
		if(request.getParameter("cpage") == null) {
			currentPage = 1 ;
		}else {
			currentPage = Integer.parseInt(request.getParameter("cpage"));
		}
		
		
		int pageLimit ; 	 // 페이지 하단에 보여질 페이지바의 페이지 최대갯수(몇개 단위인가?)
		int boardLimit; 	 // 한 페이지 내에 보여질 게시글 최대 갯수(몇개 단위씩 보여줄것인가
		
		int maxPage; 		 // 가장 마지막페이지(총 페이지 수)
		int startPage; 	     // 해당 페이징바의 시작수
		int endPage ;	     // 해당 페이징바의 끝수
		
		 pageLimit = 10;
		 
		 //*boardLimit : 게시글 최대 개수(단위)
		 boardLimit = 10;
		 
//		 * startPage :  페이징바의 시작수
		 //내가 한페이지에 1~10까지 보려고할경우 있는거임 10단위로 계산한다 치면 10번에서 -1해서 9번 그걸 10으로 나누면 0.9 int는 버림처리여서 0이되고 거기에 10 다시 곱하면 0 마지막 +1까지
		 startPage = (currentPage-1)/ pageLimit *pageLimit+1;
		 //마지막페이지는 시작페이지+최대로 보이는페이지 -1 그니까 첫 페이지에 10을 더하고 -1 빼면 10페이지가 끝으로 나오잖음
		 endPage = startPage + pageLimit -1;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		if(endPage> maxPage) {
			endPage = maxPage;
		}
		
		//지금까지 구한 페이징바에 필요한 값 pi로 넣어주기
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit,maxPage, startPage,endPage);
	
		//pi도 넘겨주기
		HttpSession session =  request.getSession();
		
		session.setAttribute("adPlacepi", pi);
		
		request.setAttribute("search", Pname);
		request.setAttribute("select", select);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/adminPlace/adminPlaceListView.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
