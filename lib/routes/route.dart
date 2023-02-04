import 'package:flutter/material.dart';

import '../page/animation_page.dart';
import '../page/home_page.dart';
import '../page/news_article_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  HomePage.routeName: (context) => const HomePage(),
  NewsArticlePage.routeName: (context) => const NewsArticlePage(),
  AnimationPage.routeName: (context) => const AnimationPage()
};
