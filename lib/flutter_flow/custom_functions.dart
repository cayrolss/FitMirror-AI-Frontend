import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? enterLabelTextfield(String? fieldType) {
  switch (fieldType) {
    case 'age':
      return 'Enter your age';
    case 'height':
      return 'Enter your height (cm)';
    case 'current_weight':
      return 'Enter your current weight (kg)';
    case 'goal_weight':
      return 'Enter your goal weight (kg)';
    case 'speed':
      return 'How fast do you want to reach your goal?';
    default:
      return 'Enter value';
  }
}

String? getProgressFraction(
  int? currentPage,
  int? totalPages,
) {
  if (currentPage == null || totalPages == null || totalPages <= 1) {
    return '0.0';
  }

  final progress = currentPage / (totalPages - 1);
  return progress.clamp(0.0, 1.0).toStringAsFixed(2);
}
