import 'package:fit_fusion/core/utils/app_styler.dart';
import 'package:fit_fusion/core/utils/assets.dart';
import 'package:flutter/material.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image.asset(Assets.imagesAvatarsPerson),
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 30, end: 100),
          curve: Curves.easeInCirc,
          duration: const Duration(seconds: 2),
          builder: (context, value, child) {
            return Image.asset(
              Assets.imagesAvatarsPerson,
              height: value,
              width: value,
            );
          },
        ),

        Image.asset(Assets.imagesAvatarsPerson, height: 140, width: 100),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Diaa Eldin", style: AppStyle.styleSemiBod24),
            Text("Level 10 ", style: AppStyle.styleRegular14),
          ],
        ),
      ],
    );
  }
}
