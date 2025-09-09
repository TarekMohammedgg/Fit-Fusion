import 'package:fit_fusion/features/exercise/data/models/catergory_model.dart';
import 'package:fit_fusion/features/exercise/presentation/views/widgets/category_item.dart';
import 'package:fit_fusion/features/exercise/presentation/views/widgets/exercise_model.dart';
import 'package:flutter/material.dart';

class CategoryBar extends StatefulWidget {
  final Function(Set<String>) onFilterChanged;

  const CategoryBar({super.key, required this.onFilterChanged});

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  final List<CatergoryModel> categories = [
    CatergoryModel(title: ExercisFilter.All.name),
    CatergoryModel(title: ExercisFilter.Push.name),
    CatergoryModel(title: ExercisFilter.Pull.name),
    CatergoryModel(title: ExercisFilter.Legs.name),
  ];

  Set<String> selectedFilters = {ExercisFilter.All.name};

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
                  if (title == ExercisFilter.All.name) {
                    if (value) {
                      selectedFilters = {ExercisFilter.All.name};
                    } else {
                      if (selectedFilters.length == 1 &&
                          selectedFilters.contains(ExercisFilter.All.name)) {
                        return; 
                      } else {
                        selectedFilters.remove(title);
                      }
                    }
                  } else {
                    if (value) {
                      selectedFilters.remove(ExercisFilter.All.name);
                      selectedFilters.add(title);
                    } else {
                      selectedFilters.remove(title);
                      if (selectedFilters.isEmpty) {
                        selectedFilters = {ExercisFilter.All.name};
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
