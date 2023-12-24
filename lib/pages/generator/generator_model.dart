import 'dart:math';

import 'package:flutter/material.dart';
import 'package:word_generator/word_generator.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'generator_widget.dart' show GeneratorWidget;

class GeneratorModel extends FlutterFlowModel<GeneratorWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ContentField widget.
  FocusNode? contentFieldFocusNode;
  TextEditingController? contentFieldController;
  String? Function(BuildContext, String?)? contentFieldControllerValidator;
  String? _contentFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter webaddress';
    }

    if (!RegExp(kTextValidatorWebsiteRegex).hasMatch(val)) {
      return 'Has to be a valid website.';
    }
    return null;
  }

  String generatedContent = '';

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for CheckboxListTile widget.
  bool? capitalListTileValue = true;
  // State field(s) for CheckboxListTile widget.
  bool? smallListTileValue = true;
  // State field(s) for CheckboxListTile widget.
  bool? numbersListTileValue = true;
  // State field(s) for CheckboxListTile widget.
  bool? symbolsListTileValue = true;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    contentFieldControllerValidator = _contentFieldControllerValidator;
    onGenerate();
  }

  @override
  void dispose() {
    contentFieldFocusNode?.dispose();
    contentFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;

  void onGenerate() {
    if (radioButtonValue == null) return;
    if (radioButtonValue == 'Password') {
      generatedContent = _generatePassword(
        symbolsListTileValue ?? false,
        capitalListTileValue ?? false,
        smallListTileValue ?? false,
        numbersListTileValue ?? false,
        sliderValue?.toInt() ?? 8,
      );
    } else {
      generatedContent = _generateRandomName();
    }
    contentFieldController.text = generatedContent;
  }

  String _generatePassword(
    bool useSymbols,
    bool useCapitalLetters,
    bool useSmallLetters,
    bool useNumbers,
    int length,
  ) {
    final random = Random();
    final List<String> symbols = [
      '!',
      '@',
      '#',
      '\$',
      '%',
      '^',
      '&',
      '*',
      '(',
      ')',
      '-',
      '_',
      '+',
      '=',
      '{',
      '}',
      '[',
      ']',
      '|',
      ':',
      ';',
      '<',
      '>',
      ',',
      '.',
      '?',
      '/'
    ];
    final List<String> capitalLetters = List.generate(
      26,
      (index) => String.fromCharCode('A'.codeUnitAt(0) + index),
    );
    final List<String> smallLetters = List.generate(
      26,
      (index) => String.fromCharCode('a'.codeUnitAt(0) + index),
    );
    final List<String> numbers = List.generate(10, (index) => '$index');

    List<String> allCharacters = [];
    if (useSymbols) {
      allCharacters.addAll(symbols);
    } else {
      symbols.clear();
    }
    if (useCapitalLetters) {
      allCharacters.addAll(capitalLetters);
    } else {
      capitalLetters.clear();
    }
    if (useSmallLetters) {
      allCharacters.addAll(smallLetters);
    } else {
      smallLetters.clear();
    }
    if (useNumbers) {
      allCharacters.addAll(numbers);
    } else {
      numbers.clear();
    }

    if (allCharacters.isEmpty) {
      // No options selected, default to using all characters
      allCharacters.addAll(symbols);
      allCharacters.addAll(capitalLetters);
      allCharacters.addAll(smallLetters);
      allCharacters.addAll(numbers);
    }

    if (length < 8) {
      length = 8;
    }

    if (allCharacters.isEmpty) return '';
    // Shuffle the list of characters to get a random order
    allCharacters.shuffle(random);

    // Generate the password by selecting characters randomly
    String password = '';
    for (int i = 0; i < length; i++) {
      password += allCharacters[random.nextInt(allCharacters.length)];
    }

    return password;
  }

  String _generateRandomName() {
    final wordGenerator = WordGenerator();
    String name = wordGenerator.randomName();
    Random random = Random();
    int maxValue = pow(10, 3).toInt();
    final number = random.nextInt(maxValue).toString();
    return name.split(' ').first + number;
  }

  void copyToClipboard() {}
}
