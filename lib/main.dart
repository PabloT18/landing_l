import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landing_l/app/app.dart';
import 'package:landing_l/app/data/sources/local/enviroment.dart';

import 'core/app_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Environment.initEnvironment();

  Bloc.observer = const AppBlocObserver();

  // runApp(MultiRepositoryProvider(
  //     providers: AppDependencies.initDependencies(), child: MyApp()));

  runApp(MyApp());
}
