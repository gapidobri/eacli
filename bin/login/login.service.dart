import 'package:chopper/chopper.dart';

import 'models/login_request.model.dart';
import 'models/login_response.model.dart';

part 'login.service.chopper.dart';

@ChopperApi(baseUrl: '/login')
abstract class LoginService extends ChopperService {
  static LoginService create([ChopperClient? client]) => _$LoginService(client);

  @Post()
  Future<Response<LoginResponse>> login(@Body() LoginRequest body);
}
