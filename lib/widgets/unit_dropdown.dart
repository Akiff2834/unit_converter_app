import 'package:flutter/material.dart';
import '../models/conversion_unit.dart';

/// Reusable dropdown for unit selection
class UnitDropdown extends StatelessWidget {
  final List<ConversionUnit> units;
  final ConversionUnit? selectedUnit;
  final ValueChanged<ConversionUnit?> onChanged;
  final String label;

  const UnitDropdown({
    super.key,
    required this.units,
    required this.selectedUnit,
    required this.onChanged,
    this.label = 'Select Unit',
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<ConversionUnit>(
      value: selectedUnit,
      decoration: InputDecoration(
        labelText: label,
      ),
      items: units.map((unit) {
        return DropdownMenuItem<ConversionUnit>(
          value: unit,
          child: Text('${unit.name} (${unit.symbol})'),
        );
      }).toList(),
      onChanged: onChanged,
      validator: (value) {
        if (value == null) {
          return 'Please select a unit';
        }
        return null;
      },
    );
  }
}
