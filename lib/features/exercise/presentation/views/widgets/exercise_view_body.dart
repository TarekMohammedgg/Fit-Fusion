import 'package:fit_fusion/core/utils/app_styler.dart';
import 'package:fit_fusion/features/exercise/presentation/views/widgets/custom_sliver_list_view.dart';
import 'package:fit_fusion/features/exercise/presentation/views/widgets/category_bar.dart';
import 'package:flutter/material.dart';

class ExerciseViewBody extends StatefulWidget {
  ExerciseViewBody({super.key, required this.filters});
  Set<String> filters = {};

  @override
  State<ExerciseViewBody> createState() => _ExerciseViewBodyState();
}

class _ExerciseViewBodyState extends State<ExerciseViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
               onFilterChanged : (value) {
                  setState(() => widget.filters = value);
                },
              ),
            ),
            CustomSliverListView(filters: widget.filters),
          ],
        ),
      ),
    );
  }
}
