public abstract class Person {
	private String myName;
	private String occupation;
	
	public Person(String name, String job) {
		myName = name;
		occupation = job;
	}
	public void askName() {
		System.out.println("What is your name?");
	};
	public void giveName() {
		System.out.println("My name is " + myName);
	};
	public void whatDoYouDo() {
		System.out.println("I am a " + occupation);
	};
	public abstract void askQuestion();
	public abstract void answerQuestion();
	
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	
	
}
