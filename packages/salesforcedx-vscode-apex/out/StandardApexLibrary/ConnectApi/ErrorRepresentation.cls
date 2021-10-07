global class ErrorRepresentation {
	global String code;
	global Boolean conflictProvider;
	global Boolean conflictTime;
	global Boolean fatal;
	global String message;
	global Boolean retryable;
	global ErrorRepresentation() { }
	global Object clone() { }
	global Boolean equals(Object obj) { }
	global Double getBuildVersion() { }
	global Integer hashCode() { }
	global String toString() { }

}