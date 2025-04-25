import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavor { development, staging, production }

class Environment {
  static Flavor? get getFlavor => EnumToString.fromString(
      Flavor.values,
      const String.fromEnvironment(
          'FLAVOR')); // check --dart-define=FLAVOR=development in makefile

  static String get fileName =>
      getFlavor == Flavor.production ? '.env.production' : '.env.development';
  static String get apiUrl => dotenv.env['API_URL'] ?? 'MY_FALLBACK';
}
