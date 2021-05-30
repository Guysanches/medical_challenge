import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:medical_challenge/shared/stores/doctor_store.dart';
import 'core/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<DoctorStore>(DoctorStore());
  runApp(AppWidget());
}
