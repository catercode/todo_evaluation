import 'package:hive/hive.dart';

part 'localstorage.g.dart';

@HiveType(typeId: 0)
class LoginData extends HiveObject {
  LoginData({required this.loginStatus});

  @HiveField(0)
  bool? loginStatus;
}
