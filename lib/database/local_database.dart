import 'dart:convert';
import 'dart:io';

import 'package:file_structure_flutter/models/users/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class _ClearStorage {
  const _ClearStorage._();

  static const _ClearStorage instance = _ClearStorage._();

  Future<File> get _localFile async {
    final Directory directory = await getTemporaryDirectory();
    final String path = directory.path;
    return File('$path/first_launch.txt');
  }

  Future<bool?> readLaunch() async {
    try {
      final File file = await _localFile;
      final String content = await file.readAsString();
      return content.isNotEmpty ? false : null;
    } catch (e) {
      return null;
    }
  }

  Future<File> writeLaunch(bool launch) async {
    final File file = await _localFile;
    return file.writeAsString('$launch');
  }
}

class LocalDB {
  const LocalDB._();

  static const String _authBox = 'authBox';
  static const LocalDB instance = LocalDB._();

  Future<void> _initializeHive() async {
    await Hive.initFlutter();
    await Hive.openBox<String>(_authBox);
  }

  Future<void> ensureInitialized() async {
    await _initializeHive();

    const _ClearStorage clearStorage = _ClearStorage.instance;
    final bool? isFirst = await clearStorage.readLaunch();

    if (isFirst != null) return;

    await saveUser(const UserModel());
    await clearStorage.writeLaunch(false);
  }

  // [START] User

  Future<void> saveUser(UserModel user) async {
    final Box<String> authBox = Hive.box(_authBox);
    await authBox.put('authUser', jsonEncode(user.toJson()));
  }

  UserModel getUser() {
    final Box<String> authBox = Hive.box(_authBox);
    return UserModel.fromJson(
      jsonDecode(authBox.get('authUser')!),
    );
  }

// [END] User
}
