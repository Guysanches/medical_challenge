// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DoctorFormStore on _DoctorFormStoreBase, Store {
  final _$editingAtom = Atom(name: '_DoctorFormStoreBase.editing');

  @override
  bool get editing {
    _$editingAtom.reportRead();
    return super.editing;
  }

  @override
  set editing(bool value) {
    _$editingAtom.reportWrite(value, super.editing, () {
      super.editing = value;
    });
  }

  final _$nameAtom = Atom(name: '_DoctorFormStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$crmAtom = Atom(name: '_DoctorFormStoreBase.crm');

  @override
  String get crm {
    _$crmAtom.reportRead();
    return super.crm;
  }

  @override
  set crm(String value) {
    _$crmAtom.reportWrite(value, super.crm, () {
      super.crm = value;
    });
  }

  final _$addressAtom = Atom(name: '_DoctorFormStoreBase.address');

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$phoneAtom = Atom(name: '_DoctorFormStoreBase.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$amountAtom = Atom(name: '_DoctorFormStoreBase.amount');

  @override
  double get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(double value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  final _$validateNameAsyncAction =
      AsyncAction('_DoctorFormStoreBase.validateName');

  @override
  Future<dynamic> validateName(String value) {
    return _$validateNameAsyncAction.run(() => super.validateName(value));
  }

  final _$validateCrmAsyncAction =
      AsyncAction('_DoctorFormStoreBase.validateCrm');

  @override
  Future validateCrm(String value) {
    return _$validateCrmAsyncAction.run(() => super.validateCrm(value));
  }

  final _$createDoctorDataAsyncAction =
      AsyncAction('_DoctorFormStoreBase.createDoctorData');

  @override
  Future<dynamic> createDoctorData(DoctorModel doctor) {
    return _$createDoctorDataAsyncAction
        .run(() => super.createDoctorData(doctor));
  }

  final _$updateDoctorDataAsyncAction =
      AsyncAction('_DoctorFormStoreBase.updateDoctorData');

  @override
  Future<dynamic> updateDoctorData(DoctorModel doctor) {
    return _$updateDoctorDataAsyncAction
        .run(() => super.updateDoctorData(doctor));
  }

  final _$_DoctorFormStoreBaseActionController =
      ActionController(name: '_DoctorFormStoreBase');

  @override
  void validateAddress(String value) {
    final _$actionInfo = _$_DoctorFormStoreBaseActionController.startAction(
        name: '_DoctorFormStoreBase.validateAddress');
    try {
      return super.validateAddress(value);
    } finally {
      _$_DoctorFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePhone(String value) {
    final _$actionInfo = _$_DoctorFormStoreBaseActionController.startAction(
        name: '_DoctorFormStoreBase.validatePhone');
    try {
      return super.validatePhone(value);
    } finally {
      _$_DoctorFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateAmount(double value) {
    final _$actionInfo = _$_DoctorFormStoreBaseActionController.startAction(
        name: '_DoctorFormStoreBase.validateAmount');
    try {
      return super.validateAmount(value);
    } finally {
      _$_DoctorFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
editing: ${editing},
name: ${name},
crm: ${crm},
address: ${address},
phone: ${phone},
amount: ${amount}
    ''';
  }
}

mixin _$FormErrorState on _FormErrorState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorState.hasErrors'))
          .value;

  final _$nameAtom = Atom(name: '_FormErrorState.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$crmAtom = Atom(name: '_FormErrorState.crm');

  @override
  String get crm {
    _$crmAtom.reportRead();
    return super.crm;
  }

  @override
  set crm(String value) {
    _$crmAtom.reportWrite(value, super.crm, () {
      super.crm = value;
    });
  }

  final _$addressAtom = Atom(name: '_FormErrorState.address');

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$phoneAtom = Atom(name: '_FormErrorState.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$amountAtom = Atom(name: '_FormErrorState.amount');

  @override
  String get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(String value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  @override
  String toString() {
    return '''
name: ${name},
crm: ${crm},
address: ${address},
phone: ${phone},
amount: ${amount},
hasErrors: ${hasErrors}
    ''';
  }
}
