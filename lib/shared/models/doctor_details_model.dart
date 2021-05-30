import 'dart:convert';

class DoctorDetails {
  double amount;
  String address;
  String phone;
  String name;
  String crm;

  DoctorDetails({
    required this.amount,
    required this.address,
    required this.phone,
    required this.name,
    required this.crm,
  });

  DoctorDetails copyWith({
    double? amount,
    String? address,
    String? phone,
    String? name,
    String? crm,
  }) {
    return DoctorDetails(
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

  factory DoctorDetails.fromMap(Map<String, dynamic> map) {
    return DoctorDetails(
      amount: map['amount'],
      address: map['address'],
      phone: map['phone'],
      name: map['name'],
      crm: map['crm'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorDetails.fromJson(String source) =>
      DoctorDetails.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DoctorDetails(amount: $amount, address: $address, phone: $phone, name: $name, crm: $crm)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DoctorDetails &&
        other.amount == amount &&
        other.address == address &&
        other.phone == phone &&
        other.name == name &&
        other.crm == crm;
  }

  @override
  int get hashCode {
    return amount.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        name.hashCode ^
        crm.hashCode;
  }
}
