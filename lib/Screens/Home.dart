import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Service/Service.dart';
import 'package:news_app/Widgets/CategoryGenerator.dart';
import 'package:news_app/Widgets/NewsTile.dart';
import 'package:news_app/models/CategoryModel.dart';
import 'package:news_app/models/Newstilemodel.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
    Future<List<NewsTileModel>> newsTileModelList=Service().getHttp();
    
  final List<CategoryModel> categoryModel = [
    CategoryModel(name: 'Business', imagetext: 'assets/business.avif'),
    CategoryModel(name: 'Entertainment', imagetext: 'assets/entertaiment.avif'),
    CategoryModel(name: 'General', imagetext: 'assets/general.avif'),
    CategoryModel(name: 'Health', imagetext: 'assets/health.avif'),
    CategoryModel(name: 'Science', imagetext: 'assets/science.avif'),
    CategoryModel(name: 'Sports', imagetext: 'assets/sports.avif'),
    CategoryModel(name: 'Technology', imagetext: 'assets/technology.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryModel.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CategoryGenerator(categoryModel: categoryModel[index]),
                      );
                    },
                  ),
                );
              },
              childCount: 1, // We only need one item for the horizontal list
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const NewsTile(
                  imageurl: 'assets/business.avif',
                  title: 'Title',
                  description: 'Description',
                );
              },
              childCount: newsTileModelList.length,
            ),
          ),
        ],
      ),
    );
  }
}
