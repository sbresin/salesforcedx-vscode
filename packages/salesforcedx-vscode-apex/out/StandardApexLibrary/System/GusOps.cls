global class GusOps {
	global GusOps() { }
	global Object clone() { }
	global static String executeCustomSqlScript(Id caseId, Set<Id> implPlanIds) { }
	global static String executeCustomSqlScript(Id caseId) { }
	global static String executeCustomSqlScriptFromValidInstances(Id caseId, Set<String> validInstances) { }
	global static String executeUsingInternalRestServiceWithCase(String httpMethod, String targetOrgId, String url, String caseId, String body) { }
	global static String generateMultiOrgToken(Id caseId, List<String> orgIds) { }
	global static void getInstancesFromCase(Id caseId, Set<Id> implPlanIds, Set<String> validInstances, Set<String> invalidInstances) { }
	global static String getOrganizationInstanceName(String orgId) { }
	global static String getSqlScriptOutputUrl(Id caseId, String instanceName, String orgId) { }
	global static String getSqlScriptOutputUrl(Id caseId, String instanceName) { }
	global static String insertFailedAuditableActionResultForApexTest(Id caseId, String requestType) { }
	global static String insertSuccessfulAuditableActionResultForApexTest(Id caseId, String requestType) { }
	global static void validateSqlScriptCase(Id caseId) { }

}