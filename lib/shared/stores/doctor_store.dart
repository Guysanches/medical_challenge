import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_challenge/shared/models/doctor_details_model.dart';
import 'package:medical_challenge/shared/models/doctor_model.dart';
import 'package:mobx/mobx.dart';
part 'doctor_store.g.dart';

enum StatusList { initial, loading, loaded, error, empty }

class DoctorStore = _DoctorStoreBase with _$DoctorStore;

abstract class _DoctorStoreBase with Store {
  final FirebaseFirestore cFirebase = FirebaseFirestore.instance;

  @observable
  List<Doctor> cItems = [];

  @observable
  StatusList cStatusList = StatusList.initial;

  @observable
  String messageError = '';

  @action
  Future<List<Doctor>> getItems() async {
    cItems = [];
    try {
      cStatusList = StatusList.loading;
      await Future.delayed(Duration(seconds: 3), () async {
        await cFirebase.collection('doctors').get().then((value) {
          value.docs.forEach((element) {
            cItems.add(
              Doctor.fromMap(
                {
                  "uid": element.id,
                  "doctorDetails":
                      new DoctorDetails.fromMap(element.data()).toMap(),
                },
              ),
            );
          });
        });
      });

      if (cItems.isNotEmpty)
        cStatusList = StatusList.loaded;
      else
        cStatusList = StatusList.empty;

      return cItems;
    } catch (e) {
      cStatusList = StatusList.error;
      messageError = e.toString();
      return cItems = [];
    }
  }

  @action
  Future<void> createDoctorData(Doctor doctor) async {
    return await cFirebase
        .collection('doctors')
        .doc()
        .set(doctor.doctorDetails.toMap());
  }

  @action
  Future<void> updateDoctorData(Doctor doctor) async {
    return await cFirebase
        .collection('doctors')
        .doc(doctor.uid)
        .update(doctor.doctorDetails.toMap());
  }

  @action
  Future<void> delete(Doctor doctor) async {
    return await cFirebase.collection('doctors').doc(doctor.uid).delete();
  }
}
