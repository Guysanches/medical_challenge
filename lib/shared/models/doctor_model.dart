import 'dart:convert';

class DoctorModel {
  final String uId;
  final String address;
  final num amount;
  final String crm;
  final String name;
  final String phone;

  DoctorModel({
    required this.uId,
    required this.address,
    required this.amount,
    required this.crm,
    required this.name,
    required this.phone,
  });

  DoctorModel copyWith({
    String? uId,
    String? address,
    num? amount,
    String? crm,
    String? name,
    String? phone,
  }) {
    return DoctorModel(
      uId: uId ?? this.uId,
      address: address ?? this.address,
      amount: amount ?? this.amount,
      crm: crm ?? this.crm,
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'address': address,
      'amount': amount,
      'crm': crm,
      'name': name,
      'phone': phone,
    };
  }

  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    return DoctorModel(
      uId: map['uId'],
      address: map['address'],
      amount: map['amount'],
      crm: map['crm'],
      name: map['name'],
      phone: map['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorModel.fromJson(String source) =>
      DoctorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DoctorModel(uId: $uId, address: $address, amount: $amount, crm: $crm, name: $name, phone: $phone)';
  }
}
