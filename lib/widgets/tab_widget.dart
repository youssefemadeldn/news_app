import 'package:flutter/material.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/cubits/new_cubit/news_widget.dart';
import 'package:news_app/widgets/source_tab_item.dart';

class TabWidget extends StatefulWidget {
  List<Sources> sourceList;

  TabWidget({super.key, required this.sourceList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        children: [
          TabBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              unselectedLabelColor: Colors.transparent,
              labelColor: Colors.transparent,
              dividerColor: Colors.transparent,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.sourceList
                  .map(
                    (e) => SourceTabItem(
                      source: e,
                      isSelected: selectedIndex == widget.sourceList.indexOf(e),
                    ),
                  )
                  .toList()),
          SizedBox(
            height: 1000,
            child: NewsWidget(
              source: widget.sourceList[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
