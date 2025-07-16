// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserProfileResponseStruct extends FFFirebaseStruct {
  UserProfileResponseStruct({
    ProfileStruct? profile,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _profile = profile,
        super(firestoreUtilData);

  // "profile" field.
  ProfileStruct? _profile;
  ProfileStruct get profile => _profile ?? ProfileStruct();
  set profile(ProfileStruct? val) => _profile = val;

  void updateProfile(Function(ProfileStruct) updateFn) {
    updateFn(_profile ??= ProfileStruct());
  }

  bool hasProfile() => _profile != null;

  static UserProfileResponseStruct fromMap(Map<String, dynamic> data) =>
      UserProfileResponseStruct(
        profile: data['profile'] is ProfileStruct
            ? data['profile']
            : ProfileStruct.maybeFromMap(data['profile']),
      );

  static UserProfileResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? UserProfileResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'profile': _profile?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'profile': serializeParam(
          _profile,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static UserProfileResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserProfileResponseStruct(
        profile: deserializeStructParam(
          data['profile'],
          ParamType.DataStruct,
          false,
          structBuilder: ProfileStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UserProfileResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserProfileResponseStruct && profile == other.profile;
  }

  @override
  int get hashCode => const ListEquality().hash([profile]);
}

UserProfileResponseStruct createUserProfileResponseStruct({
  ProfileStruct? profile,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserProfileResponseStruct(
      profile: profile ?? (clearUnsetFields ? ProfileStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserProfileResponseStruct? updateUserProfileResponseStruct(
  UserProfileResponseStruct? userProfileResponse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userProfileResponse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserProfileResponseStructData(
  Map<String, dynamic> firestoreData,
  UserProfileResponseStruct? userProfileResponse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userProfileResponse == null) {
    return;
  }
  if (userProfileResponse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userProfileResponse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userProfileResponseData =
      getUserProfileResponseFirestoreData(userProfileResponse, forFieldValue);
  final nestedData =
      userProfileResponseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      userProfileResponse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserProfileResponseFirestoreData(
  UserProfileResponseStruct? userProfileResponse, [
  bool forFieldValue = false,
]) {
  if (userProfileResponse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userProfileResponse.toMap());

  // Handle nested data for "profile" field.
  addProfileStructData(
    firestoreData,
    userProfileResponse.hasProfile() ? userProfileResponse.profile : null,
    'profile',
    forFieldValue,
  );

  // Add any Firestore field values
  userProfileResponse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserProfileResponseListFirestoreData(
  List<UserProfileResponseStruct>? userProfileResponses,
) =>
    userProfileResponses
        ?.map((e) => getUserProfileResponseFirestoreData(e, true))
        .toList() ??
    [];
