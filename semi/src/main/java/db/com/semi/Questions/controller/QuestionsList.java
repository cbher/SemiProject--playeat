package db.com.semi.Questions.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.com.semi.Questions.model.service.QuestionsService;
import db.com.semi.Questions.model.vo.Questions;
import db.com.semi.common.model.vo.PageInfo;

/**
 * Servlet implementation class QuestionsList
 */
@WebServlet("/Questions.qe")
public class QuestionsList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionsList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//page값
		
		int listCount = 0; 		 // 현재 총 게시글의 개수
		int currentPage;	 // 현재 페이지(즉, 사용자가 요청한 페이지)
		int pageLimit ; 	 // 페이지 하단에 보여질 페이지바의 페이지 최대갯수(몇개 단위인가?)
		int boardLimit; 	 // 한 페이지 내에 보여질 게시글 최대 갯수(몇개 단위씩 보여줄것인가
		
		
		int maxPage; 		 // 가장 마지막페이지(총 페이지 수)
		int startPage; 	     // 해당 페이징바의 시작수
		int endPage;	     // 해당 페이징바의 끝수
		
		//* listCount : 총 개시글 갯수 부터 구해야한다 
		
		 //* currentPage : 현재페이지 (즉,사용자가 요청한 페이지)
//		cpage로 현재 페이지 받아와야함
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
		 
//		 * startPage :  페이징바의 시작수
		 //내가 한페이지에 1~10까지 보려고할경우 있는거임 10단위로 계산한다 치면 10번에서 -1해서 9번 그걸 10으로 나누면 0.9 int는 버림처리여서 0이되고 거기에 10 다시 곱하면 0 마지막 +1까지
		 startPage = (currentPage-1)/ pageLimit *pageLimit+1;
		 //마지막페이지는 시작페이지+최대로 보이는페이지 -1 그니까 첫 페이지에 10을 더하고 -1 빼면 10페이지가 끝으로 나오잖음
		 endPage = startPage + pageLimit -1;

		 PageInfo pi = null;
//				 new PageInfo(listCount, currentPage, pageLimit, boardLimit,maxPage, startPage,endPage);
	

		
		
		//일단 널값 준비해준다
		 ArrayList<Questions> list =null;
		
		
		
		
		
		
		
		//일반list갑
		 // 받아온 목록값(all,clear , ready3개
		String listview = request.getParameter("selectqe");
		//default 값이 있는건 아니니 기본값 null로 해주기
		HttpSession session = request.getSession();
		session.setAttribute("adminQuestionslistview", listview);
		
		
		//메인화면에 쓰기위한 값
		ArrayList<Questions> Readylist =  new QuestionsService().QuestionsReadyList();


		
		if(listview == null) {
		list =  new QuestionsService().QuestionsList();

		}
		//만약 무언가를 고른다면?
		else {
			
			
		switch(listview) {
			// all일떄
		case "all" :
			//list값 받아오기
			list =  new QuestionsService().QuestionsList();
		 
			
			
			break;
			//ready일때
		case "ready" :
			list =  new QuestionsService().QuestionsReadyList();
		
			
		
			break;
		case "clear" :	
		
		
			
			list =  new QuestionsService().QuestionsClearList();
			
	
			break;
		default: 
			System.out.println("오류페이지 확인하고오자일단 문의사항리스트뷰임");
			break;
		}//switch문 종료
		
		}//if문 종료
		
		//다 종료된  뒤 평소라면 listCount는 메소드 호출을 통해 구해오지만
		//결과적으로는 list의 숫자가 listCount이므로 list.size를 통해 구해왔다
		listCount = list.size(); 
		//endpage 가 max페이지보다 클때 max 페이지 증가시켜주기
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		if(endPage> maxPage) {
			endPage = maxPage;
		}
		//list를 통해 값 넘겨주기
		request.setAttribute("list", list);
		
		//지금까지 구한 페이징바에 필요한 값 pi로 넣어주기
		pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit,maxPage, startPage,endPage);
	
		//pi도 넘겨주기
		request.setAttribute("pi", pi);
		session.setAttribute("adminQuestionslistpi", pi);
		
		session.setAttribute("Readylistcount", Readylist.size());
		//호출로 세팅해둔거 넘겨주기
		request.getRequestDispatcher("views/adminQuestions/adminQuestionsMainMenu.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
