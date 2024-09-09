package semi.mypage.editProfile.model.vo;

public class EditProfile {
	
	private String introduce;
	private String nickname;
	private String filepath;
	private String filename;
	
	
	public EditProfile() {}


	public EditProfile(String introduce, String nickname, String filepath, String filename) {
		super();
		this.introduce = introduce;
		this.nickname = nickname;
		this.filepath = filepath;
		this.filename = filename;
	}
	
	

	public EditProfile(String introduce, String nickname) {
		super();
		this.introduce = introduce;
		this.nickname = nickname;
	}


	public String getIntroduce() {
		return introduce;
	}


	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getFilepath() {
		return filepath;
	}


	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}


	public String getFilename() {
		return filename;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}


	@Override
	public String toString() {
		return "EditProfile [introduce=" + introduce + ", nickname=" + nickname + ", filepath=" + filepath
				+ ", filename=" + filename + "]";
	}

	

}