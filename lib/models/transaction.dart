import 'dart:convert';

import 'contact.dart';

class Transaction {
  final double value;
  final Contact contact;

  Transaction(this.value, this.contact);


  Transaction copyWith({double? value, Contact? contact}) {
    return Transaction(value ?? this.value, contact ?? this.contact);
  }

  Map<String, dynamic> toMap() {
    return {'value': value, 'contact': contact.toMap()};
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      map['value'],
      Contact.fromMap(map['contact']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source));


  @override
  String toString() => 'Transaction(value: $value, contact: $contact)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Transaction &&
        other.value == value &&
        other.contact == contact;
  }

  @override
  int get hashCode => value.hashCode ^ contact.hashCode;
}
