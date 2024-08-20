package com.mypage.myOneComment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mypage.myInquire.model.service.InquireService;
import com.mypage.myInquire.model.vo.Inquire;

/**
 * Servlet implementation class myOneCommentController
 */
@WebServlet("/onecomment.1")
public class myOneCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myOneCommentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			 int userNo = 1; //일단 임시로 로그인했다고 넣은 값
		
             if(userNo != 0) { //로그인 되있을 경우 
			//MypageService r = new MypageService();
			//ArrayList<Review> List = r.selectList(userNo);
			//보내고,
        
			//InquireService i = new InquireService();
			//ArrayList<Inquire> list= i.inquireList(userNo);
			
			
        //request.setAttribute("inquireList", list);
        request.getRequestDispatcher("./views/mypage/oneComment.jsp").forward(request, response);
		}else { //로그인이 안된 경우. 로그인 페이지로 이동시켜야함
			   //나중에 추가
			
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
