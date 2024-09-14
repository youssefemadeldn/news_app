import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/categoryModel.dart';
import 'package:news_app/widgets/category_item.dart';

class CategoryFragment extends StatelessWidget {
  var categoryList = CategoryModel.getCategories();
  Function onCategoryItemClick;
  CategoryFragment({super.key, required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pick your category \nof interest",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 25,
              // color: const Color(0XFF79828B),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    onCategoryItemClick(categoryList[i]);
                  },
                  child: CategoryItem(
                    category: categoryList[i],
                    index: i,
                  ),
                );
              },
              itemCount: categoryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
