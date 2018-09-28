// TASK 3 DISPENSARY SPECIFIC COMPOSITION SPECIFICATION ASPECT

public aspect DispensaryLogger extends ReusableLogger {
	pointcut constructor():
			call(Dispensary.new(..)) || call(Strain.new(..));

	pointcut operation(Object dispensary) :
			call(public void Dispensary.*(Strain, int)) && target(dispensary);
}
