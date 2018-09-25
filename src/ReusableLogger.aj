// TASK 3 REUSABLE ASPECT

public abstract aspect ReusableLogger {

	abstract pointcut constructor();

	abstract pointcut operation(Object target, Object parameter);

	after() returning(Object o): constructor() {
		String stringToLog = "Created object " + o;
		Logger.log(stringToLog);
	}

	before(Object target, Object parameter) : operation(target, parameter) {
		String stringToLog = thisJoinPointStaticPart.getSignature().getName() + " called on object " + target + " with parameter " + parameter;
		Logger.log(stringToLog);
	}
}