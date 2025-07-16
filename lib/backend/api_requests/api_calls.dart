import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';

import 'package:ff_commons/api_requests/api_paging_params.dart';

export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AnalyzePhotoCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? photo,
    String? edad = '',
    String? peso = '',
    String? altura = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'AnalyzePhoto',
      apiUrl:
          'https://fitmirror-ai-789265813244.europe-west1.run.app/v1/analyze-photo',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'photo': photo,
        'edad': edad,
        'peso': peso,
        'altura': altura,
        'user_id': userId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUserProfileCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? goal = '',
    String? gender = '',
    int? age,
    int? heightCm,
    double? weightKg,
    String? workoutPlace = '',
    int? exerciseFrequency,
    double? goalWeightKg,
    String? weightChangeSpeed = '',
    List<String>? muscleGroupFocusList,
    int? weeklyTrainings,
    String? cardioType = '',
    int? cardioFrequency,
    List<String>? allergiesList,
    String? dietaryType = '',
    String? dietFocus = '',
    int? mealsPerDay,
    List<String>? dislikedFoodsList,
    List<String>? likedFoodsList,
    List<String>? dietaryRestrictionsList,
    List<String>? preferredExercisesList,
    List<String>? dislikedExercisesList,
    List<String>? injuriesList,
    String? username = '',
  }) async {
    final muscleGroupFocus = _serializeList(muscleGroupFocusList);
    final allergies = _serializeList(allergiesList);
    final dislikedFoods = _serializeList(dislikedFoodsList);
    final likedFoods = _serializeList(likedFoodsList);
    final dietaryRestrictions = _serializeList(dietaryRestrictionsList);
    final preferredExercises = _serializeList(preferredExercisesList);
    final dislikedExercises = _serializeList(dislikedExercisesList);
    final injuries = _serializeList(injuriesList);

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}",
  "username": "${escapeStringForJson(username)}",
  "goal": "${escapeStringForJson(goal)}",
  "gender": "${escapeStringForJson(gender)}",
  "age": ${age},
  "height_cm": ${heightCm},
  "weight_kg": ${weightKg},
  "workout_place": "${escapeStringForJson(workoutPlace)}",
  "exercise_frequency": ${exerciseFrequency},
  "goal_weight_kg": ${goalWeightKg},
  "weight_change_speed": "${escapeStringForJson(weightChangeSpeed)}",
  "muscle_group_focus": ${muscleGroupFocus},
  "weekly_trainings": ${weeklyTrainings},
  "cardio_type": "${escapeStringForJson(cardioType)}",
  "cardio_frequency": ${cardioFrequency},
  "allergies": ${allergies},
  "dietary_type": "${escapeStringForJson(dietaryType)}",
  "diet_focus": "${escapeStringForJson(dietFocus)}",
  "meals_per_day": ${mealsPerDay},
  "disliked_foods": ${dislikedFoods},
  "liked_foods": ${likedFoods},
  "dietary_restrictions": ${dietaryRestrictions},
  "preferred_exercises": ${preferredExercises},
  "disliked_exercises": ${dislikedExercises},
  "injuries": ${injuries}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateUserProfile',
      apiUrl:
          'https://fitmirror-ai-789265813244.europe-west1.run.app/v1/update-user-profile',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserProfileCall {
  static Future<ApiCallResponse> call({
    String? userId = 'zPsxQoVC2dWtq2YfAT6CkAtZOHo2',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetUserProfile',
      apiUrl:
          'https://fitmirror-ai-789265813244.europe-west1.run.app/v1/get-user-profile/${userId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? username(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.profile.user_info.username''',
      ));
  static String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.profile.user_info.user_id''',
      ));
  static String? goal(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.profile.main_questionnaire.goal''',
      ));
  static String? gender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.profile.main_questionnaire.gender''',
      ));
  static int? age(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.profile.main_questionnaire.age''',
      ));
  static int? heightCm(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.profile.main_questionnaire.height_cm''',
      ));
  static double? weightKg(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.profile.main_questionnaire.weight_kg''',
      ));
  static double? goalWeightKg(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.profile.main_questionnaire.goal_weight_kg''',
      ));
  static String? speed(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.profile.main_questionnaire.weight_change_speed''',
      ));
  static String? place(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.profile.gym_questionnaire.workout_place''',
      ));
  static int? frequency(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.profile.gym_questionnaire.exercise_frequency''',
      ));
  static List? muscleGroup(dynamic response) => getJsonField(
        response,
        r'''$.profile.gym_questionnaire.muscle_group_focus''',
        true,
      ) as List?;
  static int? weeklyTrainings(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.profile.gym_questionnaire.weekly_trainings''',
      ));
  static String? cardioType(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.profile.gym_questionnaire.cardio_type''',
      ));
  static int? cardioFreq(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.profile.gym_questionnaire.cardio_frequency''',
      ));
  static String? dietType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.profile.nutrition_questionnaire.dietary_type''',
      ));
  static String? dietFocus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.profile.nutrition_questionnaire.diet_focus''',
      ));
  static int? mealsPerDay(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.profile.nutrition_questionnaire.meals_per_day''',
      ));
  static List? allergies(dynamic response) => getJsonField(
        response,
        r'''$.profile.nutrition_questionnaire.allergies''',
        true,
      ) as List?;
}

class GetUserKcalCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetUserKcal',
      apiUrl:
          'https://fitmirror-ai-789265813244.europe-west1.run.app/v1/user-kcal/${userId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? recKcal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.recommended_kcal''',
      ));
}

class GetUserProteinCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetUserProtein',
      apiUrl:
          'https://fitmirror-ai-789265813244.europe-west1.run.app/v1/user-protein/${userId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? userProtein(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.proteins_g''',
      ));
}

class GetUserCarbsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetUserCarbs',
      apiUrl:
          'https://fitmirror-ai-789265813244.europe-west1.run.app/v1/user-carbs/${userId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? userCarbs(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.carbs_g''',
      ));
}

class GetUserFatsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetUserFats',
      apiUrl:
          'https://fitmirror-ai-789265813244.europe-west1.run.app/v1/user-fats/${userId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? userFats(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.fats_g''',
      ));
}

class SendFitnessMessageCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? message = '',
    String? lang = '',
    bool? resetMemory,
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}",
  "message": "${escapeStringForJson(message)}",
  "lang": "${escapeStringForJson(lang)}",
  "reset_memory": ${resetMemory}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendFitnessMessage',
      apiUrl:
          'https:///fitmirror-ai-789265813244.europe-west1.run.app/v1/fitness-coach-chat',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
