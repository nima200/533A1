// TASK 2

public aspect LoggingService {

	pointcut AccountCreation() :
			call(Account.new(..));

	pointcut DepositMade(Account account, int amount) :
			call(public void Account.deposit(int)) && args(amount) && target(account);

	pointcut WithdrawMade(Account account, int amount) :
			call(public void Account.withdraw(int)) && args(amount) && target(account);

	pointcut CustomerCreation() :
			call(Customer.new(..));

	after() returning(Account account) : AccountCreation() {
		String stringToLog = "Created object " + account;
		Logger.log(stringToLog);
	}

	before(Account account, int amount) : DepositMade(account, amount) {
		String stringToLog = "deposit called on object " + account + " with parameter " + amount;
		Logger.log(stringToLog);
	}

	before(Account account, int amount) : WithdrawMade(account, amount) {
		String stringToLog = "withdraw called on object" + account + " with parameter " + amount;
		Logger.log(stringToLog);
	}

	after() returning(Customer customer) : CustomerCreation() {
		String stringToLog = "Created object " + customer;
		Logger.log(stringToLog);
	}
}
