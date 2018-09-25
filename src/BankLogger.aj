// TASK 3 BANK SPECIFIC COMPOSITION SPECIFICATION ASPECT

public aspect BankLogger extends ReusableLogger {
	pointcut constructor():
			call(Account.new(..)) || call(Customer.new(..));

	pointcut operation(Object account) :
			call(public void Account.*(int)) && target(account);
}
