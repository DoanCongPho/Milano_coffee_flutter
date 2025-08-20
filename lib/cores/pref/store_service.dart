import 'package:flutter_coffee_app/cores/pref/pref_key.dart';
import 'package:flutter_coffee_app/model/remote/auth/auth_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StoreService {
  Future<void> writeSecureData(String key, String? value);

  Future<String?> readSecureData(String key);

  Future<void> writeData(String key, dynamic value);

  String? getString(String key);

  bool? getBool(String key);

  Future<void> clearData();
}

class StoreServiceImp implements StoreService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);
  final SharedPreferences _preferences;

  StoreServiceImp(this._preferences);

  //Use Shared Preference

  @override
  Future<void> writeData(String key, dynamic value) async {
    if (value is String) {
      await _preferences.setString(key, value);
      return;
    } else if (value is bool) {
      await _preferences.setBool(key, value);
    }
  }

  @override
  Future<String?> readSecureData(String key) async {
    return _storage.read(key: key, aOptions: _getAndroidOptions());
  }

  @override
  Future<void> writeSecureData(String key, String? value) async {
    await _storage.write(key: key, value: value);
  }

  @override
  bool? getBool(String key) {
    return _preferences.getBool(key);
  }

  @override
  String? getString(String key) {
    return _preferences.getString(key);
  }

  @override
  Future<void> clearData() async {}
}

extension AuthResponseStorage on StoreService {
  Future<void> saveAuthResponse(AuthResponse auth) async {
    await writeData(PrefKey.token, auth.token);
    await writeData(PrefKey.userId, auth.id);
    await writeData(PrefKey.fullName, auth.fullName);
    await writeData(PrefKey.avatar, auth.avatar);
    await writeData(PrefKey.gender, auth.gender.toString());
    await writeData(PrefKey.birthday, auth.birthday);
    await writeData(PrefKey.address, auth.address);
    await writeData(PrefKey.fullAddress, auth.fullAddress);
    await writeData(PrefKey.email, auth.email);
    await writeData(PrefKey.city, auth.city);
    await writeData(PrefKey.district, auth.district);
    await writeData(PrefKey.ward, auth.ward);
    await writeData(PrefKey.phone, auth.phoneNumber);
  }
}
