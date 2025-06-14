import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

class Loader extends StatelessWidget {
  const Loader({super.key, this.scale = 1});

  final double scale;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: const CircularProgressIndicator(
        color: AppColor.primaryColor,
        semanticsLabel: 'Circular Progress Bar',
      ),
    );
  }
}
