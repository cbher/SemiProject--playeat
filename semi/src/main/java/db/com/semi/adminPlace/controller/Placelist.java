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
		//�޾ƿ� select���� ps
		String select = null;
		//�޾ƿ� list
		ArrayList<Place> list = null;
		//�޾ƿ� ���� ������ �⺻�� all�� �غ�
		if(request.getParameter("select")==null) {
			select = "all";
		}else {
		 select = request.getParameter("select");
		}
		
		//�˻��� ī�� ��������
		String Pname = request.getParameter("Pname");
		if(Pname==null) {
			Pname = "";
		}
		
		
		//������� 3������ ������ �غ�
		switch(select) {
		case "all" : 
			//���� �׳� ��ġ�� ���� �����ϸ�ȴ�
			list = new adPlaceService().adPlaceList(Pname);
			break;
		case "rest" : 
			//rest�� ��� �Ĵ��� �ֵ�
			list = new adPlaceService().adPlaceRestList(Pname);
			break;
		case "place" :
			//place�� ��� ��Ÿ�
			list = new adPlaceService().adPlacePlayList(Pname);
			break;
		}
		
		//����¡ ó����
		//�������� �޾ƿ���
		
		
		
		int listCount = list.size(); 		 // ���� �� �Խñ��� ����
		
		int currentPage ;	 // ���� ������(��, ����ڰ� ��û�� ������)
		if(request.getParameter("cpage") == null) {
			currentPage = 1 ;
		}else {
			currentPage = Integer.parseInt(request.getParameter("cpage"));
		}
		
		
		int pageLimit ; 	 // ������ �ϴܿ� ������ ���������� ������ �ִ밹��(� �����ΰ�?)
		int boardLimit; 	 // �� ������ ���� ������ �Խñ� �ִ� ����(� ������ �����ٰ��ΰ�
		
		int maxPage; 		 // ���� ������������(�� ������ ��)
		int startPage; 	     // �ش� ����¡���� ���ۼ�
		int endPage ;	     // �ش� ����¡���� ����
		
		 pageLimit = 10;
		 
		 //*boardLimit : �Խñ� �ִ� ����(����)
		 boardLimit = 10;
		 
//		 * startPage :  ����¡���� ���ۼ�
		 //���� ���������� 1~10���� �������Ұ�� �ִ°��� 10������ ����Ѵ� ġ�� 10������ -1�ؼ� 9�� �װ� 10���� ������ 0.9 int�� ����ó������ 0�̵ǰ� �ű⿡ 10 �ٽ� ���ϸ� 0 ������ +1����
		 startPage = (currentPage-1)/ pageLimit *pageLimit+1;
		 //�������������� ����������+�ִ�� ���̴������� -1 �״ϱ� ù �������� 10�� ���ϰ� -1 ���� 10�������� ������ ��������
		 endPage = startPage + pageLimit -1;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		if(endPage> maxPage) {
			endPage = maxPage;
		}
		
		//���ݱ��� ���� ����¡�ٿ� �ʿ��� �� pi�� �־��ֱ�
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit,maxPage, startPage,endPage);
	
		//pi�� �Ѱ��ֱ�
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
