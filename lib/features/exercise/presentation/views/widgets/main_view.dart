import 'package:fit_fusion/features/Activity/presentation/activity_view.dart';
import 'package:fit_fusion/features/exercise/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:fit_fusion/features/exercise/presentation/views/widgets/exercise_model.dart';
import 'package:fit_fusion/features/exercise/presentation/views/widgets/exercise_view_body.dart';
import 'package:fit_fusion/features/goals/presentation/views/goal_view.dart';
import 'package:fit_fusion/features/home/presentation/view/home_view_body.dart';
import 'package:fit_fusion/features/settings/presentaion/view/settings_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String id = 'homepage';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  Set<String> filters = {};

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    filters = {Muscle.all.name};
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> get _screens {
    var list = [
      const HomeView(),
      ExerciseViewBody(filters: filters),
      GoalsView(),

      ActivityView(),

      SettingsView(),
    ];
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],

      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onNavItemTapped,
      ),
    );
  }
}

class ChartSection extends StatelessWidget {
  const ChartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color(0xff141217), // خلفية داكنة
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // يخلي العمود ياخد أقل مساحة
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [const SizedBox(height: 16)],
        ),
      ),
    );
  }
}
