import 'package:flutter/material.dart';

import '../../widgets/home/home_details_body.dart';

class HomeDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String activiteTitle;
  final String activiteDescription;
  final String activiteAuthor;

  const HomeDetailsScreen(
      {required this.imageUrl,
      required this.activiteTitle,
      required this.activiteDescription,
      required this.activiteAuthor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: HomeDetailsBody(
        imageUrl: imageUrl,
        activiteTitle: activiteTitle,
        activiteDescription: activiteDescription,
        activiteAuthor: activiteAuthor,
      ),
    );
  }
}
