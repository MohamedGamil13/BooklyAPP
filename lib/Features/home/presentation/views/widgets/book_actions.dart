import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomTextButton(
            fontWeight: FontWeight.bold,
            text: 'Free',
            backGroundColor: Colors.white,
            textColor: Colors.black,

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            onPressed: () {},
          ),
        ),
        Expanded(
          child: CustomTextButton(
            fontWeight: FontWeight.w500,
            text: 'Free Preview',
            backGroundColor: Color(0xffef8262),
            textColor: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            onPressed: () {
              openExternalUrl(book.volumeInfo.previewLink!);
            },
          ),
        ),
      ],
    );
  }
}

Future<void> openExternalUrl(String link) async {
  final Uri url = Uri.parse(link);
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}
