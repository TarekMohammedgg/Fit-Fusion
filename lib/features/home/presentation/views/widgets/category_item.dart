import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onSelected,
  });

  final String title;
  final bool isSelected;
  final Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(title),
      selected: isSelected,
      onSelected: onSelected,
    );
  }
}
