import 'package:flutter/foundation.dart';
import '../models/conversion_category.dart';
import '../models/conversion_unit.dart';
import '../models/exchange_rate.dart';
import '../services/conversion_service.dart';
import '../repositories/currency_repository.dart';
import '../repositories/conversion_history_repository.dart';

/// Provider for managing conversion state
class ConverterProvider extends ChangeNotifier {
  final ConversionService _conversionService;
  final CurrencyRepository _currencyRepository;
  final ConversionHistoryRepository _historyRepository;

  ConverterProvider(
    this._conversionService,
    this._currencyRepository,
    this._historyRepository,
  );

  // State
  ConversionCategory _selectedCategory = ConversionCategory.length;
  ConversionUnit? _fromUnit;
  ConversionUnit? _toUnit;
  String _inputValue = '';
  double? _result;
  bool _isLoading = false;
  String? _errorMessage;
  ExchangeRate? _currentExchangeRate;

  // Getters
  ConversionCategory get selectedCategory => _selectedCategory;
  ConversionUnit? get fromUnit => _fromUnit;
  ConversionUnit? get toUnit => _toUnit;
  String get inputValue => _inputValue;
  double? get result => _result;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  List<ConversionUnit> get availableUnits =>
      ConversionUnits.getUnitsForCategory(_selectedCategory);

  /// Set the selected category
  void setCategory(ConversionCategory category) {
    if (_selectedCategory != category) {
      _selectedCategory = category;
      _fromUnit = null;
      _toUnit = null;
      _result = null;
      _errorMessage = null;
      _currentExchangeRate = null;
      notifyListeners();
    }
  }

  /// Set the from unit
  void setFromUnit(ConversionUnit unit) {
    _fromUnit = unit;
    _errorMessage = null;
    notifyListeners();
    _performConversionIfReady();
  }

  /// Set the to unit
  void setToUnit(ConversionUnit unit) {
    _toUnit = unit;
    _errorMessage = null;
    notifyListeners();
    _performConversionIfReady();
  }

  /// Set the input value
  void setInputValue(String value) {
    _inputValue = value;
    _errorMessage = null;
    notifyListeners();
    _performConversionIfReady();
  }

  /// Perform conversion if all required fields are set
  Future<void> _performConversionIfReady() async {
    if (_fromUnit == null || _toUnit == null || _inputValue.isEmpty) {
      _result = null;
      notifyListeners();
      return;
    }

    final value = double.tryParse(_inputValue);
    if (value == null) {
      _errorMessage = 'Please enter a valid number';
      _result = null;
      notifyListeners();
      return;
    }

    await performConversion();
  }

  /// Perform the conversion
  Future<void> performConversion() async {
    if (_fromUnit == null || _toUnit == null || _inputValue.isEmpty) {
      _errorMessage = 'Please fill all fields';
      return;
    }

    final value = double.tryParse(_inputValue);
    if (value == null) {
      _errorMessage = 'Please enter a valid number';
      _result = null;
      notifyListeners();
      return;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Fetch exchange rates if currency conversion
      if (_selectedCategory == ConversionCategory.currency) {
        _currentExchangeRate =
            await _currencyRepository.getExchangeRates(_fromUnit!.symbol);
      }

      // Perform conversion
      final convertedValue = _conversionService.convert(
        value: value,
        fromUnit: _fromUnit!,
        toUnit: _toUnit!,
        exchangeRate: _currentExchangeRate,
      );

      _result = convertedValue;
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      _result = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Save current conversion to history
  Future<void> saveToHistory() async {
    if (_fromUnit == null ||
        _toUnit == null ||
        _inputValue.isEmpty ||
        _result == null) {
      return;
    }

    final value = double.tryParse(_inputValue);
    if (value == null) return;

    try {
      await _historyRepository.saveConversion(
        category: _selectedCategory.name,
        fromUnit: _fromUnit!.symbol,
        toUnit: _toUnit!.symbol,
        fromValue: value,
        toValue: _result!,
      );
    } catch (e) {
      _errorMessage = 'Failed to save to history: $e';
      notifyListeners();
    }
  }

  /// Clear the current conversion
  void clear() {
    _inputValue = '';
    _result = null;
    _errorMessage = null;
    notifyListeners();
  }

  /// Swap from and to units
  void swapUnits() {
    if (_fromUnit != null && _toUnit != null) {
      final temp = _fromUnit;
      _fromUnit = _toUnit;
      _toUnit = temp;

      // Swap values if we have a result
      if (_result != null && _inputValue.isNotEmpty) {
        _inputValue = _result.toString();
        _result = null;
      }

      notifyListeners();
      _performConversionIfReady();
    }
  }
}
