import '/flutter_flow/flutter_flow_util.dart';
import 'create_edit_password_widget.dart' show CreateEditPasswordWidget;
import 'package:flutter/material.dart';

class CreateEditPasswordModel
    extends FlutterFlowModel<CreateEditPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for WebAddressField widget.
  FocusNode? webAddressFieldFocusNode;
  TextEditingController? webAddressFieldController;
  String? Function(BuildContext, String?)? webAddressFieldControllerValidator;
  String? _webAddressFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter webaddress';
    }

    if (!RegExp(kTextValidatorWebsiteRegex).hasMatch(val)) {
      return 'Has to be a valid website.';
    }
    return null;
  }

  // State field(s) for UsernameEmailField widget.
  FocusNode? usernameEmailFieldFocusNode;
  TextEditingController? usernameEmailFieldController;
  String? Function(BuildContext, String?)?
      usernameEmailFieldControllerValidator;
  String? _usernameEmailFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter usersname / email';
    }

    return null;
  }

  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldControllerValidator;
  String? _passwordFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter password';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    webAddressFieldControllerValidator = _webAddressFieldControllerValidator;
    usernameEmailFieldControllerValidator =
        _usernameEmailFieldControllerValidator;
    passwordFieldVisibility = false;
    passwordFieldControllerValidator = _passwordFieldControllerValidator;
  }

  @override
  void dispose() {
    webAddressFieldFocusNode?.dispose();
    webAddressFieldController?.dispose();

    usernameEmailFieldFocusNode?.dispose();
    usernameEmailFieldController?.dispose();

    passwordFieldFocusNode?.dispose();
    passwordFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
