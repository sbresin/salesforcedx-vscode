global class FfxPortalData {
	global FfxPortalData() { }
	global Object clone() { }
	global String getCachedValue(String instanceName, String pageName, Map<String,String> parameters) { }
	global String getData(String instanceName, String pageName, Map<String,String> parameters) { }
	global String getFfxStatsInJson(String uri, Long timeoutMilli, Integer retryCount, List<String> instanceNames, Boolean includeDR) { }
	global String getFfxStatsInJsonFromSpecificServers(String uri, Long timeoutMilli, Integer retryCount, List<String> serverList) { }
	global List<String> getFileForceDynamicConfigs(String instanceName) { }
	global Map<String,String> getFileForceEntities() { }
	global List<String> getFileForceServers() { }
	global String getSoapResponsesInJson(String remoteClassName, String jsonOption, Long timeoutMilli, List<String> instanceNames) { }

}