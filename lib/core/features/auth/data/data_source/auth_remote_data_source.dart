import 'package:dio/dio.dart';
import 'package:sales_apps/core/core/network/api_client.dart';
import 'package:sales_apps/core/features/auth/data/model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> register(String email, String password, String jabatan);
  Future<Map<String, dynamic>> login(String email, String password);
  Future<String> registerFace(String email, String imagePath);
  Future<Map<String, dynamic>> faceLogin(String email, String imagePath);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient client;
  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<UserModel> register(String email, String password, String jabatan) async {
    final response = await client.dio.post('/auth/register', data: {
      "email": email,
      "password": password,
      "jabatan": jabatan,
    });
    return UserModel.fromJson(response.data);
  }

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await client.dio.post('/auth/login', data: {
      "email": email,
      "password": password,
    });
    return response.data;
  }

  @override
  Future<String> registerFace(String email, String imagePath) async {
    final formData = FormData.fromMap({
      "email": email,
      "image": await MultipartFile.fromFile(imagePath),
    });
    final response = await client.dio.post('/auth/register-face', data: formData);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> faceLogin(String email, String imagePath) async {
    final formData = FormData.fromMap({
      "email": email,
      "image": await MultipartFile.fromFile(imagePath),
    });
    final response = await client.dio.post('/auth/face-login', data: formData);
    return response.data;
  }
}