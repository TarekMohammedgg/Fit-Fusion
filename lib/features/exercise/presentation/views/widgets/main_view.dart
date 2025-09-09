import 'package:fit_fusion/features/exercise/presentation/views/widgets/custombottomnavbar.dart';
import 'package:fit_fusion/features/exercise/presentation/views/widgets/exercise_view_body.dart';
import 'package:fit_fusion/features/goals/presentation/views/goal_view.dart';
import 'package:fit_fusion/features/home/presentation/view/home_view.dart';
import 'package:fit_fusion/features/settings/presentaion/view/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:fit_fusion/features/exercise/presentation/views/widgets/exercise_model.dart';

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
    filters = {ExercisFilter.All.name};
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
      const Center(
        child: Text(
          'Activity Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      SettingsView() ,
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
