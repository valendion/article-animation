import 'package:dio/dio.dart';
import 'package:test_news_article/constan.dart';
import 'package:flutter/material.dart';
import 'package:test_news_article/model/news_article.dart';

class NewsArticleRepository {
  Future<List<NewsArticle>> getNewsArticles() async {
    try {
      var response = await Dio().get(Constan.pathUrl);
      if (response.statusCode == 200) {
        return (response.data as List).map((x) {
          return NewsArticle.fromMap(x);
        }).toList();
      } else {
        debugPrint('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode ?? 0;
      }
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
