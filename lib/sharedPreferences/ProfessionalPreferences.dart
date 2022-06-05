import 'package:shared_preferences/shared_preferences.dart';

class ProfessionalPreferences {
  static SharedPreferences? _sharedPreferences;

  static const _keyUserName = 'username';
  static const _keyUid = 'uid';
  static const _keyFirstName = 'firstname';
  static const _keyLastName = 'lastname';
  static const _keyEmail = 'email';
  static const _keyAge = 'age';
  static const _keyLocalisation = 'localisation';

  static Future init() async =>
      {_sharedPreferences = await SharedPreferences.getInstance()};

  static Future setUid(String uid) async =>
      await _sharedPreferences?.setString(_keyUid, uid);

  static String? getUid() => _sharedPreferences?.getString(_keyUid);

  static Future setUserName(String username) async =>
      await _sharedPreferences?.setString(_keyUserName, username);

  static String? getUsername() => _sharedPreferences?.getString(_keyUserName);

  static Future setFirstName(String firstName) async =>
      await _sharedPreferences?.setString(_keyFirstName, firstName);

  static String? getFirstName() => _sharedPreferences?.getString(_keyFirstName);

  static Future setLastName(String lastName) async =>
      await _sharedPreferences?.setString(_keyLastName, lastName);

  static String? getLastName() => _sharedPreferences?.getString(_keyLastName);

  static Future setEmail(String email) async =>
      await _sharedPreferences?.setString(_keyEmail, email);
  static String? getEmail() => _sharedPreferences?.getString(_keyEmail);

  static Future setAge(int age) async =>
      await _sharedPreferences?.setInt(_keyAge, age);

  static int? getAge() => _sharedPreferences?.getInt(_keyAge);

  static Future setLocalisation(String localisation) async =>
      await _sharedPreferences?.setString(_keyLocalisation, localisation);

  static String? getLocalisation() =>
      _sharedPreferences?.getString(_keyLocalisation);

  static void addingProfessionalDataToSharedPreferences(String email, int age,
      String firstName, String lastName, String localisation, String uid) {
    ProfessionalPreferences.setEmail(email);
    ProfessionalPreferences.setAge(age);
    ProfessionalPreferences.setFirstName(firstName);
    ProfessionalPreferences.setLastName(lastName);
    ProfessionalPreferences.setLocalisation(localisation);
    ProfessionalPreferences.setUid(uid);
  }

  static void updatingProfessionalData(
      String firstName, String lastName, String localisation) {
    ProfessionalPreferences.setFirstName(firstName);
    ProfessionalPreferences.setLastName(lastName);
    ProfessionalPreferences.setLocalisation(localisation);
  }
}
