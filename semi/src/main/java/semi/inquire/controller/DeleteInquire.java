package semi.inquire.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.inquire.model.service.InquireService;

/**
 * Servlet implementation class DeleteInquire
 */
@WebServlet("/delete.inq")
public class DeleteInquire extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteInquire() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int inquireNo = Integer.parseInt(request.getParameter("num")); 
		
		int result = new InquireService().deleteInquire(inquireNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "문의사항 삭제 성공");
			request.getRequestDispatcher("/iqList.ip?cpage=1").forward(request, response);
			
		}else {
			request.getSession().setAttribute("errorPage", "문의글 삭제 실패");
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
