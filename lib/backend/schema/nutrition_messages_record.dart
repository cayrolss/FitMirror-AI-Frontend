import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NutritionMessagesRecord extends FirestoreRecord {
  NutritionMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "message_id" field.
  String? _messageId;
  String get messageId => _messageId ?? '';
  bool hasMessageId() => _messageId != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _role = snapshotData['role'] as String?;
    _content = snapshotData['content'] as String?;
    _messageId = snapshotData['message_id'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('nutrition_messages')
          : FirebaseFirestore.instance.collectionGroup('nutrition_messages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('nutrition_messages').doc(id);

  static Stream<NutritionMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NutritionMessagesRecord.fromSnapshot(s));

  static Future<NutritionMessagesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => NutritionMessagesRecord.fromSnapshot(s));

  static NutritionMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NutritionMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NutritionMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NutritionMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NutritionMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NutritionMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNutritionMessagesRecordData({
  String? role,
  String? content,
  String? messageId,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'role': role,
      'content': content,
      'message_id': messageId,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class NutritionMessagesRecordDocumentEquality
    implements Equality<NutritionMessagesRecord> {
  const NutritionMessagesRecordDocumentEquality();

  @override
  bool equals(NutritionMessagesRecord? e1, NutritionMessagesRecord? e2) {
    return e1?.role == e2?.role &&
        e1?.content == e2?.content &&
        e1?.messageId == e2?.messageId &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(NutritionMessagesRecord? e) => const ListEquality()
      .hash([e?.role, e?.content, e?.messageId, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is NutritionMessagesRecord;
}
