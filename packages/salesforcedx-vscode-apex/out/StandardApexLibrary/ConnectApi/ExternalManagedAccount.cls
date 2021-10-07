global class ExternalManagedAccount {
	global Object clone() { }
	global static ConnectApi.ExternalManagedAccountCollectionOutput getCommunitiesExternalManagedAccounts(String communityId, Boolean includeMyAccount) { }
	global static ConnectApi.ExternalManagedAccountCollectionOutput getCommunitiesExternalManagedAccounts(String communityId) { }
	global static ConnectApi.ExternalManagedAccountCollectionOutput getExternalManagedAccounts(String webstoreId, Boolean includeMyAccount) { }
	global static ConnectApi.ExternalManagedAccountCollectionOutput getExternalManagedAccounts(String webstoreId) { }

}