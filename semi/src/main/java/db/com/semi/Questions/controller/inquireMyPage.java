package db.com.semi.Questions.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.com.semi.Questions.model.service.QuestionsService;
import db.com.semi.Questions.model.vo.Attatment;
import db.com.semi.Questions.model.vo.Questions;
import semi.cooking.model.vo.Attachment;

/**
 * Servlet implementation class QuestionsDetail
 */
@WebServlet("/inquire.vo")
public class inquireMyPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inquireMyPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qno = Integer.parseInt(request.getParameter("qno"));
		//�� �ϴ� ��ȣ�� �޾ƿ°� Ȯ���ϱ�
//		
		//Ȯ�� �Ϸ������� �����Ϻ信 �޾ƿ;���?
		Questions detailview = new QuestionsService().QuestionDetail(qno);
		ArrayList<Attatment> at = new QuestionsService().QuestionAt(qno);
		
		
		request.setAttribute("at", at);
		request.setAttribute("detailview", detailview);
	
		request.getRequestDispatcher("/views/adminQuestions/inquireMyPageDetailView.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
