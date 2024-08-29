package semi.cooking.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.common.PageInfo;
import semi.cooking.model.service.CookingService;
import semi.cooking.model.vo.CookingBoard;

/**
 * Servlet implementation class CookingListController
 */
@WebServlet("/clist.co")
public class CookingListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CookingListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount;			// 현재 총 게시글 갯수
		int currentPage;		// 현재 페이지
		int pageLimit;			// 페이지 하단에 보여질 페이징 바의 페이지 최대 갯수
		int boardLimit;			// 한 페이지 내에 보여질 게시글 최대 갯수
		
		int maxPage;			// 가장 마지막 페이지
		int startPage;			// 페이징바의 시작수
		int endPage;			// 페이징바의 끝수
		
		listCount = new CookingService().selectListCount();
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		pageLimit = 10;
		
		boardLimit = 12;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<CookingBoard> list = new CookingService().selectCookingList(pi);
		ArrayList<CookingBoard> slideList = new CookingService().selectCookingSlideList();
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("slideList", slideList);
		request.getRequestDispatcher("views/cooking/cookingListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
