import 'package:file_structure_flutter/database/local_database.dart';
import 'package:file_structure_flutter/models/users/user_model.dart';

bool isAuthorized() {
  final UserModel user = LocalDB.instance.getUser();
  return user.accessToken != null;
}

bool isMine(int? userId) {
  final UserModel userModel = LocalDB.instance.getUser();

  if (userModel.id == userId) return true;
  return false;
}

Future<bool?> localRequest({
  int seconds = 3,
  isSuccess = true,
}) async {
  await Future.delayed(
    Duration(seconds: seconds),
  );

  if (isSuccess) return isSuccess;

  return null;
}
