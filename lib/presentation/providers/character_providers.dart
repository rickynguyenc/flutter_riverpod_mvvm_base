import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dhy_flutter_app/data/repositories/character_repository_impl.dart';
import 'package:dhy_flutter_app/data/datasources/local/local_storage.dart';
import 'package:dhy_flutter_app/core/network/api.dart';
import 'package:dhy_flutter_app/domain/repository/character_repository.dart';
import 'package:dhy_flutter_app/domain/usecase/get_all_characters.dart';
import 'package:dhy_flutter_app/main.dart';

// -----------------------------------------------------------------------------
// Presentation
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Domain
// -----------------------------------------------------------------------------
final characterRepositoryProvider = Provider<CharacterRepository>(
  (ref) => CharacterRepositoryImpl(
    api: ref.read(apiProvider),
    localStorage: ref.read(localStorageProvider),
  ),
);

final getAllCharactersProvider = Provider(
  (ref) => GetAllCharacters(
    repository: ref.read(characterRepositoryProvider),
  ),
);

// -----------------------------------------------------------------------------
// Data
// -----------------------------------------------------------------------------
final apiProvider = Provider<Api>((ref) => ApiImpl());

final localStorageProvider = Provider<LocalStorage>(
  (ref) => LocalStorageImpl(sharedPreferences: sharedPref),
);
