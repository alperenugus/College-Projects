
public class Liar extends Person {

	private String sex;
	private String question = new String("Do you always say the truth?");
	private String[] answers = new String[] {"Plumber" , "Computer Scientist", "Taxi Driver" , "Teacher" , "Dreamer" , "Artist" , "Soldier"};

	public Liar(String name, String job, String sex) {
		super(name, job);
		this.sex = sex;
	}

	@Override
	public void askQuestion() {
		System.out.println(question);

	}

	@Override
	public void answerQuestion() {
		if(sex == "male") {
			int random = (int) ((Math.random() * ( answers.length- 0 )) + 0);
			super.setOccupation(answers[random]);
			System.out.println("I am a female and I was a(n) " + answers[random] + ".");
		}
		else {
			int random = (int) ((Math.random() * ( answers.length- 0 )) + 0);
			System.out.println("I am a male and I was a(n) " + super.getOccupation() + ".");
		}
	}
	
	@Override
	public void whatDoYouDo() {
		System.out.println("I am breathing.");
		System.out.println("Hahahaha, lol! It was just a joke. I am just a(n) " + super.getOccupation() + '.');
	}

}
