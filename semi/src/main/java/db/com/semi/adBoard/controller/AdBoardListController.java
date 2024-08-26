package db.com.semi.adBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.com.semi.adBoard.model.service.AdBoardService;
import db.com.semi.adBoard.model.vo.AdBoard;
import db.com.semi.common.model.vo.PageInfo;

/**
 * Servlet implementation class AdBoardListController
 */
@WebServlet("/adBoard.bl")
public class AdBoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdBoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		 ArrayList<AdBoard> list = null;
		 String select = null;
		 if(request.getParameter("select")== null) {
	
			select = "all";
		 }else {
			 switch(request.getParameter("select")) {
			 case "all" :
				 select = "all";
			
				 break;
			 case "cook" :
				 select = "cook";
			
				 break;
			 case "honor" :
				 select = "honor";
				 break;
			 }
		 }
		
		 list =  new AdBoardService().AdBoardList(select);
		
		

		
		//����¡ ó����
		int listCount = list.size(); 		 // ���� �� �Խñ��� ����
		int currentPage ;	 // ���� ������(��, ����ڰ� ��û�� ������)
	
		
		int pageLimit ; 	 // ������ �ϴܿ� ������ ���������� ������ �ִ밹��(� �����ΰ�?)
		int boardLimit; 	 // �� ������ ���� ������ �Խñ� �ִ� ����(� ������ �����ٰ��ΰ�
		
		int maxPage; 		 // ���� ������������(�� ������ ��)
		int startPage; 	     // �ش� ����¡���� ���ۼ�
		int endPage ;	     // �ش� ����¡���� ����
		//������ cpage �⺻���� 1��
		if(request.getParameter("cpage")==null){
			 currentPage=1;
		}
		else{
		 currentPage = Integer.parseInt(request.getParameter("cpage"));
		}
		 //*pageLimit : ����¡���� ������ �ִ� ����(����)
		 pageLimit = 10;
		 
		 //*boardLimit : �Խñ� �ִ� ����(����)
		 boardLimit = 10;
		
		 maxPage = (int)Math.ceil((double)listCount / boardLimit);
		 startPage = (currentPage-1)/ pageLimit *pageLimit+1;
		 endPage = startPage + pageLimit -1;
		 if(endPage> maxPage) {
				endPage = maxPage;
			}
		 PageInfo pi = null;
		 //������� �ֵ� ����¡�� ó��
		 pi =  new PageInfo(listCount, currentPage, pageLimit, boardLimit,maxPage, startPage,endPage);
		
		
		
		 HttpSession session = request.getSession();
		 session.setAttribute("AdNoticepi", pi);
		 session.setAttribute("adBoardlistView", select);
		 
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/adminBoard/adminBoardListView.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
