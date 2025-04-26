import 'package:auto_route/auto_route.dart';
import 'package:dhy_flutter_app/core/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'presentation/theme.dart';
import 'core/network/env.dart';

late SharedPreferences sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Environment.fileName);
  sharedPref = await SharedPreferences.getInstance();
  Animate.restartOnHotReload = true;

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  late AppRouter router;

  MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const theme = CustomTheme();
    useEffect(() {
      router = AppRouter();
      return null;
    }, []);
    return MaterialApp.router(
      locale: const Locale('vi', 'VN'),
      routeInformationParser: router.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(
        router,
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      debugShowCheckedModeBanner: false,
      // theme: EdocTheme.lightTheme,
      themeMode: ThemeMode.light,
      theme: theme.toThemeData(),
      darkTheme: theme.toThemeDataDark(),
    );
  }
}
