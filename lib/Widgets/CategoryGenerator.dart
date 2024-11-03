import 'package:flutter/material.dart';
import 'package:news_app/models/CategoryModel.dart';

class CategoryGenerator extends StatelessWidget {
  const CategoryGenerator({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      height: 100,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        image: DecorationImage(
            image: AssetImage(categoryModel.imagetext), fit: BoxFit.fill),
      ),
      child: Text(
        categoryModel.name,
        style: const TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}
