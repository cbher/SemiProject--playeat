package semi.mypage.mylist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.common.PageInfo;
import semi.member.model.vo.Member;
import semi.mypage.editProfile.model.service.EditProfileService;
import semi.mypage.editProfile.model.vo.EditProfile;
import semi.mypage.mylist.model.service.MyListService;
import semi.mypage.mylist.model.vo.MyList;

/**
 * Servlet implementation class MyListViewController
 */
@WebServlet("/mylist.mo")
public class MyListViewController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MyListViewController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int listCount;
        int currentPage;
        int pageLimit = 5;
        int boardLimit = 5;
        int maxPage;
        int startPage;
        int endPage;

        String cpage = request.getParameter("cpage");
        if (cpage == null) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(cpage);
        }

        HttpSession session = request.getSession();
        Member loginUser = (Member) session.getAttribute("loginUser");

        if (loginUser == null) {
            response.sendRedirect("views/member/MemberLogin.jsp");
            return;
        }

        int userNo = loginUser.getUserNo();
        String selectedCategory = request.getParameter("category");
        String sortCriteria = request.getParameter("sort");

        if (selectedCategory == null || selectedCategory.equals("all")) {
            listCount = new MyListService().selectMyListCount(userNo); // 전체
        } else {
            listCount = new MyListService().selectMyListCountByCategory(userNo, selectedCategory); // 카테고리 선택
        }

        maxPage = (int) Math.ceil((double) listCount / boardLimit);
        startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
        endPage = startPage + pageLimit - 1;

        if (endPage > maxPage) {
            endPage = maxPage;
        }

        PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
        ArrayList<MyList> list;

        if (selectedCategory == null || selectedCategory.equals("all")) {
            list = new MyListService().selectMyListWithSorting(pi, userNo, sortCriteria); // 전체 + 정렬
        } else {
            list = new MyListService().selectMyListByCategoryWithSorting(pi, userNo, selectedCategory, sortCriteria); // 카테고리 선택 + 정렬
        }
        
        /* 상단 프로필 구문*/ 
        ArrayList<EditProfile> profile = new EditProfileService().myProfile(userNo);
        
        
        request.setAttribute("list", list);
        request.setAttribute("selectedCategory", selectedCategory);
        request.setAttribute("sortCriteria", sortCriteria);
        request.setAttribute("pi", pi);
        request.getRequestDispatcher("./views/mypage/myList.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
