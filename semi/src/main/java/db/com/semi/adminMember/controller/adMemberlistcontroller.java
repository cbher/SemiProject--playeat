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
	//list ��Ƶ� arraylist �̸������α�
	ArrayList<AdMember> list = null;
	

	
	
	
	//�⺻�� ���� �Է� �ȵǾ������� �⺻������ sortNo�� ���ĵǰ� �صα�
		if(select == null) {
			select = "sortNo";
		}
		//����ġ������ ~~�϶� ���� �����
		switch(select) {
		//��ȣ�������̸�?
		case "sortNo" : 
			list = new AdMemberService().adMemberList();
			
			break;
		//�������ڼ� �����̸�?
		case "sortDate" :
			list = new AdMemberService().adMemberDateList();
			break;
			//�Ű� ������ �����̸�?
		case "sortReport" : 
			list = new AdMemberService().adMemberReportList();
			break;
		}
		
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
