package semi.mypage.myInquire.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static semi.common.JDBCtemplate.*;

import semi.common.PageInfo;
import semi.mypage.myInquire.model.dao.InquireDao;
import semi.mypage.myInquire.model.vo.Inquire;


public class InquireService {

	
    // 문의사항 개수(페이징용)
    public int selectInquireCount(int userNo) {
        Connection conn = getConnection();
        int listCount = new InquireDao().getInquireCount(conn, userNo);
        close(conn);
        
       return listCount;
    }

    // 문의사항 리스트 가져오기
    public ArrayList<Inquire> inquireList(PageInfo pi, int userNo) {
        Connection conn = getConnection();
        ArrayList<Inquire> list = new InquireDao().inquireList(conn, pi, userNo);
       
        close(conn);
        
        return list;
    }
}