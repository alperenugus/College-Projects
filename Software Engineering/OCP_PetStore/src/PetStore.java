import java.util.ArrayList;

public class PetStore {
	public ArrayList<Pet> pets = new ArrayList<Pet>();
	
	public void sounds() {
		for (Pet pet : pets) {
			pet.sounds();
		}	
	}
	
	public void treats() {
		for (Pet pet : pets) {
			pet.treats();
		}
	}
	
	public void fun() {
		for (Pet pet : pets) {
			pet.fun();			
		}		
	}

	public static void main(String[] args) {
		
	}

}
