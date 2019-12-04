
public class Dog extends Pet{

	public Dog(String petName) {
		super(petName);
	}
	
	public void sounds() {
		System.out.println("Woof");
	}
	
	public void treats() {
		System.out.println("Give " + petName + " a bone");			
	}
	
	public void fun() {
		System.out.println("Throw a frisbee to " + petName);			
	}

}
