import 'package:flutter/material.dart';
import 'package:news_app/apis/api.dart';
import 'package:news_app/widgets/display_news.dart';
import 'package:news_app/widgets/tab_widget.dart';

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
        drawer: Drawer(),
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
          title: const Text(
            "News APP",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.green,
        ),
        body: const DisplayNews(),
      ),
    );
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