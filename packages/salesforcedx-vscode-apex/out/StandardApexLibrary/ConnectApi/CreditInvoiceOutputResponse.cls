global class CreditInvoiceOutputResponse {
	global List<ConnectApi.ErrorResponse> errors;
	global String id;
	global String invoiceId;
	global List<ConnectApi.CreditInvoiceLineError> invoiceLineErrorResults;
	global ConnectApi.CreditMemoStatus status;
	global Boolean success;
	global CreditInvoiceOutputResponse() { }
	global Object clone() { }
	global Boolean equals(Object obj) { }
	global Double getBuildVersion() { }
	global Integer hashCode() { }
	global String toString() { }

}