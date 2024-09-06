package semi.ranking.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.ranking.model.service.RankingService;
import semi.ranking.model.vo.Ranking;

/**
 * Servlet implementation class RankingSelectContoller
 */
@WebServlet("/rankingSelect.rk")
public class RankingSelectContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RankingSelectContoller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			ArrayList<Ranking> list = new RankingService().selectTop3();
	        request.setAttribute("list", list);

	        RequestDispatcher view = request.getRequestDispatcher("views/ranking/RankingMain.jsp");
	        view.forward(request, response);
	        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
