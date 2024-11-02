import 'package:flutter/material.dart';
import 'package:news_app/Widgets/CategoryGenerator.dart';
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
        Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image.asset('assets/business.avif'),
            ),
            const Text(
              'dsfkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              'dsfkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            )
          ],
        )
      ],
    );
  }
}
