import 'package:flutter/material.dart';
import 'package:news_app/Widgets/CategoryGenerator.dart';
import 'package:news_app/Widgets/NewsTile.dart';
import 'package:news_app/models/CategoryModel.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryModel.length,
            itemBuilder: (context, index) {
              return CategoryGenerator(categoryModel: categoryModel[index]);
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            
            itemCount: 10,
            itemBuilder: (context, index) {
              return const NewsTile(
                  imageurl: 'assets/business.avif',
                  title: ' title',
                  description: 'description');
            },
          ),
        )
      ],
    );
  }
}
