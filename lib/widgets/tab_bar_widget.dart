import 'package:flutter/material.dart';
import 'package:news_app/apis/api.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/widgets/source_item.dart';

class TabBarWidget extends StatefulWidget {
  TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Api.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          showErrorDialog(context, snapshot);
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
                  (e) => SourceItem(
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

  Future<dynamic> showErrorDialog(
      BuildContext context, AsyncSnapshot<SourceModel> snapshot) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(snapshot.error.toString()),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Ok"),
          ),
        ],
      ),
    );
  }
}
