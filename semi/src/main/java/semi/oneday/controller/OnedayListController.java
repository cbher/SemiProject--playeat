package semi.oneday.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.common.PageInfo;
import semi.oneday.model.service.OnedayService;
import semi.oneday.model.vo.Oneday;

/**
 * Servlet implementation class OnedayListController
 */
@WebServlet("/onedayMain.on")
public class OnedayListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OnedayListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount;			
		int currentPage;		
		int pageLimit;			
		int boardLimit;			
		
		int maxPage;			
		int startPage;			
		int endPage;			
		
		listCount = new OnedayService().selectListCount();
		
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
		
		
		ArrayList<Oneday> list = new OnedayService().selectOnedayList(pi);
		ArrayList<Oneday> popularList = new OnedayService().selectPopulrList();
		
		if(list != null) {
			
			request.setAttribute("pi", pi);
			request.setAttribute("popularList", popularList);
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/oneday/onedayListView.jsp").forward(request, response);
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
