import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';
import '../../../utils/my_styles.dart';

class HomeDetailsBody extends StatelessWidget {
  final String imageUrl;
  final String activiteTitle;
  final String activiteDescription;
  final String activiteAuthor;
  const HomeDetailsBody(
      {required this.imageUrl,
      required this.activiteTitle,
      required this.activiteDescription,
      required this.activiteAuthor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amberAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ListView(
              children: [
                Text(
                  activiteTitle,
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  style: MyStyles.textStyle30.copyWith(color: kdark),
                ),
                Text(
                  activiteDescription,
                  textAlign: TextAlign.start,
                  style: MyStyles.textStyle20.copyWith(color: kgrey),
                ),
                Text(
                  'by: $activiteAuthor',
                  textAlign: TextAlign.start,
                  style: MyStyles.textStyle20.copyWith(color: kblue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
