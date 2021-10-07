global class TrailblazerIdentityInfo {
	global TrailblazerIdentityInfo() { }
	global Object clone() { }
	global static Auth.TrailblazerIdentityAdditionalInfo getAdditionalUserInfo(String orgId, String userId) { }
	global static List<Auth.TrailblazerIdentityAdditionalInfo> getAdditionalUserInfos(List<String> orgIds, List<String> userIds) { }
	global static String getMyDomain(String orgId) { }
	global static List<Auth.ThirdPartyAccountLinkInfo> getTpalsByHandlesAndProviderIds(List<String> handles, List<String> ssoProviderIds) { }
	global static List<Auth.ThirdPartyAccountLinkInfo> getTpalsByIds(List<String> ids) { }
	global static List<Auth.ThirdPartyAccountLinkInfo> getTpalsByRemoteIdsAndProviderIds(List<String> remoteIdentifiers, List<String> ssoProviderIds) { }
	global static List<Auth.ThirdPartyAccountLinkInfo> getTpalsByUserIdAndProviderIds(String userId, List<String> ssoProviderIds) { }
	global static List<Auth.ThirdPartyAccountLinkInfo> getTpalsByUserIdsAndProviderIds(List<String> userIds, List<String> ssoProviderIds) { }

}