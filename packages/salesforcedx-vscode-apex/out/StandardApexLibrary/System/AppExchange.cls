global class AppExchange {
	global AppExchange() { }
	global static void calculateListingPopularity(String testUserName, String testCronString) { }
	global Object clone() { }
	global static String createOrg(String firstName, String lastName, String companyName, String email, String language, String adminUserName, String packageId, String evalUserName, Boolean isExtension, String trialTemplateId) { }
	global static String createOrg(String firstName, String lastName, String companyName, String email, String language, String adminUserName, String packageId, String evalUserName, Boolean isExtension) { }
	global static Id createPortalUser(SObject user, String accountId) { }
	global static String createSession(String appExchangeOrgId, String portalId, String siteId, String portalUserId) { }
	global static void debug(String message) { }
	global static System.AppExchangeUserPerms getAppExchangeUserPerms(String orgId, String userId) { }
	global static Map<String,Object> getAppInstallCountForPackageIds(Set<String> packageIds, Date createdOnOrAfter) { }
	global static String getAuthenticatingUrl(String page) { }
	global static String getConfig(String section, String key) { }
	global static String getCookie(String name) { }
	global static String getCrossInstanceEncryptedHash(Double appVersion, String value) { }
	global static List<String> getInstalledPackageVersions(String orgId) { }
	global static String getOrgName(String orgId) { }
	global static String getPackageManifest(String pkgVersionId) { }
	global static String getPortalAdminId() { }
	global static String getPortalId() { }
	global static String getSiteId() { }
	global static List<TrialTemplate> getTrialTemplates(String callerOrgId, String lmPkgId, String username) { }
	global static List<TrialTemplate> getTrialTemplatesInOrg(String tsoOrgId) { }
	global static List<System.AppExchangeTrialTemplate> getTrialTemplatesInTSOOrg(String tsoOrgId) { }
	global static Boolean isDuplicateUserName(String username) { }
	global static Boolean isGuestUser() { }
	global static Boolean isTSOApproved(String ttId) { }
	global static void movedPermanently(String location) { }
	global static String provisionPackageLicense(String orgId, String allPackageId, Integer numLicenses, Date expirationDate, String status) { }
	global static Boolean registerPackageVersion(String pkgVersionId) { }
	global static void setCookie(String name, String value, String cookieDomainName, Integer cookieAge) { }
	global static void setCookie(String name, String value) { }
	global static void setDefaultLicenseTerms(String pkgVersionId, String orgId, String defaultLicenseStatus, Integer defaultLicenseLength, Integer defaultLicenseSeats) { }
	global static void setHttpResponseStatus(Integer statusCode) { }
	global static String setLicenseManagementOrganization(String pkgVersionId, String orgId, String username, String password) { }
	global static void splunkLog(System.Type logSource, String message) { }
	global static void stopListingPopularityJob() { }
	global static String to15(String id) { }
	global static String to18(String id) { }
	global static void updateSecurityInstallWarningFlag(List<String> packageVersionIdsToSet, List<String> packageVersionIdsToRevoke) { }
	global static Database.SaveResult updateSingleAsAdmin(SObject sobj) { }
	global static String validateLMAInstalled(String username, String password) { }
	global static String validateOrgUser(String username, String password) { }

}