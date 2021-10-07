global class SmartResponses {
	global Object clone() { }
	global static ConnectApi.SmartAnswers getSmartAnswers(String communityId, String questionId, String questionText, ConnectApi.QuestionContextType questionContext, Integer maxResults) { }
	global static ConnectApi.SmartAnswers getSmartAnswers(String questionId, Integer maxResults, String answerCreatedByTimestamp) { }

}