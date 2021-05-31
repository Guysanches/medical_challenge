import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:medical_challenge/shared/models/doctor_model.dart';
import 'package:medical_challenge/shared/stores/doctor_store.dart';
import 'package:mobx/mobx.dart';
part 'doctor_form_store.g.dart';

class DoctorFormStore = _DoctorFormStoreBase with _$DoctorFormStore;

enum StateForm { initial, error, success, save }

abstract class _DoctorFormStoreBase with Store {
  final FirebaseFirestore cFirebase = FirebaseFirestore.instance;
  final FormErrorState error = FormErrorState();
  DoctorStore cData = GetIt.instance<DoctorStore>();

  @observable
  bool editing = false;

  @observable
  String id = '';

  @observable
  String name = '';

  @observable
  String crm = '';

  @observable
  String address = '';

  @observable
  String phone = '';

  @observable
  double amount = 0.0;

  @observable
  StateForm cStateForm = StateForm.initial;

  late List<ReactionDisposer> _disposers;

  @action
  Future getDoctor(String id) async {
    id = id;
    editing = true;

    DoctorModel doctor = await cData.getDoctor(id);
    id = doctor.id;
    phone = doctor.phone;
    name = doctor.name;
    amount = doctor.amount;
    crm = doctor.crm;
    address = doctor.address;
  }

  void setupValidations() {
    _disposers = [
      reaction((_) => name, validateName),
      reaction((_) => crm, validateCrm),
      reaction((_) => address, validateAddress),
      reaction((_) => phone, validatePhone),
      reaction((_) => amount, validateAmount)
    ];

    cStateForm = StateForm.initial;
    name = '';
    crm = '';
    address = '';
    phone = '';
    amount = 0.0;
    editing = false;
  }

  @action
  Future validateName(String value) async {
    if ((value == '') || (value.isEmpty))
      error.name = 'É necessário informar um nome';
    else
      error.name = '';
  }

  @action
  Future validateCrm(String value) async {
    if ((value == '') || (value.isEmpty)) {
      error.crm = 'É necessário informar um CRM';
    } else {
      if (await checkExistsCRM(value))
        error.crm = 'CRM já utilizado';
      else
        error.crm = '';
    }
  }

  @action
  void validateAddress(String value) {
    if ((value == '') || (value.isEmpty))
      error.address = 'É necessário informar um endereco';
    else
      error.address = '';
  }

  @action
  void validatePhone(String value) {
    if ((value == '') || (value.isEmpty))
      error.phone = 'É necessário informar um telefone';
    else
      error.phone = '';
  }

  @action
  void validateAmount(double value) {
    if (value == 0.0)
      error.amount = 'O Valor da consulta está zerado';
    else
      error.amount = '';
  }

  Future<bool> checkExistsCRM(String value) async {
    if (editing) return false;

    bool exists = false;

    await cFirebase
        .collection('doctors')
        .where('crm', isEqualTo: value)
        .get()
        .then((value) => exists = value.docs.isNotEmpty);

    return exists;
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void save(BuildContext context) async {
    cStateForm = StateForm.save;
    await validateAll();

    if (cStateForm != StateForm.error) {
      if (id == '') {
        await createDoctorData(DoctorModel(
            id: id,
            amount: amount,
            address: address,
            phone: phone,
            name: name,
            crm: crm));
      } else {
        await updateDoctorData(DoctorModel(
            id: id,
            amount: amount,
            address: address,
            phone: phone,
            name: name,
            crm: crm));
      }
      cStateForm = StateForm.success;
      cData.getItems();
      Navigator.of(context).pop();
    }
  }

  Future validateAll() async {
    validateName(name);
    await validateCrm(crm);
    validateAddress(address);
    validatePhone(phone);
    validateAmount(amount);

    if (error.hasErrors) cStateForm = StateForm.error;
  }

  Future createDoctorData(DoctorModel doctor) async {
    await cFirebase.collection('doctors').doc().set(doctor.toMap());
  }

  Future updateDoctorData(DoctorModel doctor) async {
    await cFirebase.collection('doctors').doc(doctor.id).update(doctor.toMap());
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String name = '';

  @observable
  String crm = '';

  @observable
  String address = '';

  @observable
  String phone = '';

  @observable
  String amount = '';

  @computed
  bool get hasErrors =>
      name != '' || crm != '' || address != '' || phone != '' || amount != '';
}
