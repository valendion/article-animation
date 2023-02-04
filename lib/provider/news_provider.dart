import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_news_article/model/news_article.dart';
import 'package:test_news_article/repository/news_article_repository.dart';

final newsArticleRepositoryProvider = Provider<NewsArticleRepository>((ref) {
  return NewsArticleRepository();
});

final newsArticleProvider = FutureProvider<List<NewsArticle>>((ref) async {
  return ref.read(newsArticleRepositoryProvider).getNewsArticles();
});
