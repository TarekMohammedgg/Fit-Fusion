import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressIndenticator extends StatelessWidget {
  const ProgressIndenticator({super.key});

  @override
  Widget build(BuildContext context) {
    return  LinearPercentIndicator(
          padding: EdgeInsets.zero,
          width: MediaQuery.of(context).size.width * 0.9,
          lineHeight: 8.0,
          percent: 0.7,
          barRadius: Radius.circular(12),
          backgroundColor: Color(0xff33263B),
          progressColor: Colors.white,
        ); 
  }
}
