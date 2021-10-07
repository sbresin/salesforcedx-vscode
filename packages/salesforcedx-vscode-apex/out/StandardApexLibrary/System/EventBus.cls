global class Eventbus {
	global static String getOperationId(Object result) { }
	global static List<Database.SaveResult> publish(List<SObject> sobjects) { }
	global static Database.SaveResult publish(SObject sobject) { }

}