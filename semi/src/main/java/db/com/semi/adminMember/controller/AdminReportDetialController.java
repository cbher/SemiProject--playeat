package db.com.semi.adminMember.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.com.semi.adminMember.model.service.AdMemberService;
import db.com.semi.adminMember.model.vo.AdReport;
import db.com.semi.adminMember.model.vo.oneComment;
import db.com.semi.adminMember.model.vo.review;

/**
 * Servlet implementation class AdminReportDetialController
 */
@WebServlet("/Detail.re")
public class AdminReportDetialController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReportDetialController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	int Rno = Integer.parseInt(request.getParameter("Rno"));
	review rlist = null;
	oneComment olist = null;
	AdReport list = new AdMemberService().adReportDetail(Rno);
		
	if(list!=null && list.getReview_no()>0) {
			int reno = list.getReview_no();
		 rlist = new AdMemberService().adreportReview(reno);
			
		}
		
		if(list!=null && list.getoComNo() >0) {
			int ono = list.getoComNo();
			 olist = new AdMemberService().adreportoneComment(ono);
		}
		

	request.setAttribute("rlist", rlist);
	request.setAttribute("olist", olist);
	request.setAttribute("list", list);
	
	request.getRequestDispatcher("/views/adminMember/adminReportDetailView.jsp").forward(request, response);;
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
