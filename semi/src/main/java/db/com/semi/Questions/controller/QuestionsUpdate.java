package db.com.semi.Questions.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.com.semi.Questions.model.service.QuestionsService;
import db.com.semi.Questions.model.vo.Questions;

/**
 * Servlet implementation class QuestionsUpdate
 */
@WebServlet("/Questions.Aw")
public class QuestionsUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionsUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//post�� �������ϱ� ��ȭ����
		request.setCharacterEncoding("utf-8");
		
		//���� �޾ƿ��� ����Ȯ��
	int qno = Integer.parseInt(request.getParameter("qno"));
	String answer = request.getParameter("answer");

	//���� �Ѱ��ֱ�
	int result = new QuestionsService().QuestionsUpdate(qno,answer);
	 ArrayList<Questions> list =  new QuestionsService().QuestionsList();
	 request.setAttribute("list", list);
	if(result>0) {
		request.getRequestDispatcher("/views/adminQuestions/adminQuestionsMainMenu.jsp").forward(request, response);
		}else{
	
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
