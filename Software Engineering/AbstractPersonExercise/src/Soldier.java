
public class Soldier extends Person {
	
	public Soldier(String name, String job) {
		super(name, job);
	}

	@Override
	public void askQuestion() {
		System.out.println("Would you die for your country?");
		
	}

	@Override
	public void answerQuestion() {
		System.out.println("I would do whatever my job requires me to do!");
		for(int i = 0; i < 3; i++) homeland();
		
	}
	
	@Override
	public void whatDoYouDo() {
		System.out.println("I am a soldier and I always defend my country!");
	}
	
	public void homeland() {
		System.out.println("Service with Pride!");
	}

}
