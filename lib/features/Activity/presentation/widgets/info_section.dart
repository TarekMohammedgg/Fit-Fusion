import 'package:fit_fusion/features/Activity/presentation/views_models/infomodel.dart';
import 'package:fit_fusion/features/home/presentation/view/widgets/info_card.dart';
import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key, required this.infomodel});
  final List<Infomodel> infomodel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: InfoCard(
                firstText: infomodel[0].firsttext,
                secondText: infomodel[0].secondtext,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: InfoCard(
                firstText: infomodel[1].firsttext,
                secondText: infomodel[1].secondtext,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: InfoCard(
                firstText: infomodel[2].firsttext,
                secondText: infomodel[2].secondtext,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
