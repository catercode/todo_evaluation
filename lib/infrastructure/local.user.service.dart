import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_todo_app/infrastructure/model/localstorage.dart';

Future<bool> islogin({required LoginData userlogs}) async {
  try {
    var box = await Hive.openBox('verifyLogins');

    await box.put('userData', userlogs);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> hasUserLogin() async {
  try {
    var box = await Hive.openBox('verifyLogins');

    var logStatus = box.get('userData'); //

    if (logStatus != null) {
      bool loginStatus = logStatus.loginStatus;

      return loginStatus;
    } else {
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}
