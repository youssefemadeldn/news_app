import 'package:flutter/material.dart';
import 'package:news_app/apis/api.dart';
import 'package:news_app/models/categoryModel.dart';
import 'package:news_app/widgets/source_tab_item.dart';

class TabBarWidget extends StatefulWidget {
  CategoryModel categoryModel;
  TabBarWidget({super.key, required this.categoryModel});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Api.getSources(widget.categoryModel.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "something went wrong, check internet",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Api.getSources(widget.categoryModel.id);
                    setState(() {});
                  },
                  child: const Text(
                    "try again",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        if (snapshot.data!.status != 'ok') {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  snapshot.data!.message!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Api.getSources(widget.categoryModel.id);
                    setState(() {});
                  },
                  child: const Text(
                    "try again",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        var listSources = snapshot.data?.sources ?? [];

        return DefaultTabController(
          length: listSources.length,
          child: TabBar(
            padding: EdgeInsets.only(top: 12),
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            isScrollable: true,
            onTap: (value) {
              selectedTabIndex = value;
              setState(() {});
            },
            tabs: listSources
                .map(
                  (e) => SourceTabItem(
                    source: e,
                    isSelected: listSources.elementAt(selectedTabIndex) == e,
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
