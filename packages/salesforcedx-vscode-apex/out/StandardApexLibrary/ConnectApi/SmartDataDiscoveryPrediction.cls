global class SmartDataDiscoveryPrediction {
	global String entityId;
	global Map<String,String> exploratoryValues;
	global ConnectApi.SmartDataDiscoveryPredict prediction;
	global String predictionDefinition;
	global String predictionDefinitionId;
	global List<ConnectApi.AbstractSmartDataDiscoveryPredictRepresentation> predictions;
	global List<ConnectApi.SmartDataDiscoveryPredictCondition> prescriptions;
	global ConnectApi.SmartDataDiscoveryPredictSettings settings;
	global SmartDataDiscoveryPrediction() { }
	global Object clone() { }
	global Boolean equals(Object obj) { }
	global Double getBuildVersion() { }
	global Integer hashCode() { }
	global String toString() { }

}