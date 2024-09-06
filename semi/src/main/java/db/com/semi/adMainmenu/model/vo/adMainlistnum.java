package db.com.semi.adMainmenu.model.vo;

public class adMainlistnum {
	
	public adMainlistnum() {}
	private int mainlistnum;
	public adMainlistnum(int mainlistnum) {
		super();
		this.mainlistnum = mainlistnum;
	}
	public int getMainlistnum() {
		return mainlistnum;
	}
	public void setMainlistnum(int mainlistnum) {
		this.mainlistnum = mainlistnum;
	}
	
	@Override
	public String toString() {
		return "adMainlistnum [mainlistnum=" + mainlistnum + "]";
	}
}
