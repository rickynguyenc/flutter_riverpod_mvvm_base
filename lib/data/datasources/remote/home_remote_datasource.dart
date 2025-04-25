import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/character_dto.dart';
import '../../../core/network/app_dio.dart';
part 'home_remote_datasource.g.dart';

final homeServiceProvider = Provider<HomeService>((ref) {
  return HomeService(ref);
});

@RestApi()
abstract class HomeService {
  factory HomeService(Ref ref) => _HomeService(ref.read(dioProvider));
  @GET('api/character')
  Future<CharactorResponse> getCharacters(Map<String, dynamic> param);
}
