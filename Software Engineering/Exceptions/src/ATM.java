
public class ATM {

	private BankAccount bankAccount;

	// Constructor initializes the balance to 500 dollar.
	public ATM() {
		super();
		bankAccount = new BankAccount(500);
	}
	
	// Method that handles transactions
	
	public void handleTransactions() {
		// Try catch block for each method to see the behavior of custom exception.
		try {
			bankAccount.withdraw(600);
		} catch (NegativeBalanceException e) {
			System.out.println(e);
			System.out.println(e.getMessage());
		}
		
		try {
			bankAccount.quickWithdraw(600);
		} catch (NegativeBalanceException e) {
			System.out.println(e);
			System.out.println(e.getMessage());
		}
	}
	
	// Driver main method.
	public static void main(String[] args) {
		ATM atm = new ATM();
		atm.handleTransactions();
	}
	
}
