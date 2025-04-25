import 'package:dhy_flutter_app/core/network/app_dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/login_dto.dart';
part 'auth_remote_datasource.g.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref);
});

@RestApi()
abstract class AuthService {
  factory AuthService(Ref ref) => _AuthService(ref.read(dioProvider));
  @FormUrlEncoded()
  @POST('/connect/token')
  Future<LoginResponseDto> login(@Body() Map<String, dynamic> param);
  @POST('/api/account/register')
  Future<dynamic> register(@Body() Map<String, dynamic> data);
  // @GET('/api/res_users/{id}')
  // Future<UserInforResponse> getUserInfor(@Path('id') int id);
  @POST('/api/app/global-lookup-table/send-password-reset-code')
  Future<dynamic> forgotPassword(@Body() Map<String, dynamic> data);
  @POST('/api/app/global-lookup-table/check-email-exits')
  Future<dynamic> checkMailExist(@Queries() Map<String, dynamic> data);
  @POST('/api/account/reset-password')
  Future<dynamic> resetPassword(@Body() Map<String, dynamic> data);
  @POST('/api/app/user-profile/change-password')
  Future<dynamic> changePassword(@Body() Map<String, dynamic> data);
}
