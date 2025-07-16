import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PreferencesRecord extends FirestoreRecord {
  PreferencesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "liked_foods" field.
  List<String>? _likedFoods;
  List<String> get likedFoods => _likedFoods ?? const [];
  bool hasLikedFoods() => _likedFoods != null;

  // "disliked_foods" field.
  List<String>? _dislikedFoods;
  List<String> get dislikedFoods => _dislikedFoods ?? const [];
  bool hasDislikedFoods() => _dislikedFoods != null;

  // "dietary_restrictions" field.
  List<String>? _dietaryRestrictions;
  List<String> get dietaryRestrictions => _dietaryRestrictions ?? const [];
  bool hasDietaryRestrictions() => _dietaryRestrictions != null;

  // "preferred_excercises" field.
  List<String>? _preferredExcercises;
  List<String> get preferredExcercises => _preferredExcercises ?? const [];
  bool hasPreferredExcercises() => _preferredExcercises != null;

  // "dislike_excercises" field.
  List<String>? _dislikeExcercises;
  List<String> get dislikeExcercises => _dislikeExcercises ?? const [];
  bool hasDislikeExcercises() => _dislikeExcercises != null;

  // "injuries" field.
  List<String>? _injuries;
  List<String> get injuries => _injuries ?? const [];
  bool hasInjuries() => _injuries != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _likedFoods = getDataList(snapshotData['liked_foods']);
    _dislikedFoods = getDataList(snapshotData['disliked_foods']);
    _dietaryRestrictions = getDataList(snapshotData['dietary_restrictions']);
    _preferredExcercises = getDataList(snapshotData['preferred_excercises']);
    _dislikeExcercises = getDataList(snapshotData['dislike_excercises']);
    _injuries = getDataList(snapshotData['injuries']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('preferences')
          : FirebaseFirestore.instance.collectionGroup('preferences');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('preferences').doc(id);

  static Stream<PreferencesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PreferencesRecord.fromSnapshot(s));

  static Future<PreferencesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PreferencesRecord.fromSnapshot(s));

  static PreferencesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PreferencesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PreferencesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PreferencesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PreferencesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PreferencesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPreferencesRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class PreferencesRecordDocumentEquality implements Equality<PreferencesRecord> {
  const PreferencesRecordDocumentEquality();

  @override
  bool equals(PreferencesRecord? e1, PreferencesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.likedFoods, e2?.likedFoods) &&
        listEquality.equals(e1?.dislikedFoods, e2?.dislikedFoods) &&
        listEquality.equals(e1?.dietaryRestrictions, e2?.dietaryRestrictions) &&
        listEquality.equals(e1?.preferredExcercises, e2?.preferredExcercises) &&
        listEquality.equals(e1?.dislikeExcercises, e2?.dislikeExcercises) &&
        listEquality.equals(e1?.injuries, e2?.injuries);
  }

  @override
  int hash(PreferencesRecord? e) => const ListEquality().hash([
        e?.likedFoods,
        e?.dislikedFoods,
        e?.dietaryRestrictions,
        e?.preferredExcercises,
        e?.dislikeExcercises,
        e?.injuries
      ]);

  @override
  bool isValidKey(Object? o) => o is PreferencesRecord;
}
