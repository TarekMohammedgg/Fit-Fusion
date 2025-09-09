import 'package:fit_fusion/core/models/list_tile_model.dart';
import 'package:fit_fusion/core/utils/app_styler.dart';
import 'package:fit_fusion/features/home/presentation/view/widgets/avatar_card.dart';
import 'package:flutter/material.dart';

class SettingsViweBody extends StatelessWidget {
  SettingsViweBody({super.key});
  List<ListTileModel> accountItems = [
    ListTileModel(title: "Notifications", icon: Icons.notifications_outlined),
    ListTileModel(title: "Privacy", icon: Icons.shield_outlined),
    ListTileModel(title: "Security", icon: Icons.lock),
  ];
  List<ListTileModel> preferencesItems = [
    ListTileModel(title: "Language", icon: Icons.language, trialing: "English"),
    ListTileModel(
      title: "Theme",
      icon: Icons.dark_mode_outlined,
      trialing: "Dark",
    ),
    ListTileModel(
      title: "Unit",
      icon: Icons.straighten_outlined,
      trialing: "metric",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 11.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AvatarCard(),
            SizedBox(height: 16),
            Text("Account", style: AppStyle.styleSemiBod20),
            SizedBox(height: 8),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.21,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),

                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: accountItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xff33263B),
                      ),
                      child: Icon(
                        accountItems[index].icon,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(accountItems[index].title),
                    trailing: Icon(Icons.arrow_forward_sharp),
                  );
                },
              ),
            ),

            SizedBox(height: 12),
            Text("Preferences", style: AppStyle.styleSemiBod20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.21,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: preferencesItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xff33263B),
                      ),
                      child: Icon(
                        preferencesItems[index].icon,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(preferencesItems[index].title),
                    trailing: Text(preferencesItems[index].trialing),
                  );
                },
              ),
            ),
            Text("Support", style: AppStyle.styleSemiBod20),
            CustomListTile(
              title: "Help Center",
              icon: Icons.contact_support_outlined,
            ),
            CustomListTile(title: "Contact", icon: Icons.email_outlined),
            CustomListTile(title: "About", icon: Icons.info_outline),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xff33263B),
        ),
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_sharp),
    );
  }
}
