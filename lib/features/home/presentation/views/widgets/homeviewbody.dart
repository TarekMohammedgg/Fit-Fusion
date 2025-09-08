import 'package:fit_fusion/features/home/presentation/views/widgets/Customgridscrollview.dart';
import 'package:fit_fusion/features/home/presentation/views/widgets/custombottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:fit_fusion/core/utils/app_styler.dart';
import 'package:fit_fusion/features/home/presentation/views/widgets/category_bar.dart';
import 'package:fit_fusion/features/home/presentation/views/widgets/exercise_model.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});
  static const String id = 'homepage';

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workouts', style: AppStyle.styleSemiBod24),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // TODO: implement drawer or menu action
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: navigate to profile page
            },
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: CategoryBar(
                onFilterChanged: (value) {
                  setState(() => filters = value);
                },
              ),
            ),
            CustomSliverGridView(filters: filters),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onNavItemTapped,
      ),
    );
  }
}
