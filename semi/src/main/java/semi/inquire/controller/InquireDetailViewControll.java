package semi.inquire.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.inquire.model.service.InquireService;
import semi.inquire.model.vo.Inquire;
import semi.notice.model.vo.Attechment;

/**
 * Servlet implementation class InquireDetailViewControll
 */
@WebServlet("/iqdetail.inq")
public class InquireDetailViewControll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquireDetailViewControll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int InquireNo = Integer.parseInt(request.getParameter("num"));
		
		InquireService iService = new InquireService();
		
	
		if(InquireNo > 0) {
			
			Inquire inq = new InquireService().detailViewInq(InquireNo);
			ArrayList<Attechment> list = iService.selectAttechment(InquireNo);
			
			request.setAttribute("Inquire", inq);
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/inquire/InquireDetailViewPage.jsp").forward(request, response);
			
			
			
		} else {
			request.setAttribute("alertMsg", "상세페이지 접속실패");
			response.sendRedirect(request.getContextPath()+"/iqList.ip?cpage=1");
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
