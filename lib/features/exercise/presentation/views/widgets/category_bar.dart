import 'package:fit_fusion/features/exercise/data/models/catergory_model.dart';
import 'package:fit_fusion/features/exercise/presentation/views/widgets/category_item.dart';
import 'package:fit_fusion/features/exercise/data/models/exercise_model.dart';
import 'package:flutter/material.dart';

class CategoryBar extends StatefulWidget {
  final Function(Set<String>) onFilterChanged;

  const CategoryBar({super.key, required this.onFilterChanged});

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  final List<CatergoryModel> categories = [
    CatergoryModel(title: Muscle.all.name),
    CatergoryModel(title: Muscle.abdominals.name),
    CatergoryModel(title: Muscle.abductors.name),
    CatergoryModel(title: Muscle.adductors.name),
    CatergoryModel(title: Muscle.biceps.name),
    CatergoryModel(title: Muscle.calves.name),
    CatergoryModel(title: Muscle.chest.name),
    CatergoryModel(title: Muscle.forearms.name),
    CatergoryModel(title: Muscle.glutes.name),
    CatergoryModel(title: Muscle.hamstrings.name),
    CatergoryModel(title: Muscle.lats.name),
    CatergoryModel(title: Muscle.lowerBack.name),
    CatergoryModel(title: Muscle.middleBack.name),
    CatergoryModel(title: Muscle.neck.name),
    CatergoryModel(title: Muscle.quadriceps.name),
    CatergoryModel(title: Muscle.traps.name),
    CatergoryModel(title: Muscle.triceps.name),
  ];

  Set<String> selectedFilters = {Muscle.all.name};

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final title = categories[index].title;
          final isSelected = selectedFilters.contains(title); // true , false

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CategoryItem(
              title: title,
              isSelected: isSelected,
              onSelected: (value) {
                setState(() {
                  if (title == Muscle.all.name) {
                    if (value) {
                      selectedFilters = {Muscle.all.name};
                    } else {
                      if (selectedFilters.length == 1 &&
                          selectedFilters.contains(Muscle.all.name)) {
                        return;
                      } else {
                        selectedFilters.remove(title);
                      }
                    }
                  } else {
                    if (value) {
                      selectedFilters.remove(Muscle.all.name);
                      selectedFilters.add(title);
                    } else {
                      selectedFilters.remove(title);
                      if (selectedFilters.isEmpty) {
                        selectedFilters = {Muscle.all.name};
                      }
                    }
                  }

                  widget.onFilterChanged(selectedFilters);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
