import 'package:fit_fusion/features/settings/presentaion/view/widgets/settings_viwe_body.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),
      body: SettingsViweBody(),
    );
  }
}
