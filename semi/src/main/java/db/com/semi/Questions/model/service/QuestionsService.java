package db.com.semi.Questions.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import db.com.semi.Questions.model.dao.QuestionsDao;
import db.com.semi.Questions.model.vo.Questions;

import static semi.common.JDBCtemplate.*;

public class QuestionsService {
	
	public ArrayList<Questions> QuestionsList() {
	
		
		Connection conn = getConnection();
	ArrayList<Questions> list = new QuestionsDao().QuestionsList(conn);
	close(conn);
	return list;
		
	}
	public ArrayList<Questions> QuestionsReadyList() {
	
		
		Connection conn = getConnection();
		
	ArrayList<Questions> list = new QuestionsDao().QuestionsReadyList(conn);
	close(conn);
	return list;
		
	}

	public ArrayList<Questions> QuestionsClearList() {
	
		
		Connection conn = getConnection();
	
	ArrayList<Questions> list = new QuestionsDao().QuestionsClearList(conn);
	close(conn);
	return list;
		
	}
	public Questions QuestionDetail(int qno) {
		Connection conn = getConnection();
		Questions list = new QuestionsDao().QuestionDetail(conn,qno);
		close(conn);
		return list;
	}
	public int QuestionsUpdate(int qno,String answer) {
		Connection conn = getConnection();
		int result = new QuestionsDao().QuestionsUpdate(conn,qno, answer);
		if(result >0 ) {
			commit(conn);
		}else{
			rollback(conn);
		}
		close(conn);
		return result; 
	}
}
