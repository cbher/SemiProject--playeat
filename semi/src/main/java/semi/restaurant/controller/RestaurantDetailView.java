package semi.restaurant.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.Review.model.service.ReviewService;
import semi.Review.model.vo.Review;
import semi.cooking.model.vo.Attachment;
import semi.oneday.model.service.OnedayService;
import semi.play.model.service.PlayService;
import semi.play.model.vo.Play;
import semi.restaurant.model.service.RestaurantService;
import semi.restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class RestaurantDetailView
 */
@WebServlet("/restaurantDetail.pl")
public class RestaurantDetailView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestaurantDetailView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int placeNo = Integer.parseInt(request.getParameter("placeNo"));
		Restaurant restaurant = new RestaurantService().selectRestaurant(placeNo);
        Play p = new PlayService().selectDetailPlay(placeNo);
        ArrayList<Review> r = new ReviewService().ReviewList(placeNo);
		ArrayList<Attachment> list = new PlayService().selectAttachmentList(placeNo);
		ArrayList<Play> recentRestaurant = new ReviewService().recentRestaurant(placeNo);
		
		
			
		if(p != null) {
			request.setAttribute("p", p);
			request.setAttribute("list", list);
			request.setAttribute("recentRestaurant", recentRestaurant);
			request.setAttribute("restaurant", restaurant);
			request.setAttribute("r", r);
			request.getRequestDispatcher("/views/restaurant/restaurantDetailView.jsp").forward(request, response);
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
