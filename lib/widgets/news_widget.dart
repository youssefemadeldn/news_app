import 'package:flutter/material.dart';
import 'package:news_app/apis/api.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/widgets/news_item.dart';

class NewsWidget extends StatefulWidget {
  Sources source;
  NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsModel?>(
      future: Api.getEverythingNews(widget.source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            // height: MediaQuery.of(context).size.height * .8,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              const Center(
                child: Text("Something went wrong ,check interNet"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "try again",
                ),
              ),
            ],
          );
        } else if (snapshot.data!.status != "ok") {
          return Column(
            children: [
              Center(
                child: Text(snapshot.data!.message!),
              ),
              ElevatedButton(
                onPressed: () {
                  Api.getEverythingNews(widget.source.id ?? '');
                  setState(() {});
                },
                child: const Text(
                  "try again",
                ),
              ),
            ],
          );
        }

        var listArticles = snapshot.data?.articles ?? [];

        return ListView.builder(
          itemCount: listArticles.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: NewsItem(
              article: listArticles[index],
            ),
          ),
        );
      },
    );
  }
}


    // Container(
    //   width: 360.58,
    //   height: 310.5,
    //   decoration: const BoxDecoration(
    //     color: Colors.transparent,
    //   ),
    //   child: Column(
    //     children: [
    //       Image.network(
    //         "${listArticles[index].urlToImage}",
    //         height: 232.5,
    //         width: 360.58,
    //       ),
    //       Text(
    //         listArticles[index].title!,
    //         style: GoogleFonts.poppins(
    //           fontWeight: FontWeight.w400,
    //           fontSize: 10,
    //           color: const Color(0XFF79828B),
    //         ),
    //       ),
    //       Text(
    //         "${listArticles[index].description}",
    //         style: GoogleFonts.poppins(
    //           fontWeight: FontWeight.w500,
    //           fontSize: 14,
    //           color: const Color(0XFF42505C),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
