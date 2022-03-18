import 'package:dio/dio.dart';
import 'package:file_structure_flutter/repositories/base_repository.dart';

class AuthRepository {
  static final BaseRepository _baseRepository = BaseRepository();
  static final Dio _api = _baseRepository.api;

  Future<bool?> signIn({
    required String phone,
    required String password,
  }) async {
    final FormData formData = FormData();

    formData.fields.addAll([
      MapEntry('phone', phone),
      MapEntry('password', password),
    ]);

    final Response response = await _api.post(
      'login/',
      data: formData,
    );

    if (response.statusCode == 200) {
      return true;
    }

    return null;
  }
}
