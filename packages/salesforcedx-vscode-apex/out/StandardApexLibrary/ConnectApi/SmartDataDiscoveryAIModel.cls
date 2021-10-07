global class SmartDataDiscoveryAIModel {
	global ConnectApi.SmartDataDiscoveryUser createdBy;
	global Datetime createdDate;
	global String description;
	global String id;
	global ConnectApi.AbstractSmartDataDiscoveryAIModelSource input;
	global String label;
	global ConnectApi.SmartDataDiscoveryUser lastModifiedBy;
	global Datetime lastModifiedDate;
	global Object modelData;
	global List<ConnectApi.SmartDataDiscoveryModelField> modelFields;
	global String modelFileUrl;
	global ConnectApi.AbstractSmartDataDiscoveryModelRuntime modelRuntime;
	global String name;
	global String namespace;
	global String predictedField;
	global ConnectApi.AbstractSmartDataDiscoveryPredictionProperty predictionProperty;
	global ConnectApi.SmartDataDiscoveryAIModelStatus status;
	global String url;
	global Map<String,Object> validationResult;
	global SmartDataDiscoveryAIModel() { }
	global Object clone() { }
	global Boolean equals(Object obj) { }
	global Double getBuildVersion() { }
	global Integer hashCode() { }
	global String toString() { }

}