import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/categoryModel.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final int index;
  const CategoryItem({
    super.key,
    required this.category,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(15),
            topLeft: const Radius.circular(15),
            bottomLeft: Radius.circular(index % 2 == 0 ? 20 : 0),
            bottomRight: Radius.circular(index % 2 == 0 ? 0 : 20),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            category.imagePath,
            height: MediaQuery.of(context).size.height * .15,
          ),
          Text(
            category.title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
