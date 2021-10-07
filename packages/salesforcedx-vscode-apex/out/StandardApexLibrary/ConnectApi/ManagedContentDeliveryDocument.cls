global class ManagedContentDeliveryDocument {
	global ConnectApi.ManagedContentChannelSummary channelInfo;
	global Map<String,Object> contentBody;
	global String contentKey;
	global ConnectApi.ManagedContentTypeSummary contentType;
	global String language;
	global String managedContentId;
	global Datetime publishedDate;
	global String title;
	global String unauthenticatedUrl;
	global String urlName;
	global ManagedContentDeliveryDocument() { }
	global Object clone() { }
	global Boolean equals(Object obj) { }
	global Double getBuildVersion() { }
	global Integer hashCode() { }
	global String toString() { }

}