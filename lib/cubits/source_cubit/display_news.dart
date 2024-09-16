import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/source_cubit/display_news_view_model_cubit.dart';
import 'package:news_app/cubits/source_cubit/source_states.dart';
import 'package:news_app/models/categoryModel.dart';
import 'package:news_app/widgets/tab_widget.dart';

class DisplayNews extends StatefulWidget {
  CategoryModel categoryModel;
  DisplayNews({super.key, required this.categoryModel});

  @override
  State<DisplayNews> createState() => _DisplayNewsState();
}

class _DisplayNewsState extends State<DisplayNews> {
  DisplayNewsViewModelCubit viewModel = DisplayNewsViewModelCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.categoryModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: BlocBuilder<DisplayNewsViewModelCubit, SourceStates>(
            bloc: viewModel,
            builder: (context, state) {
              if (state is SourceLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
              } else if (state is SourceErrorState) {
                return Column(
                  children: [
                    Text(
                      state.errorMessage,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.getSources(widget.categoryModel.id);
                      },
                      child: const Text("Try Again"),
                    ),
                  ],
                );
              } else if (state is SourceSuccessState) {
                var sourceList = state.sourceList;

                return TabWidget(sourceList: sourceList);
              }
              return Container();
            },
          ),

          //  FutureBuilder(
          //     future: Api.getSources(widget.categoryModel.id),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return const Center(
          //             child: CircularProgressIndicator(
          //           color: Colors.green,
          //         ));
          //       } else if (snapshot.hasError) {
          //         return Column(children: [
          //           const Text(
          //             "Something Went Wrong, check Internet",
          //             style: TextStyle(
          //               fontSize: 20,
          //               fontWeight: FontWeight.w400,
          //               color: Colors.black,
          //             ),
          //           ),
          //           ElevatedButton(
          //             onPressed: () {
          //               Api.getSources(widget.categoryModel.id);
          //               setState(() {});
          //             },
          //             child: Text("Try Again"),
          //           ),
          //         ]);
          //       } else if (snapshot.data!.status != 'ok') {
          //         return Text(
          //           snapshot.data!.message!,
          //           style: const TextStyle(
          //             fontSize: 20,
          //             fontWeight: FontWeight.w400,
          //             color: Colors.black,
          //           ),
          //         );
          //       }

          //       var sourceList = snapshot.data!.sources;

          //       return TabWidget(sourceList: sourceList!);
          //     },
          //     ),
        ),
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
    );
  }
}
