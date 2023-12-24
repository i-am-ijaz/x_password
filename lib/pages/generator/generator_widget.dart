import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'generator_model.dart';
export 'generator_model.dart';

class GeneratorWidget extends StatefulWidget {
  const GeneratorWidget({super.key});

  @override
  _GeneratorWidgetState createState() => _GeneratorWidgetState();
}

class _GeneratorWidgetState extends State<GeneratorWidget> {
  late GeneratorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GeneratorModel());

    _model.contentFieldController ??= TextEditingController(
      text: _model.generatedContent,
    );
    _model.contentFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        iconTheme: IconThemeData(color: FlutterFlowTheme.of(context).info),
        automaticallyImplyLeading: true,
        title: Text(
          'Generate',
          style: FlutterFlowTheme.of(context).displaySmall.override(
                fontFamily: 'Readex Pro',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: Form(
        key: _model.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).accent1,
                      width: 2.0,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0,
                            0.0,
                            0.0,
                            0.0,
                          ),
                          child: TextFormField(
                            controller: _model.contentFieldController,
                            focusNode: _model.contentFieldFocusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            maxLines: 5,
                            minLines: 1,
                            validator: _model.contentFieldControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          0.0,
                          24.0,
                          0.0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: const Color(0x00105DFB),
                              borderRadius: 20.0,
                              borderWidth: 0.0,
                              buttonSize: 40.0,
                              fillColor: const Color(0x00105DFB),
                              icon: Icon(
                                Icons.content_copy_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () {
                                _model.copyToClipboard();
                              },
                            ),
                            FlutterFlowIconButton(
                              borderColor: const Color(0x00105DFB),
                              borderRadius: 20.0,
                              borderWidth: 0.0,
                              buttonSize: 40.0,
                              fillColor: const Color(0x00105DFB),
                              icon: Icon(
                                Icons.autorenew_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () {
                                _model.onGenerate();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What would you like to generate?',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowRadioButton(
                          options: ['Password', 'Username'].toList(),
                          onChanged: (val) => setState(() {
                            _model.onGenerate();
                          }),
                          controller: _model.radioButtonValueController ??=
                              FormFieldController<String>('Password'),
                          optionHeight: 32.0,
                          textStyle: FlutterFlowTheme.of(context).labelMedium,
                          selectedTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium,
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.vertical,
                          radioButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          inactiveRadioButtonColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (_model.radioButtonValue == 'Password')
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: Text(
                                  'Length',
                                  style:
                                      FlutterFlowTheme.of(context).titleLarge,
                                ),
                              ),
                              Text(
                                (_model.sliderValue ??= 8.0).toInt().toString(),
                                style: FlutterFlowTheme.of(context).titleLarge,
                              ),
                            ],
                          ),
                          Slider(
                            activeColor: FlutterFlowTheme.of(context).primary,
                            inactiveColor:
                                FlutterFlowTheme.of(context).alternate,
                            min: 8.0,
                            max: 32.0,
                            value: _model.sliderValue ??= 8.0,
                            onChanged: (newValue) {
                              newValue =
                                  double.parse(newValue.toStringAsFixed(2));
                              setState(() => _model.sliderValue = newValue);
                              _model.onGenerate();
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          10.0, 0.0, 0.0, 0.0),
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: const CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                        child: CheckboxListTile(
                          value: _model.capitalListTileValue ??= true,
                          onChanged: (newValue) async {
                            setState(
                                () => _model.capitalListTileValue = newValue!);
                            _model.onGenerate();
                          },
                          title: Text(
                            'A-Z',
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          10.0, 0.0, 0.0, 0.0),
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: const CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                        child: CheckboxListTile(
                          value: _model.smallListTileValue ??= true,
                          onChanged: (newValue) async {
                            setState(
                                () => _model.smallListTileValue = newValue!);
                            _model.onGenerate();
                          },
                          title: Text(
                            'a-z',
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          10.0, 0.0, 0.0, 0.0),
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: const CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                        child: CheckboxListTile(
                          value: _model.numbersListTileValue ??= true,
                          onChanged: (newValue) async {
                            setState(
                                () => _model.numbersListTileValue = newValue!);
                            _model.onGenerate();
                          },
                          title: Text(
                            '0-9',
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          10.0, 0.0, 0.0, 0.0),
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: const CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                        child: CheckboxListTile(
                          value: _model.symbolsListTileValue ??= true,
                          onChanged: (newValue) async {
                            setState(
                                () => _model.symbolsListTileValue = newValue!);
                            _model.onGenerate();
                          },
                          title: Text(
                            '!@#\$%^&*',
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
