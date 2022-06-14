import 'package:flutter/material.dart';

import '../sharedPreferences/SearchFiltersPreferences.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text) {
    if (text == null) return;
    final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red);
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static String returnImageCategory(String category) {
    switch (category) {
      case 'Traiteur':
        {
          return 'assets/traiteur.jpg';
        }
      case 'Neggafa':
        {
          return 'assets/neggafa.jpg';
        }
      case 'WeddingPlanner':
        {
          return 'assets/fiancee.jpg';
        }
      case 'Dj':
        {
          return 'assets/djPhoto.jpg';
        }
      case 'Photographer':
        {
          return 'assets/photographer.jpg';
        }
      default:
        return '/assets/googleIcon.png';
    }
  }

  static void toggleTheParameterOfSearchPreference(
      String key, bool isSelected) {
    switch (key) {
      case '_keyUnder200':
        {
          SearchFiltersPreferences.setUnder200(!isSelected);
          break;
        }
      case '_keyCasablanca':
        {
          SearchFiltersPreferences.setCasablanca(!isSelected);
          break;
        }

      case '_keyAgadir':
        {
          SearchFiltersPreferences.setAgadir(!isSelected);
          break;
        }

      case '_keyMarrakech':
        {
          SearchFiltersPreferences.setFiancee(!isSelected);
          break;
        }

      case '_keyTraiteur':
        {
          SearchFiltersPreferences.setTrateur(!isSelected);
          break;
        }

      case '_keyFiancee':
        {
          SearchFiltersPreferences.setFiancee(!isSelected);
          break;
        }

      case '_keyNeggafa':
        {
          SearchFiltersPreferences.setNeggafa(!isSelected);
          break;
        }

      case '_keyDj':
        {
          SearchFiltersPreferences.setDj(!isSelected);
          break;
        }
    }
  }

  static bool? displayValueOfFilterKey(String key) {
    switch (key) {
      case '_keyUnder200':
        {
          return SearchFiltersPreferences.getUnder200();
        }
      case '_keyCasablanca':
        {
          return SearchFiltersPreferences.getCasablanca();
        }

      case '_keyAgadir':
        {
          return SearchFiltersPreferences.getAgadir();
        }

      case '_keyMarrakech':
        {
          return SearchFiltersPreferences.getMarrakech();
        }

      case '_keyTraiteur':
        {
          return SearchFiltersPreferences.getTraiteur();
        }

      case '_keyFiancee':
        {
          return SearchFiltersPreferences.getFiancee();
        }

      case '_keyNeggafa':
        {
          return SearchFiltersPreferences.getFiancee();
        }

      case '_keyDj':
        {
          return SearchFiltersPreferences.getDj();
        }
    }
    return null;
  }
}
