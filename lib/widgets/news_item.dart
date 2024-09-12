import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/news_model.dart';

class NewsItem extends StatelessWidget {
  final Articles article;
  const NewsItem({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.fill,
              imageUrl: article.urlToImage ?? '',
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(
            article.author ?? '',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: const Color(0XFF79828B),
            ),
          ),
          Text(
            article.title ?? '',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          Text(
            article.publishedAt?.substring(0, 10) ?? '',
            textAlign: TextAlign.end,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: const Color(0XFF79828B),
            ),
          ),
        ],
      ),
    );
  }
}
