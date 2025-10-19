import 'package:foodi/local_storage_service/app_keys/app_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalDataStorage {
  AppLocalDataStorage._();
  static SharedPreferences? _preferences;
  static Future<SharedPreferences> init() async {
    return _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData() async {
    return await _preferences!.setBool(AppKey.firstTimeAppOpen, true);
  }

  static bool? getData() {
    return _preferences!.getBool(AppKey.firstTimeAppOpen) ?? false;
  }
}
