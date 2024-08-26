package db.com.semi.Questions.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.com.semi.Questions.model.service.QuestionsService;
import db.com.semi.Questions.model.vo.Questions;

/**
 * Servlet implementation class QuestionsDetail
 */
@WebServlet("/Detail.qo")
public class QuestionsDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionsDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qno = Integer.parseInt(request.getParameter("qno"));
		//�� �ϴ� ��ȣ�� �޾ƿ°� Ȯ���ϱ�
//		System.out.println(qno);
		//Ȯ�� �Ϸ������� �����Ϻ信 �޾ƿ;���?
		Questions detailview = new QuestionsService().QuestionDetail(qno);

		request.setAttribute("detailview", detailview);
		request.getRequestDispatcher("views/adminQuestions/adminQuestionsDetailView.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
