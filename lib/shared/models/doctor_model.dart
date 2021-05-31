import 'dart:convert';

class DoctorModel {
  String id;
  double amount;
  String address;
  String phone;
  String name;
  String crm;

  DoctorModel({
    required this.id,
    required this.amount,
    required this.address,
    required this.phone,
    required this.name,
    required this.crm,
  });

  DoctorModel copyWith({
    String? id,
    double? amount,
    String? address,
    String? phone,
    String? name,
    String? crm,
  }) {
    return DoctorModel(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      crm: crm ?? this.crm,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'address': address,
      'phone': phone,
      'name': name,
      'crm': crm,
    };
  }

  factory DoctorModel.fromMap(String id, Map<String, dynamic> map) {
    return DoctorModel(
      id: id,
      amount: map['amount'].toDouble(),
      address: map['address'],
      phone: map['phone'],
      name: map['name'],
      crm: map['crm'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorModel.fromJson(String id, String source) =>
      DoctorModel.fromMap(id, json.decode(source));

  @override
  String toString() {
    return 'DoctorModel(id: $id, amount: $amount, address: $address, phone: $phone, name: $name, crm: $crm)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DoctorModel &&
        other.id == id &&
        other.amount == amount &&
        other.address == address &&
        other.phone == phone &&
        other.name == name &&
        other.crm == crm;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        amount.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        name.hashCode ^
        crm.hashCode;
  }
}
