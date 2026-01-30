import 'package:flutter/material.dart';
import '../models/conversion_category.dart';

/// Horizontal scrollable category selector
class CategorySelector extends StatelessWidget {
  final ConversionCategory selectedCategory;
  final ValueChanged<ConversionCategory> onCategorySelected;

  const CategorySelector({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ConversionCategory.values.length,
        itemBuilder: (context, index) {
          final category = ConversionCategory.values[index];
          final isSelected = category == selectedCategory;

          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: FilterChip(
              selected: isSelected,
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _getIconData(category.iconName),
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(category.displayName),
                ],
              ),
              onSelected: (_) => onCategorySelected(category),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          );
        },
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'straighten':
        return Icons.straighten;
      case 'fitness_center':
        return Icons.fitness_center;
      case 'thermostat':
        return Icons.thermostat;
      case 'attach_money':
        return Icons.attach_money;
      case 'water_drop':
        return Icons.water_drop;
      case 'crop_square':
        return Icons.crop_square;
      case 'speed':
        return Icons.speed;
      case 'schedule':
        return Icons.schedule;
      default:
        return Icons.category;
    }
  }
}
