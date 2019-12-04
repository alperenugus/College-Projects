
public class Cat extends Pet{

	public Cat(String petName) {
		super(petName);
		
	}
	
	public void sounds() {
		System.out.println("Meow");
	}
	
	public void treats() {
		System.out.println("Give " + petName + " some catnip");
	}
	
	public void fun() {
		System.out.println("Watch " + petName + " sleep");
	}

}
