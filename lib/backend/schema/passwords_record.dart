import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class PasswordsRecord extends FirestoreRecord {
  PasswordsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "webAddress" field.
  String? _webAddress;
  String get webAddress => _webAddress ?? '';
  bool hasWebAddress() => _webAddress != null;

  // "usernameEmail" field.
  String? _usernameEmail;
  String get usernameEmail => _usernameEmail ?? '';
  bool hasUsernameEmail() => _usernameEmail != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _webAddress = snapshotData['webAddress'] as String?;
    _usernameEmail = snapshotData['usernameEmail'] as String?;
    _password = snapshotData['password'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('passwords')
          : FirebaseFirestore.instance.collectionGroup('passwords');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('passwords').doc();

  static Stream<PasswordsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PasswordsRecord.fromSnapshot(s));

  static Future<PasswordsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PasswordsRecord.fromSnapshot(s));

  static PasswordsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PasswordsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PasswordsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PasswordsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PasswordsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PasswordsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPasswordsRecordData({
  String? webAddress,
  String? usernameEmail,
  String? password,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'webAddress': webAddress,
      'usernameEmail': usernameEmail,
      'password': password,
    }.withoutNulls,
  );

  return firestoreData;
}

class PasswordsRecordDocumentEquality implements Equality<PasswordsRecord> {
  const PasswordsRecordDocumentEquality();

  @override
  bool equals(PasswordsRecord? e1, PasswordsRecord? e2) {
    return e1?.webAddress == e2?.webAddress &&
        e1?.usernameEmail == e2?.usernameEmail &&
        e1?.password == e2?.password;
  }

  @override
  int hash(PasswordsRecord? e) =>
      const ListEquality().hash([e?.webAddress, e?.usernameEmail, e?.password]);

  @override
  bool isValidKey(Object? o) => o is PasswordsRecord;
}
