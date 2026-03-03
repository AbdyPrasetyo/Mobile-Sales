import 'package:sales_apps/core/features/auth/data/data_source/auth_remote_data_source.dart';

class LoginUseCase {
  final AuthRemoteDataSource dataSource;
  LoginUseCase(this.dataSource);

  Future<Map<String, dynamic>> call(String email, String password) {
    return dataSource.login(email, password);
  }
}