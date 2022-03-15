
import 'package:dio/dio.dart';
import 'package:file_structure_flutter/database/local_database.dart';
import 'package:file_structure_flutter/models/users/user_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BaseRepository {
  BaseRepository() {
    api = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        validateStatus: (_) => true,
      ),
    );

    api.interceptors.addAll([
      PrettyDioLogger(
        requestBody: true,
      ),
      InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) async {
          final UserModel user = LocalDB.instance.getUser();
          final String? accessToken = user.accessToken;
          final String? refreshTokenS = user.refreshToken;

          if (accessToken != null && refreshTokenS != null) {
            if (options.headers['Authorization'] == null) {
              options.headers['Authorization'] = 'Bearer $accessToken';
            }

            if (JwtDecoder.isExpired(accessToken)) {
              final UserModel? response = await refreshToken(
                refreshToken: refreshTokenS,
              );

              if (response != null) {
                await LocalDB.instance.saveUser(
                  user.copyWith(
                    accessToken: response.accessToken,
                  ),
                );

                options.headers['Authorization'] =
                    'Bearer ${response.accessToken}';
              }
            }
          }
          return handler.next(options);
        },
        onResponse: (Response response, handler) async {
          return handler.next(response);
        },
        onError: (DioError error, handler) {
          return handler.next(error);
        },
      ),
    ]);
  }

  static const String baseUrl = 'https://api.instantwebtools.net/';

  late final Dio api;

  final Dio _tokenApi = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      validateStatus: (_) => true,
    ),
  );

  Future<UserModel?> refreshToken({
    required String refreshToken,
  }) async {
    final FormData formData = FormData();

    formData.fields.add(
      MapEntry('refresh', refreshToken),
    );

    final Response response = await _tokenApi.post(
      '/oauth2',
      data: formData,
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(
        response.data['data'],
      );
    }

    return null;
  }
}
