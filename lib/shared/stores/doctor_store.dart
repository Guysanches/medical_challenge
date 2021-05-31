import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_challenge/shared/models/doctor_model.dart';
import 'package:mobx/mobx.dart';
part 'doctor_store.g.dart';

enum StatusList { initial, loading, loaded, error, empty }

class DoctorStore = _DoctorStoreBase with _$DoctorStore;

abstract class _DoctorStoreBase with Store {
  final FirebaseFirestore cFirebase = FirebaseFirestore.instance;

  @observable
  List<DoctorModel> cItems = [];

  @observable
  StatusList cStatusList = StatusList.initial;

  @observable
  String messageError = '';

  @action
  Future<DoctorModel> getDoctor(String id) async {
    return await cFirebase
        .collection('doctors')
        .doc(id)
        .get()
        .then((value) => DoctorModel.fromMap(value.id, value.data()!));
  }

  @action
  Future getItems() async {
    cItems = [];
    try {
      cStatusList = StatusList.loading;
      await cFirebase.collection('doctors').get().then(
        (value) {
          value.docs.forEach(
            (element) {
              cItems.add(
                DoctorModel.fromMap(
                  element.id,
                  element.data(),
                ),
              );
            },
          );
        },
      );

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
  Future delete(DoctorModel doctor) async {
    await cFirebase.collection('doctors').doc(doctor.id).delete();

    getItems();
  }
}
