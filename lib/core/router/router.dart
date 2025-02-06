import 'package:go_router/go_router.dart';

import '../../presentation/pages/details.dart';
import '../../presentation/pages/home.dart';
import '../../presentation/pages/login.dart';

final router = GoRouter(initialLocation: '/login', routes: [
  GoRoute(name: 'home', path: '/', builder: (ctx, state) => const Home(title: 'Desordre Page')),
  GoRoute(
      name: 'details',
      path: '/details/:name/:address',
      builder: (ctx, state) => Details(name: state.pathParameters['name'], address: state.pathParameters['address'])),
  GoRoute(name: 'login', path: '/login', builder: (ctx, state) => const Login()),
]);
