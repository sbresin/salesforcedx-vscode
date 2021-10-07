global class BotVersionActivation {
	global Object clone() { }
	global static ConnectApi.BotVersionActivationInfo getVersionActivationInfo(String botVersionId) { }
	global static ConnectApi.BotVersionActivationInfo updateVersionStatus(String botVersionId, ConnectApi.BotVersionActivationStatus status, ConnectApi.BotVersionActivationInput postBody) { }

}