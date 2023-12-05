import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'generator_widget.dart' show GeneratorWidget;
import 'package:flutter/material.dart';

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

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue1;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue2;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue3;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue4;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    contentFieldControllerValidator = _contentFieldControllerValidator;
  }

  @override
  void dispose() {
    contentFieldFocusNode?.dispose();
    contentFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
