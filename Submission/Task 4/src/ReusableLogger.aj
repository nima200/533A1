// TASK 3 REUSABLE ASPECT

import java.util.Arrays;

public abstract aspect ReusableLogger {

	abstract pointcut constructor();

	abstract pointcut operation(Object target);

	after() returning(Object o): constructor() {
		String stringToLog = "Created object " + o;
		showLog(stringToLog);
	}

	before(Object target) : operation(target) {
		Object[] params = thisJoinPoint.getArgs();
		String paramsStr = stripArrayBrackets(Arrays.toString(params));
		String stringToLog = thisJoinPointStaticPart.getSignature().getName() + " called on object " + target + " with parameter " + paramsStr;
		showLog(stringToLog);
	}

	private String stripArrayBrackets(String pArrayStr) {
		return pArrayStr.substring(1, pArrayStr.length() - 1);
	}

	private void showLog(String stringToLog) {
		System.out.println(stringToLog);
	}
}