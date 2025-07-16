// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> recalculateMacrosFromMeals(List<dynamic> mealsList) async {
  int totalKcal = 0;
  int totalProtein = 0;
  int totalCarbs = 0;
  int totalFats = 0;

  for (var meal in mealsList) {
    totalKcal += int.tryParse((meal['kcal'] ?? '').toString()) ?? 0;
    totalProtein += int.tryParse((meal['protein'] ?? '').toString()) ?? 0;
    totalCarbs += int.tryParse((meal['carbs'] ?? '').toString()) ?? 0;
    totalFats += int.tryParse((meal['fats'] ?? '').toString()) ?? 0;
  }

  FFAppState().totalKcal = totalKcal;
  FFAppState().totalProtein = totalProtein;
  FFAppState().totalCarbs = totalCarbs;
  FFAppState().totalFats = totalFats;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
