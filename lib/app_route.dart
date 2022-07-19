import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_auto_route/main.dart';

class AppRouter {
  final router = GoRouter(routes: [
    GoRoute(
      path: FirstScreen.routeName,
      builder: (BuildContext context, GoRouterState state) =>
          const FirstScreen(),
    ),
    GoRoute(
      path: SecondScreen.routeName,
      builder: (BuildContext context, GoRouterState state) =>
          const SecondScreen(),
    ),
    GoRoute(
      path: ThirdScreen.routeName,
      builder: (BuildContext context, GoRouterState state) =>
       ThirdScreen(title: state.queryParams['title'] as String, msg: state.queryParams['msg'] as String),
    ),
  ]);
}
