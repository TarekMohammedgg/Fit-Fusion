import 'package:fit_fusion/core/utils/app_styler.dart';
import 'package:fit_fusion/core/utils/assets.dart';
import 'package:flutter/material.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({super.key, required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.imagesAvatarsPerson, height: 70, width: 70),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(userName, style: AppStyle.styleSemiBod24)],
        ),
      ],
    );
  }
}
