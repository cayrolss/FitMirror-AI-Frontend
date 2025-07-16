import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnalysesRecord extends FirestoreRecord {
  AnalysesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "edad" field.
  int? _edad;
  int get edad => _edad ?? 0;
  bool hasEdad() => _edad != null;

  // "peso" field.
  int? _peso;
  int get peso => _peso ?? 0;
  bool hasPeso() => _peso != null;

  // "altura" field.
  int? _altura;
  int get altura => _altura ?? 0;
  bool hasAltura() => _altura != null;

  // "recommendation" field.
  String? _recommendation;
  String get recommendation => _recommendation ?? '';
  bool hasRecommendation() => _recommendation != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _edad = castToType<int>(snapshotData['edad']);
    _peso = castToType<int>(snapshotData['peso']);
    _altura = castToType<int>(snapshotData['altura']);
    _recommendation = snapshotData['recommendation'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('analyses');

  static Stream<AnalysesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnalysesRecord.fromSnapshot(s));

  static Future<AnalysesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnalysesRecord.fromSnapshot(s));

  static AnalysesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnalysesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnalysesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnalysesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnalysesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnalysesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnalysesRecordData({
  String? userId,
  int? edad,
  int? peso,
  int? altura,
  String? recommendation,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'edad': edad,
      'peso': peso,
      'altura': altura,
      'recommendation': recommendation,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnalysesRecordDocumentEquality implements Equality<AnalysesRecord> {
  const AnalysesRecordDocumentEquality();

  @override
  bool equals(AnalysesRecord? e1, AnalysesRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.edad == e2?.edad &&
        e1?.peso == e2?.peso &&
        e1?.altura == e2?.altura &&
        e1?.recommendation == e2?.recommendation &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(AnalysesRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.edad,
        e?.peso,
        e?.altura,
        e?.recommendation,
        e?.timestamp
      ]);

  @override
  bool isValidKey(Object? o) => o is AnalysesRecord;
}
