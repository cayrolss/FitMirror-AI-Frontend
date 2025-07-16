import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:ff_commons/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _userGoal = '';
  String get userGoal => _userGoal;
  set userGoal(String value) {
    _userGoal = value;
  }

  String _userGender = '';
  String get userGender => _userGender;
  set userGender(String value) {
    _userGender = value;
  }

  int _userAge = 0;
  int get userAge => _userAge;
  set userAge(int value) {
    _userAge = value;
  }

  int _userHeight = 0;
  int get userHeight => _userHeight;
  set userHeight(int value) {
    _userHeight = value;
  }

  double _userWeight = 0.0;
  double get userWeight => _userWeight;
  set userWeight(double value) {
    _userWeight = value;
  }

  String _userWorkoutPlace = '';
  String get userWorkoutPlace => _userWorkoutPlace;
  set userWorkoutPlace(String value) {
    _userWorkoutPlace = value;
  }

  String _userLevel = '';
  String get userLevel => _userLevel;
  set userLevel(String value) {
    _userLevel = value;
  }

  int _userExcerciseFrequency = 0;
  int get userExcerciseFrequency => _userExcerciseFrequency;
  set userExcerciseFrequency(int value) {
    _userExcerciseFrequency = value;
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String value) {
    _userId = value;
  }

  Color _containerColor = Color(4292861919);
  Color get containerColor => _containerColor;
  set containerColor(Color value) {
    _containerColor = value;
  }

  Color _borderColor = Color(13816530);
  Color get borderColor => _borderColor;
  set borderColor(Color value) {
    _borderColor = value;
  }

  int _borderWidth = 1;
  int get borderWidth => _borderWidth;
  set borderWidth(int value) {
    _borderWidth = value;
  }

  String _selectedStringValue = '';
  String get selectedStringValue => _selectedStringValue;
  set selectedStringValue(String value) {
    _selectedStringValue = value;
  }

  int _selectedIntValue = 0;
  int get selectedIntValue => _selectedIntValue;
  set selectedIntValue(int value) {
    _selectedIntValue = value;
  }

  double _selectedDoubleValue = 0.0;
  double get selectedDoubleValue => _selectedDoubleValue;
  set selectedDoubleValue(double value) {
    _selectedDoubleValue = value;
  }

  List<int> _heightList = [
    130,
    131,
    132,
    133,
    134,
    135,
    136,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    147,
    148,
    149,
    150,
    151,
    152,
    153,
    154,
    155,
    156,
    157,
    158,
    159,
    160,
    161,
    162,
    163,
    164,
    165,
    166,
    167,
    168,
    169,
    170,
    171,
    172,
    173,
    174,
    175,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    187,
    188,
    189,
    190,
    191,
    192,
    193,
    194,
    195,
    196,
    197,
    198,
    199,
    200,
    201,
    202,
    203,
    204,
    205,
    206,
    207,
    208,
    209,
    210,
    211,
    212,
    213,
    214,
    215,
    216,
    217,
    218,
    219,
    220
  ];
  List<int> get heightList => _heightList;
  set heightList(List<int> value) {
    _heightList = value;
  }

  void addToHeightList(int value) {
    heightList.add(value);
  }

  void removeFromHeightList(int value) {
    heightList.remove(value);
  }

  void removeAtIndexFromHeightList(int index) {
    heightList.removeAt(index);
  }

  void updateHeightListAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    heightList[index] = updateFn(_heightList[index]);
  }

  void insertAtIndexInHeightList(int index, int value) {
    heightList.insert(index, value);
  }

  String _targetField = '';
  String get targetField => _targetField;
  set targetField(String value) {
    _targetField = value;
  }

  String _nextPageKey = '';
  String get nextPageKey => _nextPageKey;
  set nextPageKey(String value) {
    _nextPageKey = value;
  }

  bool _nextPageView = false;
  bool get nextPageView => _nextPageView;
  set nextPageView(bool value) {
    _nextPageView = value;
  }

  double _widthButton = 367.0;
  double get widthButton => _widthButton;
  set widthButton(double value) {
    _widthButton = value;
  }

  double _heightButton = 90.0;
  double get heightButton => _heightButton;
  set heightButton(double value) {
    _heightButton = value;
  }

  String _userMuscleFocus = '';
  String get userMuscleFocus => _userMuscleFocus;
  set userMuscleFocus(String value) {
    _userMuscleFocus = value;
  }

  int _currentPageIndex = 1;
  int get currentPageIndex => _currentPageIndex;
  set currentPageIndex(int value) {
    _currentPageIndex = value;
  }

  int _totalPages = 0;
  int get totalPages => _totalPages;
  set totalPages(int value) {
    _totalPages = value;
  }

  String _typeField = '';
  String get typeField => _typeField;
  set typeField(String value) {
    _typeField = value;
  }

  double _userGoalWeight = 0.0;
  double get userGoalWeight => _userGoalWeight;
  set userGoalWeight(double value) {
    _userGoalWeight = value;
  }

  String _userSpeed = '';
  String get userSpeed => _userSpeed;
  set userSpeed(String value) {
    _userSpeed = value;
  }

  String _userCardio = '';
  String get userCardio => _userCardio;
  set userCardio(String value) {
    _userCardio = value;
  }

  String _userMacronutrientFocus = '';
  String get userMacronutrientFocus => _userMacronutrientFocus;
  set userMacronutrientFocus(String value) {
    _userMacronutrientFocus = value;
  }

  int _mealsPerDay = 0;
  int get mealsPerDay => _mealsPerDay;
  set mealsPerDay(int value) {
    _mealsPerDay = value;
  }

  String _userDietType = '';
  String get userDietType => _userDietType;
  set userDietType(String value) {
    _userDietType = value;
  }

  List<String> _muscleGroupList = [];
  List<String> get muscleGroupList => _muscleGroupList;
  set muscleGroupList(List<String> value) {
    _muscleGroupList = value;
  }

  void addToMuscleGroupList(String value) {
    muscleGroupList.add(value);
  }

  void removeFromMuscleGroupList(String value) {
    muscleGroupList.remove(value);
  }

  void removeAtIndexFromMuscleGroupList(int index) {
    muscleGroupList.removeAt(index);
  }

  void updateMuscleGroupListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    muscleGroupList[index] = updateFn(_muscleGroupList[index]);
  }

  void insertAtIndexInMuscleGroupList(int index, String value) {
    muscleGroupList.insert(index, value);
  }

  List<String> _allergies = ['none'];
  List<String> get allergies => _allergies;
  set allergies(List<String> value) {
    _allergies = value;
  }

  void addToAllergies(String value) {
    allergies.add(value);
  }

  void removeFromAllergies(String value) {
    allergies.remove(value);
  }

  void removeAtIndexFromAllergies(int index) {
    allergies.removeAt(index);
  }

  void updateAllergiesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    allergies[index] = updateFn(_allergies[index]);
  }

  void insertAtIndexInAllergies(int index, String value) {
    allergies.insert(index, value);
  }

  List<String> _dislikedFoods = ['none'];
  List<String> get dislikedFoods => _dislikedFoods;
  set dislikedFoods(List<String> value) {
    _dislikedFoods = value;
  }

  void addToDislikedFoods(String value) {
    dislikedFoods.add(value);
  }

  void removeFromDislikedFoods(String value) {
    dislikedFoods.remove(value);
  }

  void removeAtIndexFromDislikedFoods(int index) {
    dislikedFoods.removeAt(index);
  }

  void updateDislikedFoodsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    dislikedFoods[index] = updateFn(_dislikedFoods[index]);
  }

  void insertAtIndexInDislikedFoods(int index, String value) {
    dislikedFoods.insert(index, value);
  }

  List<String> _likedFoods = [];
  List<String> get likedFoods => _likedFoods;
  set likedFoods(List<String> value) {
    _likedFoods = value;
  }

  void addToLikedFoods(String value) {
    likedFoods.add(value);
  }

  void removeFromLikedFoods(String value) {
    likedFoods.remove(value);
  }

  void removeAtIndexFromLikedFoods(int index) {
    likedFoods.removeAt(index);
  }

  void updateLikedFoodsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    likedFoods[index] = updateFn(_likedFoods[index]);
  }

  void insertAtIndexInLikedFoods(int index, String value) {
    likedFoods.insert(index, value);
  }

  String _username = '';
  String get username => _username;
  set username(String value) {
    _username = value;
  }

  List<dynamic> _userMeals = [];
  List<dynamic> get userMeals => _userMeals;
  set userMeals(List<dynamic> value) {
    _userMeals = value;
  }

  void addToUserMeals(dynamic value) {
    userMeals.add(value);
  }

  void removeFromUserMeals(dynamic value) {
    userMeals.remove(value);
  }

  void removeAtIndexFromUserMeals(int index) {
    userMeals.removeAt(index);
  }

  void updateUserMealsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    userMeals[index] = updateFn(_userMeals[index]);
  }

  void insertAtIndexInUserMeals(int index, dynamic value) {
    userMeals.insert(index, value);
  }

  int _totalKcal = 0;
  int get totalKcal => _totalKcal;
  set totalKcal(int value) {
    _totalKcal = value;
  }

  int _totalProtein = 0;
  int get totalProtein => _totalProtein;
  set totalProtein(int value) {
    _totalProtein = value;
  }

  int _totalFats = 0;
  int get totalFats => _totalFats;
  set totalFats(int value) {
    _totalFats = value;
  }

  int _totalCarbs = 0;
  int get totalCarbs => _totalCarbs;
  set totalCarbs(int value) {
    _totalCarbs = value;
  }

  int _recKcal = 0;
  int get recKcal => _recKcal;
  set recKcal(int value) {
    _recKcal = value;
  }

  List<String> _chatMessagesFitnessText = [];
  List<String> get chatMessagesFitnessText => _chatMessagesFitnessText;
  set chatMessagesFitnessText(List<String> value) {
    _chatMessagesFitnessText = value;
  }

  void addToChatMessagesFitnessText(String value) {
    chatMessagesFitnessText.add(value);
  }

  void removeFromChatMessagesFitnessText(String value) {
    chatMessagesFitnessText.remove(value);
  }

  void removeAtIndexFromChatMessagesFitnessText(int index) {
    chatMessagesFitnessText.removeAt(index);
  }

  void updateChatMessagesFitnessTextAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    chatMessagesFitnessText[index] = updateFn(_chatMessagesFitnessText[index]);
  }

  void insertAtIndexInChatMessagesFitnessText(int index, String value) {
    chatMessagesFitnessText.insert(index, value);
  }

  List<bool> _chatMessagesFitnessIsUser = [];
  List<bool> get chatMessagesFitnessIsUser => _chatMessagesFitnessIsUser;
  set chatMessagesFitnessIsUser(List<bool> value) {
    _chatMessagesFitnessIsUser = value;
  }

  void addToChatMessagesFitnessIsUser(bool value) {
    chatMessagesFitnessIsUser.add(value);
  }

  void removeFromChatMessagesFitnessIsUser(bool value) {
    chatMessagesFitnessIsUser.remove(value);
  }

  void removeAtIndexFromChatMessagesFitnessIsUser(int index) {
    chatMessagesFitnessIsUser.removeAt(index);
  }

  void updateChatMessagesFitnessIsUserAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    chatMessagesFitnessIsUser[index] =
        updateFn(_chatMessagesFitnessIsUser[index]);
  }

  void insertAtIndexInChatMessagesFitnessIsUser(int index, bool value) {
    chatMessagesFitnessIsUser.insert(index, value);
  }

  List<String> _chatMessagesNutritionText = [];
  List<String> get chatMessagesNutritionText => _chatMessagesNutritionText;
  set chatMessagesNutritionText(List<String> value) {
    _chatMessagesNutritionText = value;
  }

  void addToChatMessagesNutritionText(String value) {
    chatMessagesNutritionText.add(value);
  }

  void removeFromChatMessagesNutritionText(String value) {
    chatMessagesNutritionText.remove(value);
  }

  void removeAtIndexFromChatMessagesNutritionText(int index) {
    chatMessagesNutritionText.removeAt(index);
  }

  void updateChatMessagesNutritionTextAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    chatMessagesNutritionText[index] =
        updateFn(_chatMessagesNutritionText[index]);
  }

  void insertAtIndexInChatMessagesNutritionText(int index, String value) {
    chatMessagesNutritionText.insert(index, value);
  }

  List<bool> _chatMessagesNutritionIsUser = [];
  List<bool> get chatMessagesNutritionIsUser => _chatMessagesNutritionIsUser;
  set chatMessagesNutritionIsUser(List<bool> value) {
    _chatMessagesNutritionIsUser = value;
  }

  void addToChatMessagesNutritionIsUser(bool value) {
    chatMessagesNutritionIsUser.add(value);
  }

  void removeFromChatMessagesNutritionIsUser(bool value) {
    chatMessagesNutritionIsUser.remove(value);
  }

  void removeAtIndexFromChatMessagesNutritionIsUser(int index) {
    chatMessagesNutritionIsUser.removeAt(index);
  }

  void updateChatMessagesNutritionIsUserAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    chatMessagesNutritionIsUser[index] =
        updateFn(_chatMessagesNutritionIsUser[index]);
  }

  void insertAtIndexInChatMessagesNutritionIsUser(int index, bool value) {
    chatMessagesNutritionIsUser.insert(index, value);
  }

  String _chatInputText = '';
  String get chatInputText => _chatInputText;
  set chatInputText(String value) {
    _chatInputText = value;
  }

  bool _isMetric = true;
  bool get isMetric => _isMetric;
  set isMetric(bool value) {
    _isMetric = value;
  }
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
