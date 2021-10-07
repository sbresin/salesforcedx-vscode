global class Search {
	global static Search.SearchResults find(String searchQuery) { }
	global static Search.SearchResults findWithAccess(String searchQuery, Object accessLevel) { }
	global static List<List<SObject>> query(String searchQuery) { }
	global static List<List<SObject>> queryWithAccess(String searchQuery, Object accessLevel) { }
	global static Search.SuggestionResults suggest(String searchQuery, String sObjectType, Object options) { }
	global static Search.SuggestionResults suggestWithAccess(String searchQuery, String sObjectType, Object options, Object accessLevel) { }

}