global class CollectSimilarCasesData {
	global CollectSimilarCasesData(Integer nCases, Integer similarCutoffNumber, Boolean isStrategyTest) { }
	global Object clone() { }
	global void execute(Database.BatchableContext BC, List<SObject> caseList) { }
	global void finish(Database.BatchableContext BC) { }
	global Database.QueryLocator start(Database.BatchableContext BC) { }

}