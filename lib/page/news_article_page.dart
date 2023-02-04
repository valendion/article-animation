import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_news_article/provider/news_provider.dart';

class NewsArticlePage extends ConsumerWidget {
  static String routeName = '/news';
  const NewsArticlePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var newsArticle = ref.watch(newsArticleProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test EV Studio'),
      ),
      body: Column(
        children: [
          Expanded(
              child: newsArticle.when(
                  data: (data) {
                    debugPrint(data.toString());
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: ((context, index) {
                          var article = data[index];
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    NetworkImage(article.images.main),
                              ),
                              title: Text(
                                  'Name : ${article.name.first} ${article.name.middle} ${article.name.last}'),
                              subtitle: Text('Gender : ${article.gender}'),
                            ),
                          );
                        }));
                  },
                  error: (error, stackTrace) =>
                      Center(child: Text('Error $error')),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()))),
        ],
      ),
    );
  }
}
