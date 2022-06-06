import 'package:shared_preferences/shared_preferences.dart';

class GuestPreferences {
  static SharedPreferences? _sharedPreferences;

  static const _keyUserName = 'username';
  static const _keyUid = 'uid';
  static const _keyLocalisation = 'localisation';

  static Future init() async =>
      {_sharedPreferences = await SharedPreferences.getInstance()};

  static Future setUid(String? uid) async =>
      await _sharedPreferences?.setString(_keyUid, uid!);

  static String? getUid() => _sharedPreferences?.getString(_keyUid);

  static Future setUserName(String username) async =>
      await _sharedPreferences?.setString(_keyUserName, username);

  static String? getUsername() => _sharedPreferences?.getString(_keyUserName);

  static Future setLocalisation(String localisation) async =>
      await _sharedPreferences?.setString(_keyLocalisation, localisation);

  static String? getLocalisation() =>
      _sharedPreferences?.getString(_keyLocalisation);

  static void addingGuestDataToSharedPreferences(
      String localisation, String name, String? uid) async {
    _sharedPreferences?.setString(_keyLocalisation, localisation);
    print("klsjdfklqjsdklfjqskldfjklqsdf");
    print(_sharedPreferences?.getString(_keyLocalisation));

    GuestPreferences.setUid(uid!);
    GuestPreferences.setUserName(name);
    SharedPreferences.getInstance().then((data) {
      data.getKeys().forEach((key) {
        print(key + "=" + data.get(key).toString());
      });
    });
  }
}
