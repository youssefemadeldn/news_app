import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/apis/api.dart';
import 'package:news_app/widgets/tab_bar_widget.dart';
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
        body: Column(
          children: [
            SizedBox(
                height: 60,
                child: FutureBuilder(
                    future: Api.getSources(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: Colors.green,
                        ));
                      } else if (snapshot.hasError) {
                        return Column(children: [
                          const Text(
                            "Something Went Wrong, check Internet",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Api.getSources();
                              setState(() {});
                            },
                            child: Text("Try Again"),
                          ),
                        ]);
                      } else if (snapshot.data!.status != 'ok') {
                        return Text(
                          snapshot.data!.message!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        );
                      }

                      var sourceList = snapshot.data!.sources;

                      return TabWidget(sourceList: sourceList!);
                    })),
            // FutureBuilder(
            //   future: Api.getEverythingNews("abc-news-au"),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return SizedBox(
            //           height: MediaQuery.of(context).size.height * .8,
            //           child: Center(child: CircularProgressIndicator()));
            //     } else if (snapshot.hasError) {
            //       return const Center(child: Text("Something went wrong"));
            //     }

            //     var listArticles = snapshot.data?.articles ?? [];

            //     return Expanded(
            //       child: ListView.builder(
            //         itemCount: listArticles.length,
            //         itemBuilder: (context, index) => Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Container(
            //             width: 360.58,
            //             height: 310.5,
            //             decoration: BoxDecoration(
            //               color: Colors.transparent,
            //             ),
            //             child: Column(
            //               children: [
            //                 Image.asset(
            //                   "assets/images/news_image.png",
            //                   height: 232.5,
            //                   width: 360.58,
            //                 ),
            //                 Text(
            //                   "news source",
            //                   style: GoogleFonts.poppins(
            //                     fontWeight: FontWeight.w400,
            //                     fontSize: 10,
            //                     color: const Color(0XFF79828B),
            //                   ),
            //                 ),
            //                 Text(
            //                   "Why are football's biggest clubs starting a new tournament?",
            //                   style: GoogleFonts.poppins(
            //                     fontWeight: FontWeight.w500,
            //                     fontSize: 14,
            //                     color: const Color(0XFF42505C),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            // )
          ],
        ),
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