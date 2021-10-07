global class Database {
	global static Database.LeadConvertResult convertLead(Database.LeadConvert leadConvert, Object DmlOptions) { }
	global static Database.LeadConvertResult convertLead(Database.LeadConvert leadConvert, Boolean allOrNothing) { }
	global static List<Database.LeadConvertResult> convertLead(List<Database.LeadConvert> leadConverts, Object DmlOptions) { }
	global static List<Database.LeadConvertResult> convertLead(List<Database.LeadConvert> leadConverts, Boolean allOrNothing) { }
	global static Database.LeadConvertResult convertLead(Database.LeadConvert leadConvert) { }
	global static List<Database.LeadConvertResult> convertLead(List<Database.LeadConvert> leadConverts) { }
	global static Database.LeadConvertResult convertLeadWithAccess(Database.LeadConvert leadConvert, Object DmlOptions, Object accessLevel) { }
	global static Database.LeadConvertResult convertLeadWithAccess(Database.LeadConvert leadConvert, Boolean allOrNothing, Object accessLevel) { }
	global static List<Database.LeadConvertResult> convertLeadWithAccess(List<Database.LeadConvert> leadConverts, Object DmlOptions, Object accessLevel) { }
	global static List<Database.LeadConvertResult> convertLeadWithAccess(List<Database.LeadConvert> leadConverts, Boolean allOrNothing, Object accessLevel) { }
	global static Database.LeadConvertResult convertLeadWithAccess(Database.LeadConvert leadConvert, Object AccessLevel) { }
	global static List<Database.LeadConvertResult> convertLeadWithAccess(List<Database.LeadConvert> leadConverts, Object AccessLevel) { }
	global static Integer countQuery(String query) { }
	global static Integer countQueryWithAccess(String query, Object accessLevel) { }
	global static Database.DeleteResult delete(Id id, Boolean allOrNothing) { }
	global static List<Database.DeleteResult> delete(List<Id> ids, Boolean allOrNothing) { }
	global static List<Database.DeleteResult> delete(List<SObject> sobjects, Boolean allOrNothing) { }
	global static Database.DeleteResult delete(SObject sobject, Boolean allOrNothing) { }
	global static Database.DeleteResult delete(Id id) { }
	global static List<Database.DeleteResult> delete(List<Id> ids) { }
	global static List<Database.DeleteResult> delete(List<SObject> sobjects) { }
	global static Database.DeleteResult delete(SObject sobject) { }
	global static List<Database.DeleteResult> deleteAsync(List<SObject> sobjects, Object callback) { }
	global static Database.DeleteResult deleteAsync(SObject sobject, Object callback) { }
	global static List<Database.DeleteResult> deleteAsync(List<SObject> sobjects) { }
	global static Database.DeleteResult deleteAsync(SObject sobject) { }
	global static List<Database.DeleteResult> deleteImmediate(List<SObject> sobjects) { }
	global static Database.DeleteResult deleteImmediate(SObject sobject) { }
	global static Database.DeleteResult deleteWithAccess(Id id, Boolean allOrNothing, Object accessLevel) { }
	global static List<Database.DeleteResult> deleteWithAccess(List<Id> ids, Boolean allOrNothing, Object accessLevel) { }
	global static List<Database.DeleteResult> deleteWithAccess(List<SObject> sobjects, Boolean allOrNothing, Object accessLevel) { }
	global static Database.DeleteResult deleteWithAccess(SObject sobject, Boolean allOrNothing, Object accessLevel) { }
	global static Database.DeleteResult deleteWithAccess(Id id, Object accessLevel) { }
	global static List<Database.DeleteResult> deleteWithAccess(List<Id> ids, Object accessLevel) { }
	global static List<Database.DeleteResult> deleteWithAccess(List<SObject> sobjects, Object accessLevel) { }
	global static Database.DeleteResult deleteWithAccess(SObject sobject, Object accessLevel) { }
	global static List<Database.EmptyRecycleBinResult> emptyRecycleBin(List<Id> ids) { }
	global static List<Database.EmptyRecycleBinResult> emptyRecycleBin(List<SObject> sobjects) { }
	global static Database.EmptyRecycleBinResult emptyRecycleBin(SObject sobject) { }
	global static String executeBatch(Object batchable, Integer batchSize) { }
	global static String executeBatch(Object batchable) { }
	global static Database.DeleteResult getAsyncDeleteResult(Object deleteResult) { }
	global static Database.DeleteResult getAsyncDeleteResult(String asyncLocator) { }
	global static String getAsyncLocator(Object result) { }
	global static Database.SaveResult getAsyncSaveResult(Object saveResult) { }
	global static Database.SaveResult getAsyncSaveResult(String asyncLocator) { }
	global static Database.GetDeletedResult getDeleted(String sobjectType, Datetime startDate, Datetime endDate) { }
	global static Database.QueryLocator getQueryLocator(List<SObject> query) { }
	global static Database.QueryLocator getQueryLocator(String query) { }
	global static Database.GetUpdatedResult getUpdated(String sobjectType, Datetime startDate, Datetime endDate) { }
	global static List<Database.SaveResult> insert(List<SObject> sobjects, Object DmlOptions) { }
	global static List<Database.SaveResult> insert(List<SObject> sobjects, Boolean allOrNothing) { }
	global static Database.SaveResult insert(SObject sobject, Object DmlOptions) { }
	global static Database.SaveResult insert(SObject sobject, Boolean allOrNothing) { }
	global static List<Database.SaveResult> insert(List<SObject> sobjects) { }
	global static Database.SaveResult insert(SObject sobject) { }
	global static List<Database.SaveResult> insertAsync(List<SObject> sobjects, Object callback) { }
	global static Database.SaveResult insertAsync(SObject sobject, Object callback) { }
	global static List<Database.SaveResult> insertAsync(List<SObject> sobjects) { }
	global static Database.SaveResult insertAsync(SObject sobject) { }
	global static List<Database.SaveResult> insertImmediate(List<SObject> sobjects) { }
	global static Database.SaveResult insertImmediate(SObject sobject) { }
	global static List<Database.SaveResult> insertWithAccess(List<SObject> sobjects, Object DmlOptions, Object accessLevel) { }
	global static List<Database.SaveResult> insertWithAccess(List<SObject> sobjects, Boolean allOrNothing, Object accessLevel) { }
	global static Database.SaveResult insertWithAccess(SObject sobject, Object DmlOptions, Object accessLevel) { }
	global static Database.SaveResult insertWithAccess(SObject sobject, Boolean allOrNothing, Object accessLevel) { }
	global static List<Database.SaveResult> insertWithAccess(List<SObject> sobjects, Object AccessLevel) { }
	global static Database.SaveResult insertWithAccess(SObject sobject, Object AccessLevel) { }
	global static Database.MergeResult merge(SObject master, Id duplicate, Boolean allOrNothing) { }
	global static List<Database.MergeResult> merge(SObject master, List<Id> duplicates, Boolean allOrNothing) { }
	global static List<Database.MergeResult> merge(SObject master, List<SObject> duplicates, Boolean allOrNothing) { }
	global static Database.MergeResult merge(SObject master, SObject duplicate, Boolean allOrNothing) { }
	global static Database.MergeResult merge(SObject master, Id duplicate) { }
	global static List<Database.MergeResult> merge(SObject master, List<Id> duplicates) { }
	global static List<Database.MergeResult> merge(SObject master, List<SObject> duplicates) { }
	global static Database.MergeResult merge(SObject master, SObject duplicate) { }
	global static Database.MergeResult mergeWithAccess(SObject master, Id duplicate, Boolean allOrNothing, Object accessLevel) { }
	global static List<Database.MergeResult> mergeWithAccess(SObject master, List<Id> duplicates, Boolean allOrNothing, Object accessLevel) { }
	global static List<Database.MergeResult> mergeWithAccess(SObject master, List<SObject> duplicates, Boolean allOrNothing, Object accessLevel) { }
	global static Database.MergeResult mergeWithAccess(SObject master, SObject duplicate, Boolean allOrNothing, Object accessLevel) { }
	global static Database.MergeResult mergeWithAccess(SObject master, Id duplicate, Object accessLevel) { }
	global static List<Database.MergeResult> mergeWithAccess(SObject master, List<Id> duplicates, Object accessLevel) { }
	global static List<Database.MergeResult> mergeWithAccess(SObject master, List<SObject> duplicates, Object accessLevel) { }
	global static Database.MergeResult mergeWithAccess(SObject master, SObject duplicate, Object accessLevel) { }
	global static List<SObject> query(String query) { }
	global static List<SObject> queryWithAccess(String query, Object accessLevel) { }
	global static void rollback(System.Savepoint savepoint) { }
	global static System.Savepoint setSavepoint() { }
	global static Database.UndeleteResult undelete(Id id, Boolean allOrNothing) { }
	global static List<Database.UndeleteResult> undelete(List<Id> ids, Boolean allOrNothing) { }
	global static List<Database.UndeleteResult> undelete(List<SObject> sobjects, Boolean allOrNothing) { }
	global static Database.UndeleteResult undelete(SObject sobject, Boolean allOrNothing) { }
	global static Database.UndeleteResult undelete(Id id) { }
	global static List<Database.UndeleteResult> undelete(List<Id> ids) { }
	global static List<Database.UndeleteResult> undelete(List<SObject> sobjects) { }
	global static Database.UndeleteResult undelete(SObject sobject) { }
	global static Database.UndeleteResult undeleteWithAccess(Id id, Boolean allOrNothing, Object accessLevel) { }
	global static List<Database.UndeleteResult> undeleteWithAccess(List<Id> ids, Boolean allOrNothing, Object accessLevel) { }
	global static List<Database.UndeleteResult> undeleteWithAccess(List<SObject> sobjects, Boolean allOrNothing, Object accessLevel) { }
	global static Database.UndeleteResult undeleteWithAccess(SObject sobject, Boolean allOrNothing, Object accessLevel) { }
	global static Database.UndeleteResult undeleteWithAccess(Id id, Object accessLevel) { }
	global static List<Database.UndeleteResult> undeleteWithAccess(List<Id> ids, Object accessLevel) { }
	global static List<Database.UndeleteResult> undeleteWithAccess(List<SObject> sobjects, Object accessLevel) { }
	global static Database.UndeleteResult undeleteWithAccess(SObject sobject, Object accessLevel) { }
	global static List<Database.SaveResult> update(List<SObject> sobjects, Object DmlOptions) { }
	global static List<Database.SaveResult> update(List<SObject> sobjects, Boolean allOrNothing) { }
	global static Database.SaveResult update(SObject sobject, Object DmlOptions) { }
	global static Database.SaveResult update(SObject sobject, Boolean allOrNothing) { }
	global static List<Database.SaveResult> update(List<SObject> sobjects) { }
	global static Database.SaveResult update(SObject sobject) { }
	global static List<Database.SaveResult> updateAsync(List<SObject> sobjects, Object callback) { }
	global static Database.SaveResult updateAsync(SObject sobject, Object callback) { }
	global static List<Database.SaveResult> updateAsync(List<SObject> sobjects) { }
	global static Database.SaveResult updateAsync(SObject sobject) { }
	global static List<Database.SaveResult> updateImmediate(List<SObject> sobjects) { }
	global static Database.SaveResult updateImmediate(SObject sobject) { }
	global static List<Database.SaveResult> updateWithAccess(List<SObject> sobjects, Object DmlOptions, Object accessLevel) { }
	global static List<Database.SaveResult> updateWithAccess(List<SObject> sobjects, Boolean allOrNothing, Object accessLevel) { }
	global static Database.SaveResult updateWithAccess(SObject sobject, Object DmlOptions, Object accessLevel) { }
	global static Database.SaveResult updateWithAccess(SObject sobject, Boolean allOrNothing, Object accessLevel) { }
	global static List<Database.SaveResult> updateWithAccess(List<SObject> sobjects, Object accessLevel) { }
	global static Database.SaveResult updateWithAccess(SObject sobject, Object accessLevel) { }
	global static List<Database.UpsertResult> upsert(List<SObject> sobjects, Schema.SObjectField field, Boolean allOrNothing) { }
	global static Database.UpsertResult upsert(SObject sobject, Schema.SObjectField field, Boolean allOrNothing) { }
	global static List<Database.UpsertResult> upsert(List<SObject> sobjects, Boolean allOrNothing) { }
	global static List<Database.UpsertResult> upsert(List<SObject> sobjects, Schema.SObjectField field) { }
	global static Database.UpsertResult upsert(SObject sobject, Boolean allOrNothing) { }
	global static Database.UpsertResult upsert(SObject sobject, Schema.SObjectField field) { }
	global static List<Database.UpsertResult> upsert(List<SObject> sobjects) { }
	global static Database.UpsertResult upsert(SObject sobject) { }
	global static List<Database.UpsertResult> upsertWithAccess(List<SObject> sobjects, Schema.SObjectField field, Boolean allOrNothing, Object accessLevel) { }
	global static Database.UpsertResult upsertWithAccess(SObject sobject, Schema.SObjectField field, Boolean allOrNothing, Object accessLevel) { }
	global static List<Database.UpsertResult> upsertWithAccess(List<SObject> sobjects, Boolean allOrNothing, Object accessLevel) { }
	global static List<Database.UpsertResult> upsertWithAccess(List<SObject> sobjects, Schema.SObjectField field , Object accessLevel) { }
	global static Database.UpsertResult upsertWithAccess(SObject sobject, Boolean allOrNothing, Object accessLevel) { }
	global static Database.UpsertResult upsertWithAccess(SObject sobject, Schema.SObjectField field, Object accessLevel) { }
	global static List<Database.UpsertResult> upsertWithAccess(List<SObject> sobjects, Object accessLevel) { }
	global static Database.UpsertResult upsertWithAccess(SObject sobject, Object accessLevel) { }

}