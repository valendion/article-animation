import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_news_article/page/animation_page.dart';
import 'package:test_news_article/page/news_article_page.dart';

class HomePage extends ConsumerWidget {
  static String routeName = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Test EV Studio'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, NewsArticlePage.routeName);
                  },
                  child: const Text('Use an API in Flutter')),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AnimationPage.routeName);
                  },
                  child: const Text('Animation in Flutter'))
            ],
          ),
        ));
  }
}
