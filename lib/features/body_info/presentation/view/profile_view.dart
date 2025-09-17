import 'package:fit_fusion/features/body_info/presentation/view/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0F0C13),
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios_new),
        title: const Text(
          "Goals",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
       
      ),
      body: ProfileViewBody(),
    );
  }
}
