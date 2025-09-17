import 'package:fit_fusion/core/utils/app_styler.dart';
import 'package:fit_fusion/features/Activity/presentation/views_models/infomodel.dart';
import 'package:fit_fusion/features/Activity/presentation/widgets/info_section.dart';
import 'package:flutter/material.dart';

class activityviewbody extends StatelessWidget {
  activityviewbody({super.key});
  final List<Infomodel> infomodel = [
    Infomodel(firsttext: 'Time', secondtext: '1h 30m'),
    Infomodel(firsttext: 'distance', secondtext: '5.2 KM'),
    Infomodel(firsttext: 'calories', secondtext: '450 Kcal'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 11.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            InfoSection(infomodel: infomodel),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff33263B)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 32.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("weekly activity", style: AppStyle.styleSemiBod20),
                    SizedBox(height: 8),
                    Text("10h", style: AppStyle.styleSemiBod32),
                    SizedBox(height: 8),
                    Text(
                      "Last 7 Days",
                      style: AppStyle.styleRegular16.copyWith(
                        color: Color(0xffAD9CBA),
                      ),
                    ),
                    SizedBox(height: 16),
                    Expanded(child: Align(child: Container())),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
