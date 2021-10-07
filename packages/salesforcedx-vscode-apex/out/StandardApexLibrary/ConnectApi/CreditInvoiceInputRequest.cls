global class CreditInvoiceInputRequest {
	global String description;
	global Datetime effectiveDate;
	global String invoiceId;
	global List<ConnectApi.CreditInvoiceInvoiceLine> invoiceLines;
	global Datetime taxEffectiveDate;
	global ConnectApi.TaxStrategyEnum taxStrategy;
	global ConnectApi.CreditMemoTypeEnum type;
	global CreditInvoiceInputRequest() { }
	global Object clone() { }
	global Boolean equals(Object obj) { }
	global Integer hashCode() { }
	global String toString() { }

}