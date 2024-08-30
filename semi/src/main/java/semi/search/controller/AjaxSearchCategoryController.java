package semi.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semi.play.model.vo.Play;
import semi.search.model.service.SearchService;

/**
 * Servlet implementation class AjaxSearchCategoryController
 */
@WebServlet("/searchList.sl")
public class AjaxSearchCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSearchCategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int category = Integer.parseInt(request.getParameter("category"));
		ArrayList<Play> list = new SearchService().selectLocationList(category);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
