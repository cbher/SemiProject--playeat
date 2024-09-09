package semi.mypage.mylist.model.service;


import static semi.common.JDBCtemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import semi.common.PageInfo;
import semi.mypage.mylist.model.dao.MyListDao;
import semi.mypage.mylist.model.vo.MyList;

public class MyListService {

    // 리스트 count
    public int selectMyListCount(int userNo) {
        Connection conn = getConnection();
       
        int listCount = new MyListDao().getMyListCount(conn, userNo);
      
        close(conn);
        return listCount;
    }


    
    
    // 리스트 조회 및 sort
    public ArrayList<MyList> selectMyListWithSorting(PageInfo pi, int userNo, String sortCriteria) {
        Connection conn = getConnection();
      
        ArrayList<MyList> list = new MyListDao().selectMyListWithSorting(conn, pi, userNo, sortCriteria);
       
        close(conn);
        return list;
    }

    // 카테고리 별 리스트 조회(카운트)
    public int selectMyListCountByCategory(int userNo, String category) {
        Connection conn = getConnection();
      
        int listCount = new MyListDao().getMyListCountByCategory(conn, userNo, category);
       
        close(conn);
        return listCount;
    }

    
    // 카테고리로 리스트 조회 +정렬
    public ArrayList<MyList> selectMyListByCategoryWithSorting(PageInfo pi, int userNo, String category, String sortCriteria) {
       
    	Connection conn = getConnection();
       
        ArrayList<MyList> list = new MyListDao().selectMyListByCategoryWithSorting(conn, pi, userNo, category, sortCriteria);
       
        close(conn);
        return list;
    }
	 
    //삭제기능
    public int deleteMyList(int likeNo) {
    	Connection conn = getConnection();
      
    	int result = new MyListDao().deleteMyList(conn, likeNo);
        
    	close(conn);
        return result;
    }
    
   
	
	
}
