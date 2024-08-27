package semi.ranking.model.vo;

import java.sql.Date;

public class Ranking {
	private int cNO;
	private String cTitle;
	private String cContents;
	private Date date;
	private String status;
	private int cStar;
	private int count;
	private int userNo;
	private int cCategory;
	private String titleImg;
	private String nickName;
	
	public Ranking(int cNO, String cTitle, String cContents, Date date, String status, int cStar, int count, int userNo,
			int cCategory, String titleImg, String nickName) {
		super();
		this.cNO = cNO;
		this.cTitle = cTitle;
		this.cContents = cContents;
		this.date = date;
		this.status = status;
		this.cStar = cStar;
		this.count = count;
		this.userNo = userNo;
		this.cCategory = cCategory;
		this.titleImg = titleImg;
		this.nickName = nickName;
	}

	public int getcNO() {
		return cNO;
	}

	public void setcNO(int cNO) {
		this.cNO = cNO;
	}

	public String getcTitle() {
		return cTitle;
	}

	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}

	public String getcContents() {
		return cContents;
	}

	public void setcContents(String cContents) {
		this.cContents = cContents;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getcStar() {
		return cStar;
	}

	public void setcStar(int cStar) {
		this.cStar = cStar;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getcCategory() {
		return cCategory;
	}

	public void setcCategory(int cCategory) {
		this.cCategory = cCategory;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "Ranking [cNO=" + cNO + ", cTitle=" + cTitle + ", cContents=" + cContents + ", date=" + date
				+ ", status=" + status + ", cStar=" + cStar + ", count=" + count + ", userNo=" + userNo + ", cCategory="
				+ cCategory + ", titleImg=" + titleImg + ", nickName=" + nickName + "]";
	}
	
	
		
	
}
