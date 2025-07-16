import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'select_dumbells_widget.dart' show SelectDumbellsWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectDumbellsModel extends FlutterFlowModel<SelectDumbellsWidget> {
  ///  Local state fields for this page.

  List<String> selectedDumbells = [];
  void addToSelectedDumbells(String item) => selectedDumbells.add(item);
  void removeFromSelectedDumbells(String item) => selectedDumbells.remove(item);
  void removeAtIndexFromSelectedDumbells(int index) =>
      selectedDumbells.removeAt(index);
  void insertAtIndexInSelectedDumbells(int index, String item) =>
      selectedDumbells.insert(index, item);
  void updateSelectedDumbellsAtIndex(int index, Function(String) updateFn) =>
      selectedDumbells[index] = updateFn(selectedDumbells[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
