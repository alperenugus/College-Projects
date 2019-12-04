
public class BankAccount {
	
	private double balance;

	// Constructor that initializes balance.
	public BankAccount(double balance) {
		super();
		this.balance = balance;
	}
	
	// Exception throwing with argument
	public void withdraw(double amount) throws NegativeBalanceException {
		if(amount > balance) throw new NegativeBalanceException(balance - amount);
		else balance -= amount;
	}
	
	// Exception throwing without argument
	public void quickWithdraw(double amount) throws NegativeBalanceException {
		if(amount > balance) throw new NegativeBalanceException();
		else balance -= amount;
	}
	
}
