import 'package:fit_fusion/core/utils/app_styler.dart';
import 'package:fit_fusion/features/home/presentation/views/widgets/Customgridscrollview.dart';
import 'package:fit_fusion/features/home/presentation/views/widgets/category_bar.dart';
import 'package:fit_fusion/features/home/presentation/views/widgets/exercise_model.dart';
import 'package:flutter/material.dart';

class Homeviewbody extends StatefulWidget {
  Homeviewbody({super.key});
  static const String id = 'homepage';

  @override
  State<Homeviewbody> createState() => _HomeviewbodyState();
}

class _HomeviewbodyState extends State<Homeviewbody> {
  @override
  bool isselected = false;
  List<ExerciseModel> selectedItem = items;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.account_circle)),
        ],
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),

        elevation: 0,
        title: Text('Workouts', style: AppStyle.styleSemiBod24),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(slivers: <Widget>[CustomSliverGridV()]),
      ),
    );
  }
}
