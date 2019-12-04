import java.util.ArrayList;

public class Station {

	private String name;
	private int hiredNum = 0;
	private static int maxDetectiveNum = 5;
	private static int badgeNumber = 1;

	private Detective[] detectives = new Detective[maxDetectiveNum];

	public void addDetective(Detective detective) {
		int lastIndex = 0;
		for(int i=0; i< detectives.length; i++) {
			if(detectives[i] == null) {
				lastIndex = i;
				break;
			}
		}

		detectives[lastIndex] = detective;
	}

	public void printDetectives() {

		for(Detective detective : detectives) {
			System.out.println(detective.getName());
		}
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public static int getMaxDetectiveNum() {
		return maxDetectiveNum;
	}

	public static void setMaxDetectiveNum(int maxDetectiveNum) {
		Station.maxDetectiveNum = maxDetectiveNum;
	}

	public static int getBadgeNumber() {
		return badgeNumber;
	}

	public static void setBadgeNumber(int badgeNumber) {
		Station.badgeNumber = badgeNumber;
	}

	public Detective[] getDetectives() {
		return detectives;
	}

	public void setDetectives(Detective[] detectives) {
		this.detectives = detectives;
	}

	public int getHiredNum() {
		return hiredNum;
	}

	public void setHiredNum(int hiredNum) {
		this.hiredNum = hiredNum;
	}




}
