package tt.pageModel;

import java.util.HashMap;

public class Privilege implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7335957993652460136L;

	private Integer pID; // 权限id

	private HashMap<Integer, String> privilages = new HashMap<Integer, String>();

	private Integer id; // 权限值
	private String text; // 权限内容

	private String pValues;
	private String pNames;

	public String getpValues() {
		return pValues;
	}

	public void setpValues(String pValues) {
		this.pValues = pValues;
	}

	public String getpNames() {
		return pNames;
	}

	public void setpNames(String pNames) {
		this.pNames = pNames;
	}

	public HashMap<Integer, String> getPrivilages() {
		return privilages;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public void setPrivilages(HashMap<Integer, String> privilages) {
		this.privilages = privilages;
	}

	public Integer getpID() {
		return pID;
	}

	public void setpID(Integer pID) {
		this.pID = pID;
	}

}
