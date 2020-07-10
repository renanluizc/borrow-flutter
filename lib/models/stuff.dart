import 'dart:convert';

import 'package:intl/intl.dart';

class Stuff {
  int id;
  String description;
  String contactName;
  DateTime loanDate;
  String photoPath;
  String contactPhone;

  String get date => DateFormat("dd/MM/yyyy").format(loanDate);

  bool get photoExist => photoPath != null && photoPath.trim().isNotEmpty;

  Stuff({
    this.id,
    this.description,
    this.contactName,
    this.loanDate,
    this.photoPath,
    this.contactPhone,
  });

  Stuff copyWith({
    int id,
    String description,
    String contactName,
    DateTime loanDate,
    String photoPath,
    String contactPhone,
  }) {
    return Stuff(
      id: id ?? this.id,
      description: description ?? this.description,
      contactName: contactName ?? this.contactName,
      loanDate: loanDate ?? this.loanDate,
      photoPath: photoPath ?? this.photoPath,
      contactPhone: contactPhone ?? this.contactPhone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'contactName': contactName,
      'loanDate': loanDate?.millisecondsSinceEpoch,
      'photoPath': photoPath,
      'contactPhone': contactPhone,
    };
  }

  static Stuff fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Stuff(
      id: map['id'],
      description: map['description'],
      contactName: map['contactName'],
      loanDate: DateTime.fromMillisecondsSinceEpoch(map['loanDate']),
      photoPath: map['photoPath'],
      contactPhone: map['contactPhone'],
    );
  }

  String toJson() => json.encode(toMap());

  static Stuff fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Stuff(id: $id, description: $description, contactName: $contactName, loanDate: $loanDate, photoPath: $photoPath, contactPhone: $contactPhone)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Stuff &&
      o.id == id &&
      o.description == description &&
      o.contactName == contactName &&
      o.loanDate == loanDate &&
      o.photoPath == photoPath &&
      o.contactPhone == contactPhone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      description.hashCode ^
      contactName.hashCode ^
      loanDate.hashCode ^
      photoPath.hashCode ^
      contactPhone.hashCode;
  }
}
