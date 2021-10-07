global class Knowledge {
	global Object clone() { }
	global static ConnectApi.KnowledgeArticleVersionCollection getTopViewedArticlesForTopic(String communityId, String topicId, Integer maxResults) { }
	global static ConnectApi.KnowledgeArticleVersionCollection getTrendingArticles(String communityId, Integer maxResults) { }
	global static ConnectApi.KnowledgeArticleVersionCollection getTrendingArticlesForTopic(String communityId, String topicId, Integer maxResults) { }
	global static void setTestGetTrendingArticles(String communityId, Integer maxResults, ConnectApi.KnowledgeArticleVersionCollection result) { }
	global static void setTestGetTrendingArticlesForTopic(String communityId, String topicId, Integer maxResults, ConnectApi.KnowledgeArticleVersionCollection result) { }

}