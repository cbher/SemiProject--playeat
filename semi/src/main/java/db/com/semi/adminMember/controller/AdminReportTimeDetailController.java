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
			session.setAttribute("adAlertMsg", "관리자의 정지는 불가능합니다");

		}else {
		
		//벤시간구하기
		double penaltytime = 0;
		double penaltyday = 0;
		//벤할시간
		if(request.getParameter("penaltytime") != "") {
		 penaltytime = Double.parseDouble(request.getParameter("penaltytime"));
		}
		//보여주기용 int식
		int time = (int)penaltytime;
		//벤할날짜
		if(request.getParameter("penaltyday") != "") {
			penaltyday = Double.parseDouble(request.getParameter("penaltyday"));
		}
		int day = (int)penaltyday;
		//밀리세컨초 해서 1시간은 약 3600000이니 날짜*24해서 더한값을 곱해준다
		int bentime = (int)(((penaltyday*24)+ penaltytime) *3600000);
		
		//일단 벤부터 하고오기
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
        timer.schedule(task, bentime); // 3600000 밀리초 = 1시간
		
		
	
		if(bentime >0) {
		session.setAttribute("adAlertMsg", userName+"님이"+day+"일"+time+"시간동안 정지되었습니다");
		}else{
			session.setAttribute("adAlertMsg", userName+"님의 정지가 해제되었습니다");
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
