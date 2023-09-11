import 'package:flutter/material.dart';

import '../../../const.dart';
import '../../../utils/my_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ActivityTile extends StatelessWidget {
  final String imgUrl, title, body, author;

  const ActivityTile({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.body,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(children: [
        Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                fit: BoxFit.cover,
              ),
            )),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.black45.withOpacity(.3),
              borderRadius: BorderRadius.circular(15)),
          height: MediaQuery.of(context).size.height / 4,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: MyStyles.textStyle20.copyWith(color: kblue),
                ),
                Text(
                  body,
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: MyStyles.textStyle14.copyWith(color: kgrey),
                ),
                // Text(
                //   author,
                //   textAlign: TextAlign.center,
                //   style: MyStyles.textStyle20.copyWith(color: kgreyColor),
                // ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
