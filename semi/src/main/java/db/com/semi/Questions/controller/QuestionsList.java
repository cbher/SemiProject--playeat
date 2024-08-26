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
		//page��
		
		int listCount = 0; 		 // ���� �� �Խñ��� ����
		int currentPage;	 // ���� ������(��, ����ڰ� ��û�� ������)
		int pageLimit ; 	 // ������ �ϴܿ� ������ ���������� ������ �ִ밹��(� �����ΰ�?)
		int boardLimit; 	 // �� ������ ���� ������ �Խñ� �ִ� ����(� ������ �����ٰ��ΰ�
		
		
		int maxPage; 		 // ���� ������������(�� ������ ��)
		int startPage; 	     // �ش� ����¡���� ���ۼ�
		int endPage;	     // �ش� ����¡���� ����
		
		//* listCount : �� ���ñ� ���� ���� ���ؾ��Ѵ� 
		
		 //* currentPage : ���������� (��,����ڰ� ��û�� ������)
//		cpage�� ���� ������ �޾ƿ;���
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
		 
//		 * startPage :  ����¡���� ���ۼ�
		 //���� ���������� 1~10���� �������Ұ�� �ִ°��� 10������ ����Ѵ� ġ�� 10������ -1�ؼ� 9�� �װ� 10���� ������ 0.9 int�� ����ó������ 0�̵ǰ� �ű⿡ 10 �ٽ� ���ϸ� 0 ������ +1����
		 startPage = (currentPage-1)/ pageLimit *pageLimit+1;
		 //�������������� ����������+�ִ�� ���̴������� -1 �״ϱ� ù �������� 10�� ���ϰ� -1 ���� 10�������� ������ ��������
		 endPage = startPage + pageLimit -1;

		 PageInfo pi = null;
//				 new PageInfo(listCount, currentPage, pageLimit, boardLimit,maxPage, startPage,endPage);
	

		
		
		//�ϴ� �ΰ� �غ����ش�
		 ArrayList<Questions> list =null;
		
		
		
		
		
		
		
		//�Ϲ�list��
		 // �޾ƿ� ��ϰ�(all,clear , ready3��
		String listview = request.getParameter("selectqe");
		//default ���� �ִ°� �ƴϴ� �⺻�� null�� ���ֱ�
		HttpSession session = request.getSession();
		session.setAttribute("adminQuestionslistview", listview);
		
		
		//����ȭ�鿡 �������� ��
		ArrayList<Questions> Readylist =  new QuestionsService().QuestionsReadyList();


		
		if(listview == null) {
		list =  new QuestionsService().QuestionsList();

		}
		//���� ���𰡸� ���ٸ�?
		else {
			
			
		switch(listview) {
			// all�ϋ�
		case "all" :
			//list�� �޾ƿ���
			list =  new QuestionsService().QuestionsList();
		 
			
			
			break;
			//ready�϶�
		case "ready" :
			list =  new QuestionsService().QuestionsReadyList();
		
			
		
			break;
		case "clear" :	
		
		
			
			list =  new QuestionsService().QuestionsClearList();
			
	
			break;
		default: 
			System.out.println("���������� Ȯ���ϰ�����ϴ� ���ǻ��׸���Ʈ����");
			break;
		}//switch�� ����
		
		}//if�� ����
		
		//�� �����  �� ��Ҷ�� listCount�� �޼ҵ� ȣ���� ���� ���ؿ�����
		//��������δ� list�� ���ڰ� listCount�̹Ƿ� list.size�� ���� ���ؿԴ�
		listCount = list.size(); 
		//endpage �� max���������� Ŭ�� max ������ ���������ֱ�
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		if(endPage> maxPage) {
			endPage = maxPage;
		}
		//list�� ���� �� �Ѱ��ֱ�
		request.setAttribute("list", list);
		
		//���ݱ��� ���� ����¡�ٿ� �ʿ��� �� pi�� �־��ֱ�
		pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit,maxPage, startPage,endPage);
	
		//pi�� �Ѱ��ֱ�
		request.setAttribute("pi", pi);
		session.setAttribute("adminQuestionslistpi", pi);
		
		session.setAttribute("Readylistcount", Readylist.size());
		//ȣ��� �����صа� �Ѱ��ֱ�
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
