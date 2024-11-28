import 'package:alpha16/hive/adapters.dart';
import 'package:alpha16/providers/database_provider.dart';
import 'package:alpha16/providers/top_section_provider.dart';
import 'package:alpha16/screens/home/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'providers/counter_provider.dart';
import 'screens/settings/settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DhikrAdapter());
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ru'), Locale('es')],
      path: 'assets/langs/langs.csv',
      assetLoader: CsvAssetLoader(),
      fallbackLocale: Locale('ru'),
      child: Alpha16()));
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
      child: KeyedSubtree(
        key: ValueKey(context.locale),
        child: MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(fontFamily: 'gilroy-bold'),
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
        ),
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
