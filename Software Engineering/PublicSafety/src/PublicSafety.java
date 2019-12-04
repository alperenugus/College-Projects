import java.util.Scanner;

public class PublicSafety {
	
	private Station citySt = new Station();
	private Station univSt = new Station();


	public PublicSafety(String s1, String s2) {
		univSt.setName(s1);
		citySt.setName(s2);
	}
	
	public void doHire(boolean b) {
		Scanner scanner = new Scanner(System.in);
		
		if(b == true) {
			
			if(citySt.getHiredNum() < citySt.getMaxDetectiveNum()) {
				System.out.println("New hire for " + citySt.getName() + "..." + "Enter detective's name: ");
				String detectiveName = scanner.nextLine();
				Detective newDetective = new Detective(detectiveName, Station.getBadgeNumber());
				Station.setBadgeNumber(Station.getBadgeNumber() + 1);
				citySt.addDetective(newDetective);
				citySt.setHiredNum(citySt.getHiredNum() + 1);
			}
			else {
				System.out.println("Can't hire any more detectives for " + citySt.getName());
			}
			
			
		}
		
		else {
			
			if(univSt.getHiredNum() < univSt.getMaxDetectiveNum()) {
				System.out.println("New hire for" + univSt.getName() + "..." + "Enter detective's name: ");
				String detectiveName = scanner.nextLine();
				Detective newDetective = new Detective(detectiveName, Station.getBadgeNumber());
				Station.setBadgeNumber(Station.getBadgeNumber() + 1);
				univSt.addDetective(newDetective);
				univSt.setHiredNum(univSt.getHiredNum() + 1);
			}
			else {
				System.out.println("Can't hire any more detectives for " + univSt.getName());
			}
			
		}
		
		
	}
	
	public void printDetectiveLists() {
		System.out.println("List of Detectives for " + citySt.getName());
		
		for(Detective detective : citySt.getDetectives()) {
			if(detective == null) break;
			System.out.println("Detective [Badge=" + detective.getLastBadgeNum() + ", Name=" + detective.getName() + ']');
		}
		System.out.println("\n");
		
		System.out.println("List of Detectives for " + univSt.getName());
		for(Detective detective : univSt.getDetectives()) {
			if(detective == null) break;
			System.out.println("Detective [Badge=" + detective.getLastBadgeNum() + ", Name=" + detective.getName() + ']');
		}
		System.out.println("\n");
	}
	
}
