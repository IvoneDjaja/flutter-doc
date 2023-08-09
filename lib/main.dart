import 'package:flutter/material.dart';
import 'package:flutter_project/pages/font.dart';
import 'package:flutter_project/pages/home.dart';
import 'package:flutter_project/pages/list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/list',
          builder: (context, state) => const ListPage(),
        ),
        GoRoute(
          path: '/font',
          builder: (context, state) => const FontPage(),
        ),
      ],
    );
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
