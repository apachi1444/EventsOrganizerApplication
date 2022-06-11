import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SearchFiltersPreferences {
  static SharedPreferences? _sharedPreferences;

  static const _keyUnder200 = '<200>';
  static const _keyCasablanca = 'Casablanca';
  static const _keyMarrakech = 'Marrakech';
  static const _keyAgadir = 'Agadir';
  static const _keyDj = 'Dj';
  static const _keyTraiteur = 'Traiteur';
  static const _keyNeggafa = 'Neggafa';
  static const _keyFiancee = 'Fiancee';

  static Future init() async =>
      {_sharedPreferences = await SharedPreferences.getInstance()};

  //------------------------------//

  static Future setUnder200(bool under200) async =>
      await _sharedPreferences?.setBool(_keyUnder200, under200);

  static bool? getUnder200()  =>
      _sharedPreferences?.getBool(_keyUnder200);

  //------------------------------//

  static Future setCasablanca(bool casa) async =>
      await _sharedPreferences?.setBool(_keyCasablanca, casa);

  static bool? getCasablanca( )  =>
      _sharedPreferences?.getBool(_keyCasablanca);

  //------------------------------//

  static Future setAgadir(bool agadir) async =>
      await _sharedPreferences?.setBool(_keyAgadir, agadir);

  static bool? getAgadir()  =>
      _sharedPreferences?.getBool(_keyAgadir);

  //------------------------------//

  static Future setMarrakech(bool casa) async =>
      await _sharedPreferences?.setBool(_keyMarrakech, casa);

  static bool? getMarrakech()  =>
      _sharedPreferences?.getBool(_keyMarrakech);

  //------------------------------//
  static Future setDj(bool casa) async =>
      await _sharedPreferences?.setBool(_keyDj, casa);

  static bool? getDj()  => _sharedPreferences?.getBool(_keyDj);

  //------------------------------//
  static Future setNeggafa(bool casa) async =>
      await _sharedPreferences?.setBool(_keyNeggafa, casa);

  static bool? getNeggafa()  =>
      _sharedPreferences?.getBool(_keyNeggafa);

  //------------------------------//

  static Future setFiancee(bool casa) async =>
      await _sharedPreferences?.setBool(_keyFiancee, casa);

  static bool? getFiancee()  =>
      _sharedPreferences?.getBool(_keyFiancee);

  //------------------------------//
  static Future setTrateur(bool casa) async =>
      await _sharedPreferences?.setBool(_keyTraiteur, casa);

  static bool? getTraiteur()  =>
      _sharedPreferences?.getBool(_keyTraiteur);

  //------------------------------//

  static void addingGuestDataToSharedPreferences(
      String localisation, String name, String? uid) async {}
}
