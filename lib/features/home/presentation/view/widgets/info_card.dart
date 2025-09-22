import 'package:fit_fusion/core/utils/app_styler.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.firstText,
    required this.secondText,
  });
  final String firstText, secondText;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.12,
      width: screenWidth * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xff33263B),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 24, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(firstText, style: AppStyle.styleMedium16),
            Text(secondText, style: AppStyle.styleSemiBod24),
          ],
        ),
      ),
    );
  }
}
