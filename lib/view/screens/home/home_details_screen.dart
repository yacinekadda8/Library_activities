import 'package:flutter/material.dart';

import '../../widgets/home/home_details_body.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeDetailsBody(),
    );
  }
}