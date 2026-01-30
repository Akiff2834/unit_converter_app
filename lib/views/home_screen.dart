import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../models/conversion_category.dart';
import '../models/conversion_unit.dart';
import '../providers/converter_provider.dart';
import '../widgets/category_selector.dart';
import '../widgets/unit_dropdown.dart';
import '../widgets/conversion_result_card.dart';

/// Home screen with conversion interface
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _inputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit Converter'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'History',
            onPressed: () => context.go('/history'),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () => context.go('/settings'),
          ),
        ],
      ),
      body: Consumer<ConverterProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Category Selector
                CategorySelector(
                  selectedCategory: provider.selectedCategory,
                  onCategorySelected: (category) {
                    provider.setCategory(category);
                    _inputController.clear();
                  },
                ),
                const SizedBox(height: 24),

                // Conversion Form
                Form(
                  key: _formKey,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // From Unit Section
                          Text(
                            'From',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: TextFormField(
                                  controller: _inputController,
                                  keyboardType: const TextInputType.numberWithOptions(
                                    decimal: true,
                                    signed: true,
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^-?\d*\.?\d*'),
                                    ),
                                  ],
                                  decoration: const InputDecoration(
                                    labelText: 'Value',
                                    hintText: 'Enter value',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a value';
                                    }
                                    if (double.tryParse(value) == null) {
                                      return 'Please enter a valid number';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    provider.setInputValue(value);
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                flex: 3,
                                child: UnitDropdown(
                                  units: provider.availableUnits,
                                  selectedUnit: provider.fromUnit,
                                  onChanged: (unit) {
                                    provider.setFromUnit(unit!);
                                  },
                                  label: 'Unit',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Swap Button
                          Center(
                            child: IconButton.filled(
                              icon: const Icon(Icons.swap_vert),
                              onPressed: () {
                                provider.swapUnits();
                                if (provider.result != null) {
                                  _inputController.text = provider.result.toString();
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 16),

                          // To Unit Section
                          Text(
                            'To',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          UnitDropdown(
                            units: provider.availableUnits,
                            selectedUnit: provider.toUnit,
                            onChanged: (unit) {
                              provider.setToUnit(unit!);
                            },
                            label: 'Unit',
                          ),
                          const SizedBox(height: 24),

                          // Convert Button
                          FilledButton.icon(
                            onPressed: provider.isLoading
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      provider.performConversion();
                                    }
                                  },
                            icon: provider.isLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Icon(Icons.calculate),
                            label: Text(
                              provider.isLoading ? 'Converting...' : 'Convert',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Result Display
                if (provider.result != null)
                  ConversionResultCard(
                    fromValue: double.tryParse(provider.inputValue) ?? 0,
                    toValue: provider.result!,
                    fromUnit: provider.fromUnit!,
                    toUnit: provider.toUnit!,
                    onSave: () async {
                      await provider.saveToHistory();
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Saved to history'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                  ),

                // Error Display
                if (provider.errorMessage != null)
                  Card(
                    color: Theme.of(context).colorScheme.errorContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              provider.errorMessage!,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
