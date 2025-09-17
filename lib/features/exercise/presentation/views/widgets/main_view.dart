<<<<<<< HEAD
import 'package:fit_fusion/features/exercise/presentation/views/widgets/custom_bottom_nav_bar.dart';
=======
import 'package:fit_fusion/features/Activity/presentation/activity_view.dart';
import 'package:fit_fusion/features/exercise/presentation/views/widgets/custombottomnavbar.dart';
>>>>>>> origin/diaa_branch
import 'package:fit_fusion/features/exercise/presentation/views/widgets/exercise_view_body.dart';
import 'package:fit_fusion/features/goals/presentation/views/goal_view.dart';
import 'package:fit_fusion/features/home/presentation/view/home_view.dart';
import 'package:fit_fusion/features/settings/presentaion/view/settings_view.dart';
import 'package:fl_chart/fl_chart.dart';
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
<<<<<<< HEAD
      ChartSection(),
=======
      ActivityView(),

>>>>>>> origin/diaa_branch
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
          children: [
         
            const SizedBox(height: 16),
            // الرسم البياني
            SizedBox(
              height: 180,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 12,
                  barTouchData: BarTouchData(enabled:false ),
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          const style = TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          );
                          Widget text;
                          switch (value.toInt()) {
                            case 0:
                              text = const Text('Mon', style: style);
                              break;
                            case 1:
                              text = const Text('Tue', style: style);
                              break;
                            case 2:
                              text = const Text('Wed', style: style);
                              break;
                            case 3:
                              text = const Text('Thu', style: style);
                              break;
                            case 4:
                              text = const Text('Fri', style: style);
                              break;
                            case 5:
                              text = const Text('Sat', style: style);
                              break;
                            case 6:
                              text = const Text('Sun', style: style);
                              break;
                            default:
                              text = const Text('', style: style);
                              break;
                          }
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            space: 8.0,
                            child: text,
                          );
                        },
                        reservedSize: 30,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: List.generate(7, (index) {
                    return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: 14, // قيمة موحدة عشان كل الأعمدة شبه بعض
                          color: Colors.deepPurple.shade300,
                          width: 18,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
