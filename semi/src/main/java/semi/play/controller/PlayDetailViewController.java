package semi.play.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.cooking.model.vo.Attachment;
import semi.play.model.service.PlayService;
import semi.play.model.vo.Play;

/**
 * Servlet implementation class PlayDetailViewController
 */
@WebServlet("/detail.pl")
public class PlayDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlayDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int placeNo = Integer.parseInt(request.getParameter("bno"));
		Play p = new PlayService().selectDetailPlay(placeNo);
		ArrayList<Attachment> list = new PlayService().selectAttachmentList(placeNo);
		ArrayList<Play> similarList = new PlayService().selectPlaySimilarList(p.getTemaCategory(), placeNo);
		if(p != null) {
			request.setAttribute("p", p);
			request.setAttribute("list", list);
			request.setAttribute("sList", similarList);
			request.getRequestDispatcher("views/play/playDetailView.jsp").forward(request, response);
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
