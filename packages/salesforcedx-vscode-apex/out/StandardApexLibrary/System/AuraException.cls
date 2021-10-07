global class AuraException extends Exception {
	global AuraException(String param0, Exception param1) { }
	global AuraException(Exception param0) { }
	global AuraException(String param0) { }
	global AuraException() { }
	global Exception getCause() { }
	global Integer getLineNumber() { }
	global String getMessage() { }
	global String getStackTraceString() { }
	global String getTypeName() { }
	global void initCause(Exception cause) { }
	global void setMessage(String message) { }

}