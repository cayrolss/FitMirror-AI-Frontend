import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FitnessMessagesRecord extends FirestoreRecord {
  FitnessMessagesRecord._(
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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _role = snapshotData['role'] as String?;
    _content = snapshotData['content'] as String?;
    _messageId = snapshotData['message_id'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('fitness_messages')
          : FirebaseFirestore.instance.collectionGroup('fitness_messages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('fitness_messages').doc(id);

  static Stream<FitnessMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FitnessMessagesRecord.fromSnapshot(s));

  static Future<FitnessMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FitnessMessagesRecord.fromSnapshot(s));

  static FitnessMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FitnessMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FitnessMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FitnessMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FitnessMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FitnessMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFitnessMessagesRecordData({
  String? role,
  String? content,
  String? messageId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'role': role,
      'content': content,
      'message_id': messageId,
    }.withoutNulls,
  );

  return firestoreData;
}

class FitnessMessagesRecordDocumentEquality
    implements Equality<FitnessMessagesRecord> {
  const FitnessMessagesRecordDocumentEquality();

  @override
  bool equals(FitnessMessagesRecord? e1, FitnessMessagesRecord? e2) {
    return e1?.role == e2?.role &&
        e1?.content == e2?.content &&
        e1?.messageId == e2?.messageId;
  }

  @override
  int hash(FitnessMessagesRecord? e) =>
      const ListEquality().hash([e?.role, e?.content, e?.messageId]);

  @override
  bool isValidKey(Object? o) => o is FitnessMessagesRecord;
}
