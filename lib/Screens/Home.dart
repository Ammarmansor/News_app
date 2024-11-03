import 'package:flutter/material.dart';
import 'package:news_app/Screens/Business.dart';
import 'package:news_app/Screens/Entertainment.dart';
import 'package:news_app/Screens/GeneralScreen.dart';
import 'package:news_app/Screens/HealthScreen.dart';
import 'package:news_app/Screens/ScienceScreen.dart';
import 'package:news_app/Screens/Sports.dart';
import 'package:news_app/Screens/TechnologyScreen.dart';
import 'package:news_app/Service/Service.dart';
import 'package:news_app/Widgets/CategoryGenerator.dart';
import 'package:news_app/Widgets/NewsTile.dart';
import 'package:news_app/models/CategoryModel.dart';
import 'package:news_app/models/Newstilemodel.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<NewsTileModel>> newsTileModelList =
      Service().TopHeadLines();

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
                        child: GestureDetector(
                          onTap: () {
                            if (index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BusinessScreen(),
                              ),
                            );
                          }else if (index == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EntertainmentScreen(),
                              ),
                            );
                          }else if (index == 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>GeneralScreen(),
                              ),
                            );
                          }else if (index == 3) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>HealthScreen(),
                              ),
                            );
                          }else if (index == 4) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>ScienceScreen(),
                              ),
                            );
                          }else if (index == 5) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>SportsScreen(),
                              ),
                            );
                          }else if (index == 6) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>TechnologyScreen(),
                              ),
                            );
                          }
                          },
                          child: CategoryGenerator(
                              categoryModel: categoryModel[index]),
                        ),
                      );
                    },
                  ),
                );
              },
              childCount: 1, // We only need one item for the horizontal list
            ),
          ),
          FutureBuilder<List<NewsTileModel>>(
            future: newsTileModelList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: Center(child: Text('Error: ${snapshot.error}')),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(child: Text('No news available')),
                );
              } else {
                // Data is available; use its length as the childCount
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final newsTile = snapshot.data![index];
                      return NewsTile(
                        imageurl: newsTile.imageurl ??
                            'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
                        title: newsTile.title,
                        description: newsTile.description,
                      );
                    },
                    childCount: snapshot.data!.length,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
