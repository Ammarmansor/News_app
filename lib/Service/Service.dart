import 'package:dio/dio.dart';
import 'package:news_app/models/Newstilemodel.dart';

class Service {
  final dio = Dio();
  Future<List<NewsTileModel>> getHttp() async {
    final response = await dio.get(
        'https://newsapi.org/v2/everything?q=bitcoin&apiKey=243dd82db58e4954bbb86d5f25307cca');
    Map<String, dynamic> Jsondata = response.data;

    List<dynamic> articles = Jsondata['articles'];
    List<NewsTileModel> newsTileModelList = [];
    for (int i = 0; i < articles.length; i++) {
      newsTileModelList.add(
        NewsTileModel(
            imageurl: articles[i]['urlToImage'] ?? 'assets/business.avif',
            title: articles[i]['title'] ?? 'Title',
            description: articles[i]['description'] ?? 'Description'),
      );
    }
    return newsTileModelList;
  }
}
