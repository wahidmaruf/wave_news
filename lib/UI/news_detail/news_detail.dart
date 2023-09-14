import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wavenews/UI/common/custom_image_widget.dart';
import 'package:wavenews/models/news_article.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail({required this.news, super.key});

  final NewsArticle news;

  Future<bool> _launchURL(BuildContext context, String urlString) async {
    final Uri url = Uri.parse(urlString);
    return await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  _showErrorSnackBar(BuildContext context, bool isLaunched) {
    if (!isLaunched) {
      return;
    }
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Error!',
        message: 'Unable to open the link. Try again later!',
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
    if (kDebugMode) {
      print("Unable to open web page");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.surfaceTint,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.link),
            onPressed: () async {
              bool isLaunched = await _launchURL(context, news.link);
              if (isLaunched && context.mounted) {
                _showErrorSnackBar(context, !isLaunched);
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomImageWidget(
              width: MediaQuery.of(context).size.width,
              height: 250,
              imageUrl: news.imageUrl,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    news.title,
                    style: GoogleFonts.urbanist(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    news.getFormattedPublishedAt(),
                    style: GoogleFonts.openSans(
                        fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "By ${news.getCreators()}",
                    style: GoogleFonts.urbanist(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${news.sourceId.toUpperCase()}  |  ${news.getCountries()}",
                    style: GoogleFonts.urbanist(
                        fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    news.description,
                    style: GoogleFonts.openSans(
                        fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    news.content,
                    style: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
