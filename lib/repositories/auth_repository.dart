import 'package:dio/dio.dart';
import 'package:file_structure_flutter/repositories/base_repository.dart';

class AuthRepository {
  static final BaseRepository _baseRepository = BaseRepository();
  static final Dio _api = _baseRepository.api;
}
