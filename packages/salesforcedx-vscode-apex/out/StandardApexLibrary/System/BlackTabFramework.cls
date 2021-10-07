global class BlackTabFramework {
	global BlackTabFramework() { }
	global static String cancelBlackTabRequest(String requestId, Set<String> instances, Set<String> orgs, String caseId, String userId) { }
	global Object clone() { }
	global static String executeBlackTabRequest(String toolName, String parameters, String operation, Set<String> instances, Set<String> verifInstances, Set<String> orgs, String caseId, String scheduledTime, String staggerInterval, String userId, String origin) { }
	global static String executeBlackTabRequest(String toolName, String parameters, String operation, Set<String> instances, Set<String> orgs, String caseId, String scheduledTime, String origin) { }
	global static String executeBlackTabRequest(String toolName, String parameters, String operation, Set<String> instances, Set<String> orgs, String caseId, String scheduledTime) { }
	global static String executeBlackTabRequest(String toolName, String parameters, String operation, Set<String> instances, Set<String> orgs, String caseId) { }
	global static String getBatchToInstances(String actionName, String publicKeyPermissionsString, Set<String> instances) { }
	global static String getBlackTabActionListMetadata(String name, String owner, String category, String impact, String invocationScope, String publicKeyPermission) { }
	global static String getBlackTabActionParameters(String name, String publicKeyPermission) { }
	global static String getBlackTabActionParameters(String name) { }
	global static List<String> getCatalogMetadata() { }
	global static String getInstanceDetails(List<String> instances) { }
	global static String getLoginAsUrl(Id caseId, Id orgId, String impersonateUser) { }
	global static String getOrganizationDetails(List<String> orgIds) { }
	global static String getSortedOrganizationDetails(List<String> orgIds) { }
	global static String getTroubleshootOrgDetail(Id caseId, Id orgId) { }
	global static String getTroubleshootOrgSetup(Id caseId, Id orgId) { }
	global static void handleCancelAll(String actionId) { }
	global static void handleCancelByInstance(String actionId, String instanceName, Boolean isActionOffPeak) { }
	global static void handleCancelByOrg(String actionId, String instanceName, String orgId, Boolean isActionOffPeak) { }
	global static void handleContinueExecution(String actionId, Integer batchNumber, Boolean isOffPeak) { }
	global static String makeChatterPostAsBTFAUser(String body) { }

}