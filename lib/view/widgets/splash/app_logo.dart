import 'package:application_bibliotheque/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
            double mqwidth = MediaQuery.of(context).size.width;

    return SizedBox(
      child: SvgPicture
      .asset(MyAssets.mylogo,
          fit: BoxFit.fitHeight,
          height: mqwidth / 6,
          width: mqwidth / 3,
          colorFilter: const ColorFilter.mode(kprimaryColor, BlendMode.srcIn),
          semanticsLabel: 'A red up arrow'),
    );
  }
}
