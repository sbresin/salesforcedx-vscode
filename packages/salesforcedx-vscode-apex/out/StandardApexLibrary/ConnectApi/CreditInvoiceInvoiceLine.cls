global class CreditInvoiceInvoiceLine {
	global Double amountToCredit;
	global String invoiceLineId;
	global Datetime taxEffectiveDate;
	global ConnectApi.TaxStrategyEnum taxStrategy;
	global List<ConnectApi.CreditInvoiceInvoiceLineTax> taxes;
	global CreditInvoiceInvoiceLine() { }
	global Object clone() { }
	global Boolean equals(Object obj) { }
	global Integer hashCode() { }
	global String toString() { }

}