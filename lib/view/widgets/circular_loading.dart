import 'package:flutter/material.dart';

import '../../const.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
          color: kblue,
        ),
      );
  }
}
