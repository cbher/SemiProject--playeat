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
