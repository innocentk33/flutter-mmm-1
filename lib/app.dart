import 'package:flutter/material.dart';
import 'package:flutter_mmm/pages/details.dart';
import 'package:flutter_mmm/pages/home.dart';
import 'package:flutter_mmm/pages/login.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}


final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (ctx, state) => const Home(title: 'Desordre Page')
    ),
    GoRoute(
      name: 'details',
      path: '/details',
      builder: (ctx, state) => const Details()
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (ctx, state) => const Login()
    ),
  ]
);
