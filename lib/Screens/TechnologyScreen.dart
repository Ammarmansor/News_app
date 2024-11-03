import 'package:flutter/material.dart';
import 'package:news_app/Service/Service.dart';
import 'package:news_app/Widgets/NewsTile.dart';
import 'package:news_app/models/Newstilemodel.dart';

class TechnologyScreen extends StatelessWidget {
  TechnologyScreen({super.key});

  final Future<List<NewsTileModel>> newsTileModelList =
      Service().CategoryNews(category: 'technology');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Technology News'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<NewsTileModel>>(
          future: newsTileModelList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No news available'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final newsTile = snapshot.data![index];
                  return NewsTile(
                    imageurl: newsTile.imageurl ??
                        'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
                    title: newsTile.title,
                    description: newsTile.description,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
