import 'dart:convert';

import 'package:medical_challenge/shared/models/doctor_details_model.dart';

class Doctor {
  String uid;
  Doctor({required this.uid, required this.doctorDetails});
  DoctorDetails doctorDetails;

  Doctor copyWith({
    String? uid,
    DoctorDetails? doctorDetails,
  }) {
    return Doctor(
        uid: uid ?? this.uid,
        doctorDetails: doctorDetails ?? this.doctorDetails);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'doctorDetails': doctorDetails.toJson(),
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      uid: map['uid'],
      doctorDetails: DoctorDetails.fromMap(map['doctorDetails']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctor.fromJson(String source) => Doctor.fromMap(json.decode(source));

  @override
  String toString() => 'Doctor(uid: $uid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Doctor && other.uid == uid;
  }

  @override
  int get hashCode => uid.hashCode;
}
