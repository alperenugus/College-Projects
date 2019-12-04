import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;

// Changed it to RuntimeException and saw that there is no need to throws clauses.

// Custom exception.
public class NegativeBalanceException extends Exception {

	private double negativeBalance;
	
	// Exception constructor without parameter.
	public NegativeBalanceException() {
		super("Error: negative balance");
	}

	//Exception constructor with parameter.
	public NegativeBalanceException(double negativeBalance) {
		super("Amount exceeds balance by " + negativeBalance);
		this.negativeBalance = negativeBalance;
		
		try {
			PrintWriter printWriter = new PrintWriter(new File("logfile.txt"));
			printWriter.write("Amount exceeds balance by " + negativeBalance);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			System.out.println("There is a problem about file operations.");
		}
		
	}

	// Overriden toString method
	@Override
	public String toString() {
		return "Balance of " + negativeBalance + " not allowed";
	}
	
}
