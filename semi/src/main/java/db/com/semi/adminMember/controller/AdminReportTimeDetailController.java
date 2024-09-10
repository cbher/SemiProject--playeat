package db.com.semi.adminMember.controller;

import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.com.semi.adminMember.model.service.AdMemberService;

/**
 * Servlet implementation class AdminReportTimeController
 */
@WebServlet("/adReportList.dl")
public class AdminReportTimeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReportTimeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String userName = (request.getParameter("userName"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int reportNo = Integer.parseInt((request.getParameter("reportNo")));
	
		HttpSession session = request.getSession();
		if(userNo == 6) {
			session.setAttribute("adAlertMsg", "�������� ������ �Ұ����մϴ�");

		}else {
		
		//���ð����ϱ�
		double penaltytime = 0;
		double penaltyday = 0;
		//���ҽð�
		if(request.getParameter("penaltytime") != "") {
		 penaltytime = Double.parseDouble(request.getParameter("penaltytime"));
		}
		//�����ֱ�� int��
		int time = (int)penaltytime;
		//���ҳ�¥
		if(request.getParameter("penaltyday") != "") {
			penaltyday = Double.parseDouble(request.getParameter("penaltyday"));
		}
		int day = (int)penaltyday;
		//�и������� �ؼ� 1�ð��� �� 3600000�̴� ��¥*24�ؼ� ���Ѱ��� �����ش�
		int bentime = (int)(((penaltyday*24)+ penaltytime) *3600000);
		
		//�ϴ� ������ �ϰ����
		int Rno = Integer.parseInt(request.getParameter("Rno")) ;
	
	
		int result1 = new AdMemberService().adMemberbeen(userNo);
		 Timer timer = new Timer();
		
		 TimerTask task = new TimerTask() {
			
			@Override
			public void run() {
				int result2 = new AdMemberService().adMemberbeenOff(userNo);
				
			}
		};
		
			if(result1 == 1) {
				int result3 = new AdMemberService().adMemberreportbeen(reportNo);
			}
        timer.schedule(task, bentime); // 3600000 �и��� = 1�ð�
		
		
	
		if(bentime >0) {
		session.setAttribute("adAlertMsg", userName+"����"+day+"��"+time+"�ð����� �����Ǿ����ϴ�");
		}else{
			session.setAttribute("adAlertMsg", userName+"���� ������ �����Ǿ����ϴ�");
		}
		}
		response.sendRedirect(request.getContextPath()+"/adReportList.rl?cpage=1");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
