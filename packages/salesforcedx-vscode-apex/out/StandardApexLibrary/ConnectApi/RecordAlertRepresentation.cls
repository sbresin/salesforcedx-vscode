global class RecordAlertRepresentation {
	global Boolean active;
	global String description;
	global Datetime effectiveDate;
	global String id;
	global String parentId;
	global ConnectApi.RecordAlertActionInfoCollectionRepresentation recordAlertActionInfoCollectionRepresentation;
	global String recordAlertCategoryName;
	global ConnectApi.RecordAlertSeverityType severity;
	global String sourceSystemId;
	global String subject;
	global Datetime validUntilDate;
	global String whatId;
	global RecordAlertRepresentation() { }
	global Object clone() { }
	global Boolean equals(Object obj) { }
	global Double getBuildVersion() { }
	global Integer hashCode() { }
	global String toString() { }

}