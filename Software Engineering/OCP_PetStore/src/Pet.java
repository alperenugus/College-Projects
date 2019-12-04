
public abstract class Pet {
	public String petName;
	
	public Pet(String petName) {
		this.petName = petName;
	}
	
	public abstract void sounds();
	public abstract void treats();
	public abstract void fun();
}
