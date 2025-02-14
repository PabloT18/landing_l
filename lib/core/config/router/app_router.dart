import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import 'app_routes_pages.dart';
export 'app_routes_pages.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: PAGES.loading.pagePath,
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) {
      log('Route -> ${state.uri.toString()}');
      return null;
    },
    routes: [
      /// [HOME] Page Route
      GoRoute(
        path: PAGES.loading.pagePath,
        name: PAGES.loading.pageName,
        // pageBuilder: (context, state) => pageBuilderByPlatform(
        //   context,
        //   state,
        //   Container(),
        // ),
        builder: (context, state) => Container(),
      ),
    ],
  );

  static GoRouter get router => _router;
  static GlobalKey<NavigatorState> get navigatorState => _rootNavigatorKey;
}
