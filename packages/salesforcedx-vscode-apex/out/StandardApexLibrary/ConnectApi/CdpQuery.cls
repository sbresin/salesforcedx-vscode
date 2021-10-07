global class CdpQuery {
	global Object clone() { }
	global static ConnectApi.CdpQueryMetadataOutput getAllMetadata() { }
	global static ConnectApi.CdpQueryMetadataOutput getInsightsMetadata(String ciName) { }
	global static ConnectApi.CdpQueryMetadataOutput getInsightsMetadata() { }
	global static ConnectApi.CdpQueryMetadataOutput getProfileMetadata(String dataModelName) { }
	global static ConnectApi.CdpQueryMetadataOutput getProfileMetadata() { }
	global static ConnectApi.CdpQueryOutput queryANSISql(ConnectApi.CdpQueryInput input, Integer batchSize, Integer offset, String orderby) { }
	global static ConnectApi.CdpQueryOutput queryANSISql(ConnectApi.CdpQueryInput input) { }
	global static ConnectApi.CdpQueryOutput queryCalculatedInsights(String ciName, String dimensions, String measures, String orderby, String filters, Integer batchSize, Integer offset) { }
	global static ConnectApi.CdpQueryOutput queryProfileApi(String dataModelName, String id, String ciName, String searchKey, String dimensions, String measures, String filters, String fields, Integer batchSize, Integer offset, String orderby) { }
	global static ConnectApi.CdpQueryOutput queryProfileApi(String dataModelName, String id, String childDataModelName, String searchKey, String filters, String fields, Integer batchSize, Integer offset, String orderby) { }
	global static ConnectApi.CdpQueryOutput queryProfileApi(String dataModelName, String id, String searchKey, String filters, String fields, Integer batchSize, Integer offset, String orderby) { }
	global static ConnectApi.CdpQueryOutput queryProfileApi(String dataModelName, String filters, String fields, Integer batchSize, Integer offset, String orderby) { }

}