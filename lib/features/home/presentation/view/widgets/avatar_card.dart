import 'package:fit_fusion/core/utils/app_styler.dart';
import 'package:fit_fusion/core/utils/assets.dart';
import 'package:flutter/material.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({super.key, required this.userName});
  final String userName ; 
  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userName, style: AppStyle.styleSemiBod24),
          ],
        ),
      ],
    );
  }
}
