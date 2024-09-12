import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String imagePath;
  String title;
  Color color;

  CategoryModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.color,
  });
//       technology
  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          id: 'business',
          title: 'Business',
          imagePath: 'assets/images/business.png',
          color: Colors.brown),
      CategoryModel(
          id: 'entertainment',
          title: 'Entertainment',
          imagePath: 'assets/images/environment.png',
          color: Colors.blue.withOpacity(.7)),
      CategoryModel(
          id: 'general',
          title: 'General',
          imagePath: 'assets/images/politics.png',
          color: Colors.blue),
      CategoryModel(
          id: 'health',
          title: 'Health',
          imagePath: 'assets/images/health.png',
          color: Colors.pink),
      CategoryModel(
          id: 'science',
          title: 'Science',
          imagePath: 'assets/images/science.png',
          color: Colors.yellow),
      CategoryModel(
          id: 'sports',
          title: 'Sports',
          imagePath: 'assets/images/sports.png',
          color: Colors.red),
    ];
  }
}
