import 'package:flutter/material.dart';
import 'package:news_app/apis/api.dart';
import 'package:news_app/models/source_model.dart';

class HomPage extends StatelessWidget {
  static const String routName = "HomPage";
  const HomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
      ),
      body: FutureBuilder(
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
