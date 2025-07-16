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

Future<void> updateAppStateField(
  String fieldName,
  String value,
) async {
  switch (fieldName) {
    case 'userGoal':
      FFAppState().userGoal = value;
      break;
    case 'userGender':
      FFAppState().userGender = value;
      break;
    case 'userWorkoutPlace':
      FFAppState().userWorkoutPlace = value;
      break;
    case 'userLevel':
      FFAppState().userLevel = value;
      break;
    case 'userId':
      FFAppState().userId = value;
      break;
    case 'userAge':
      FFAppState().userAge = int.tryParse(value) ?? 0;
      break;
    case 'userHeight':
      FFAppState().userHeight = int.tryParse(value) ?? 0;
      break;
    case 'userExerciseFrequency':
      FFAppState().userExcerciseFrequency = int.tryParse(value) ?? 0;
      break;
    case 'userWeight':
      FFAppState().userWeight = double.tryParse(value) ?? 0.0;
      break;
    default:
      print('⚠️ Campo no reconocido: $fieldName');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
