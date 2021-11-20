import 'dart:convert';

class Contact {
  final int id;
  final String name;
  final int accountNumber;

  Contact(this.id, this.name, this.accountNumber);

  @override
  String toString() =>
      'Contact(id: $id, name: $name, accountNumber: $accountNumber)';

  Contact copyWith({int? id, String? name, int? accountNumber}) {
    return Contact(
      id ?? this.id,
      name ?? this.name,
      accountNumber ?? this.accountNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'accountNumber': accountNumber,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      map['id']??0,
      map['name'],
      map['accountNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) =>
      Contact.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Contact &&
        other.id == id &&
        other.name == name &&
        other.accountNumber == accountNumber;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ accountNumber.hashCode;
}
