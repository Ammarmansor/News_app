import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/models/Newstilemodel.dart';

class Service {
  final dio = Dio();
  Future<List<NewsTileModel>> TopHeadLines() async {
    final response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=243dd82db58e4954bbb86d5f25307cca');
    Map<String, dynamic> Jsondata = response.data;

    List<dynamic> articles = Jsondata['articles'];
    List<NewsTileModel> newsTileModelList = [];
    for (int i = 0; i < articles.length; i++) {
      newsTileModelList.add(
        NewsTileModel(
            imageurl: articles[i]['urlToImage'] ?? 'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
            title: articles[i]['title'] ?? 'Title',
            description: articles[i]['description'] ?? 'Description'),
      );
    }
    return newsTileModelList;
  }
  Future<List<NewsTileModel>> CategoryNews({required String category}) async {
    final response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=243dd82db58e4954bbb86d5f25307cca');
    Map<String, dynamic> Jsondata = response.data;

    List<dynamic> articles = Jsondata['articles'];
    List<NewsTileModel> newsTileModelList = [];
    for (int i = 0; i < articles.length; i++) {
      newsTileModelList.add(
        NewsTileModel(
            imageurl: articles[i]['urlToImage'] ?? 'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
            title: articles[i]['title'] ?? 'Title',
            description: articles[i]['description'] ?? 'Description'),
      );
    }
    return newsTileModelList;
  }
}
