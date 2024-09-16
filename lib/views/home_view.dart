import 'package:flutter/material.dart';
import 'package:news_app/models/categoryModel.dart';
import 'package:news_app/views/setting_tab.dart';
import 'package:news_app/widgets/category_fragment.dart';
import 'package:news_app/cubits/display_news.dart';
import 'package:news_app/widgets/home_drawer.dart';

class HomPage extends StatefulWidget {
  static const String routName = "HomPage";

  HomPage({super.key});

  @override
  State<HomPage> createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/images/pattern.png",
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: HomeDrawer(onDrawerClick: onDrawerClick),
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 35,
              ),
            ),
          ],
          iconTheme: const IconThemeData(
            color: Colors.white,
            size: 30,
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          )),
          title: Text(
            selectedCategory?.title ?? "News App",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.green,
        ),
        body: selectedSideMenu == HomeDrawer.settings
            ? (SettingTab())
            : (selectedCategory == null
                ? (CategoryFragment(onCategoryItemClick: onCategoryItemClick))
                : (DisplayNews(
                    categoryModel: selectedCategory!,
                  ))),
      ),
    );
  }

  CategoryModel? selectedCategory;
  void onCategoryItemClick(CategoryModel newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }

  int selectedSideMenu = HomeDrawer.categories;
  void onDrawerClick(int newSideMenu) {
    selectedSideMenu = newSideMenu;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}




/*

 FutureBuilder(
          future: Api.getSources(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              showErrorDialog(context, snapshot);
            } else if (snapshot.hasData) {
              var listSources = snapshot.data!.sources;

              if (listSources!.isEmpty) {
                return const Center(child: Text("No data available"));
              }

              return ListView.builder(
                itemCount: listSources.length,
                itemBuilder: (context, index) =>
                    Text(listSources[index].name ?? ""),
              );
            }
            return const Center(child: Text('No data found'));
          },
        ),
*/