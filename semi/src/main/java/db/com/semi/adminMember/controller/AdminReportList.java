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
		
		int listCount = list.size(); 		 // ���� �� �Խñ��� ����  //������ �޾ƿ��� �װ� LISTī��p��
		if(request.getParameter("cpage") == null) {
			currentPage = 1;
		}else {
		 currentPage = Integer.parseInt(request.getParameter("cpage")) ;	 // ���� ������(��, ����ڰ� ��û�� ������) ���� �������� CPAGE�� �޾ƿ������̴� ���޾ƿð�� ���� �� intger�� ��ȯ�������
		}
	
		
		int pageLimit = 10 ; 	 // ������ �ϴܿ� ������ ���������� ������ �ִ밹��(� �����ΰ�?)
		int boardLimit = 10; 	 // �� ������ ���� ������ �Խñ� �ִ� ����(� ������ �����ٰ��ΰ�
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit); 		 // ���� ������������(�� ������ ��)
	int	 startPage = (currentPage-1)/ pageLimit *pageLimit+1;
	int	 endPage = startPage + pageLimit -1  ;  // �ش� ����¡���� ����
	 if(endPage> maxPage) {
			endPage = maxPage;
		}
	 PageInfo pi = null;
	 //������� �ֵ� ����¡�� ó��
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
