global class Org62Ops {
	global Org62Ops() { }
	global Object clone() { }
	global static String executeUsingInternalRestService(String targetOrgId, String url) { }
	global static String executeUsingInternalRestServiceWithCase(String targetOrgId, String url, String caseId) { }
	global static String generateBTUrlForOrg(Id caseId, Id orgId, String landingUrl) { }
	global static String getOrganizationInstanceName(Id orgId) { }
	global static String getOrganizationInstanceType(Id orgId) { }
	global static String getSfdcBtLoginUrl(String caseId, String landingUrl) { }
	global static String getTokenForDataRestoreExcludingFFX(Id orgId, String caseNumber, String username) { }
	global static String getTokenForDataRestoreIncludingFFX(Id orgId, String caseNumber, String username) { }

}