// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileStruct extends FFFirebaseStruct {
  ProfileStruct({
    String? level,
    String? gender,
    int? weightKg,
    String? goal,
    String? workoutPlace,
    int? heightCm,
    String? lastUpdated,
    int? excericseFrequency,
    int? age,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _level = level,
        _gender = gender,
        _weightKg = weightKg,
        _goal = goal,
        _workoutPlace = workoutPlace,
        _heightCm = heightCm,
        _lastUpdated = lastUpdated,
        _excericseFrequency = excericseFrequency,
        _age = age,
        super(firestoreUtilData);

  // "level" field.
  String? _level;
  String get level => _level ?? '1parse';
  set level(String? val) => _level = val;

  bool hasLevel() => _level != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? 'genderDefParse';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "weight_kg" field.
  int? _weightKg;
  int get weightKg => _weightKg ?? 000;
  set weightKg(int? val) => _weightKg = val;

  void incrementWeightKg(int amount) => weightKg = weightKg + amount;

  bool hasWeightKg() => _weightKg != null;

  // "goal" field.
  String? _goal;
  String get goal => _goal ?? 'defGoalParse';
  set goal(String? val) => _goal = val;

  bool hasGoal() => _goal != null;

  // "workout_place" field.
  String? _workoutPlace;
  String get workoutPlace => _workoutPlace ?? 'placeParse';
  set workoutPlace(String? val) => _workoutPlace = val;

  bool hasWorkoutPlace() => _workoutPlace != null;

  // "height_cm" field.
  int? _heightCm;
  int get heightCm => _heightCm ?? 000;
  set heightCm(int? val) => _heightCm = val;

  void incrementHeightCm(int amount) => heightCm = heightCm + amount;

  bool hasHeightCm() => _heightCm != null;

  // "last_updated" field.
  String? _lastUpdated;
  String get lastUpdated => _lastUpdated ?? 'lastParsed';
  set lastUpdated(String? val) => _lastUpdated = val;

  bool hasLastUpdated() => _lastUpdated != null;

  // "excericse_frequency" field.
  int? _excericseFrequency;
  int get excericseFrequency => _excericseFrequency ?? 000;
  set excericseFrequency(int? val) => _excericseFrequency = val;

  void incrementExcericseFrequency(int amount) =>
      excericseFrequency = excericseFrequency + amount;

  bool hasExcericseFrequency() => _excericseFrequency != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 000;
  set age(int? val) => _age = val;

  void incrementAge(int amount) => age = age + amount;

  bool hasAge() => _age != null;

  static ProfileStruct fromMap(Map<String, dynamic> data) => ProfileStruct(
        level: data['level'] as String?,
        gender: data['gender'] as String?,
        weightKg: castToType<int>(data['weight_kg']),
        goal: data['goal'] as String?,
        workoutPlace: data['workout_place'] as String?,
        heightCm: castToType<int>(data['height_cm']),
        lastUpdated: data['last_updated'] as String?,
        excericseFrequency: castToType<int>(data['excericse_frequency']),
        age: castToType<int>(data['age']),
      );

  static ProfileStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProfileStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'level': _level,
        'gender': _gender,
        'weight_kg': _weightKg,
        'goal': _goal,
        'workout_place': _workoutPlace,
        'height_cm': _heightCm,
        'last_updated': _lastUpdated,
        'excericse_frequency': _excericseFrequency,
        'age': _age,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'level': serializeParam(
          _level,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'weight_kg': serializeParam(
          _weightKg,
          ParamType.int,
        ),
        'goal': serializeParam(
          _goal,
          ParamType.String,
        ),
        'workout_place': serializeParam(
          _workoutPlace,
          ParamType.String,
        ),
        'height_cm': serializeParam(
          _heightCm,
          ParamType.int,
        ),
        'last_updated': serializeParam(
          _lastUpdated,
          ParamType.String,
        ),
        'excericse_frequency': serializeParam(
          _excericseFrequency,
          ParamType.int,
        ),
        'age': serializeParam(
          _age,
          ParamType.int,
        ),
      }.withoutNulls;

  static ProfileStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProfileStruct(
        level: deserializeParam(
          data['level'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        weightKg: deserializeParam(
          data['weight_kg'],
          ParamType.int,
          false,
        ),
        goal: deserializeParam(
          data['goal'],
          ParamType.String,
          false,
        ),
        workoutPlace: deserializeParam(
          data['workout_place'],
          ParamType.String,
          false,
        ),
        heightCm: deserializeParam(
          data['height_cm'],
          ParamType.int,
          false,
        ),
        lastUpdated: deserializeParam(
          data['last_updated'],
          ParamType.String,
          false,
        ),
        excericseFrequency: deserializeParam(
          data['excericse_frequency'],
          ParamType.int,
          false,
        ),
        age: deserializeParam(
          data['age'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ProfileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProfileStruct &&
        level == other.level &&
        gender == other.gender &&
        weightKg == other.weightKg &&
        goal == other.goal &&
        workoutPlace == other.workoutPlace &&
        heightCm == other.heightCm &&
        lastUpdated == other.lastUpdated &&
        excericseFrequency == other.excericseFrequency &&
        age == other.age;
  }

  @override
  int get hashCode => const ListEquality().hash([
        level,
        gender,
        weightKg,
        goal,
        workoutPlace,
        heightCm,
        lastUpdated,
        excericseFrequency,
        age
      ]);
}

ProfileStruct createProfileStruct({
  String? level,
  String? gender,
  int? weightKg,
  String? goal,
  String? workoutPlace,
  int? heightCm,
  String? lastUpdated,
  int? excericseFrequency,
  int? age,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProfileStruct(
      level: level,
      gender: gender,
      weightKg: weightKg,
      goal: goal,
      workoutPlace: workoutPlace,
      heightCm: heightCm,
      lastUpdated: lastUpdated,
      excericseFrequency: excericseFrequency,
      age: age,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProfileStruct? updateProfileStruct(
  ProfileStruct? profile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    profile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProfileStructData(
  Map<String, dynamic> firestoreData,
  ProfileStruct? profile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (profile == null) {
    return;
  }
  if (profile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && profile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final profileData = getProfileFirestoreData(profile, forFieldValue);
  final nestedData = profileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = profile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProfileFirestoreData(
  ProfileStruct? profile, [
  bool forFieldValue = false,
]) {
  if (profile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(profile.toMap());

  // Add any Firestore field values
  profile.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProfileListFirestoreData(
  List<ProfileStruct>? profiles,
) =>
    profiles?.map((e) => getProfileFirestoreData(e, true)).toList() ?? [];
