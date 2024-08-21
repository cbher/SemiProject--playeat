package db.com.semi.adminMember.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.com.semi.adminMember.model.service.AdMemberService;
import db.com.semi.adminMember.model.vo.AdMember;

/**
 * Servlet implementation class adMemberlistDetail
 */
@WebServlet("/Detail.mo")
public class adMemberlistDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adMemberlistDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//상세검색용 번호 받아오기
		int Mno = Integer.parseInt(request.getParameter("Mno")); 
		//디테일을ㅇ ㅟ해 상세검색용 번호에서 검색해오기
		AdMember list = new AdMemberService().adMemberDetail(Mno);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/adminMember/adminMemberDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
