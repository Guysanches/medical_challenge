// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DoctorStore on _DoctorStoreBase, Store {
  final _$cItemsAtom = Atom(name: '_DoctorStoreBase.cItems');

  @override
  List<DoctorModel> get cItems {
    _$cItemsAtom.reportRead();
    return super.cItems;
  }

  @override
  set cItems(List<DoctorModel> value) {
    _$cItemsAtom.reportWrite(value, super.cItems, () {
      super.cItems = value;
    });
  }

  final _$cStatusListAtom = Atom(name: '_DoctorStoreBase.cStatusList');

  @override
  StatusList get cStatusList {
    _$cStatusListAtom.reportRead();
    return super.cStatusList;
  }

  @override
  set cStatusList(StatusList value) {
    _$cStatusListAtom.reportWrite(value, super.cStatusList, () {
      super.cStatusList = value;
    });
  }

  final _$messageErrorAtom = Atom(name: '_DoctorStoreBase.messageError');

  @override
  String get messageError {
    _$messageErrorAtom.reportRead();
    return super.messageError;
  }

  @override
  set messageError(String value) {
    _$messageErrorAtom.reportWrite(value, super.messageError, () {
      super.messageError = value;
    });
  }

  final _$getDoctorAsyncAction = AsyncAction('_DoctorStoreBase.getDoctor');

  @override
  Future<DoctorModel> getDoctor(String id) {
    return _$getDoctorAsyncAction.run(() => super.getDoctor(id));
  }

  final _$getItemsAsyncAction = AsyncAction('_DoctorStoreBase.getItems');

  @override
  Future<dynamic> getItems() {
    return _$getItemsAsyncAction.run(() => super.getItems());
  }

  final _$deleteAsyncAction = AsyncAction('_DoctorStoreBase.delete');

  @override
  Future<dynamic> delete(DoctorModel doctor) {
    return _$deleteAsyncAction.run(() => super.delete(doctor));
  }

  @override
  String toString() {
    return '''
cItems: ${cItems},
cStatusList: ${cStatusList},
messageError: ${messageError}
    ''';
  }
}
