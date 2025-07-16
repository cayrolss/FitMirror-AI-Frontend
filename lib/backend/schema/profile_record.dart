import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileRecord extends FirestoreRecord {
  ProfileRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "goal" field.
  String? _goal;
  String get goal => _goal ?? '';
  bool hasGoal() => _goal != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "height_cm" field.
  int? _heightCm;
  int get heightCm => _heightCm ?? 0;
  bool hasHeightCm() => _heightCm != null;

  // "weight_kg" field.
  double? _weightKg;
  double get weightKg => _weightKg ?? 0.0;
  bool hasWeightKg() => _weightKg != null;

  // "workout_place" field.
  String? _workoutPlace;
  String get workoutPlace => _workoutPlace ?? '';
  bool hasWorkoutPlace() => _workoutPlace != null;

  // "excercise_frequency" field.
  int? _excerciseFrequency;
  int get excerciseFrequency => _excerciseFrequency ?? 0;
  bool hasExcerciseFrequency() => _excerciseFrequency != null;

  // "last_updated" field.
  DateTime? _lastUpdated;
  DateTime? get lastUpdated => _lastUpdated;
  bool hasLastUpdated() => _lastUpdated != null;

  // "level" field.
  String? _level;
  String get level => _level ?? '';
  bool hasLevel() => _level != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _goal = snapshotData['goal'] as String?;
    _gender = snapshotData['gender'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _heightCm = castToType<int>(snapshotData['height_cm']);
    _weightKg = castToType<double>(snapshotData['weight_kg']);
    _workoutPlace = snapshotData['workout_place'] as String?;
    _excerciseFrequency = castToType<int>(snapshotData['excercise_frequency']);
    _lastUpdated = snapshotData['last_updated'] as DateTime?;
    _level = snapshotData['level'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('profile')
          : FirebaseFirestore.instance.collectionGroup('profile');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('profile').doc(id);

  static Stream<ProfileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfileRecord.fromSnapshot(s));

  static Future<ProfileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProfileRecord.fromSnapshot(s));

  static ProfileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProfileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfileRecordData({
  String? goal,
  String? gender,
  int? age,
  int? heightCm,
  double? weightKg,
  String? workoutPlace,
  int? excerciseFrequency,
  DateTime? lastUpdated,
  String? level,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'goal': goal,
      'gender': gender,
      'age': age,
      'height_cm': heightCm,
      'weight_kg': weightKg,
      'workout_place': workoutPlace,
      'excercise_frequency': excerciseFrequency,
      'last_updated': lastUpdated,
      'level': level,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProfileRecordDocumentEquality implements Equality<ProfileRecord> {
  const ProfileRecordDocumentEquality();

  @override
  bool equals(ProfileRecord? e1, ProfileRecord? e2) {
    return e1?.goal == e2?.goal &&
        e1?.gender == e2?.gender &&
        e1?.age == e2?.age &&
        e1?.heightCm == e2?.heightCm &&
        e1?.weightKg == e2?.weightKg &&
        e1?.workoutPlace == e2?.workoutPlace &&
        e1?.excerciseFrequency == e2?.excerciseFrequency &&
        e1?.lastUpdated == e2?.lastUpdated &&
        e1?.level == e2?.level;
  }

  @override
  int hash(ProfileRecord? e) => const ListEquality().hash([
        e?.goal,
        e?.gender,
        e?.age,
        e?.heightCm,
        e?.weightKg,
        e?.workoutPlace,
        e?.excerciseFrequency,
        e?.lastUpdated,
        e?.level
      ]);

  @override
  bool isValidKey(Object? o) => o is ProfileRecord;
}
