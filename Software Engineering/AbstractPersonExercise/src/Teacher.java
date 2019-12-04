
public class Teacher extends Person {
	private final int ARRAY_SIZE = 10;
	private static int questionNum = 0;
	private String[] questions = new String[ARRAY_SIZE];
	private String[] answers = new String[ARRAY_SIZE];

	public Teacher(String name, String job) {
		super(name, job);
		for(int i = 0; i < answers.length; i++) {
			questions[i] = "What were you doing when you were " + i + " years old?";
			answers[i] = "I have " + i + " year(s) experience of teaching! That's enough.";
		}
	}

	@Override
	public void askQuestion() {
		System.out.println(questions[questionNum]);
		
	}

	@Override
	public void answerQuestion() {
		if(questionNum % 2 == 0) {
			System.out.println("Oh, not yet! I am a teacher and have raised " + questionNum + " children until now.");
			System.out.println("This country needs lots of educated brains!!!");
		}
		else {
			System.out.println("Of course yes! " + answers[questionNum]);
		}
		
		questionNum++; 
		
	}
	
	@Override
	public void whatDoYouDo() {
		int childrenNum = questionNum + 1000;
		System.out.println("I am a teacher and I have raised " + childrenNum + " children until now!");
	}
	

}
