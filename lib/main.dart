import 'package:alpha16/providers/database_provider.dart';
import 'package:alpha16/providers/top_section_provider.dart';
import 'package:alpha16/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'providers/counter_provider.dart';
import 'screens/settings/settings.dart';

void main() {
  runApp(Alpha16());
}

class Alpha16 extends StatelessWidget {
  const Alpha16({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CouterProvider()),
        ChangeNotifierProvider(create: (context) => TopSectionProvider()),
        ChangeNotifierProvider(create: (context) => DatabaseProvider()),
      ],
      child: MaterialApp.router(
        theme: ThemeData(fontFamily: 'gilroy-bold'),
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      ),
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen(), routes: [
      GoRoute(path: '/settings', builder: (context, state) => SettingsScreens())
    ]),
  ],
);
