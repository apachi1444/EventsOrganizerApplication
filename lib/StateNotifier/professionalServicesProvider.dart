import 'package:flutter/cupertino.dart';
import 'package:pfs/sharedPreferences/ProfessionalPreferences.dart';

class ProfessionalServicesProvider extends ChangeNotifier {
  String? firstName = ProfessionalPreferences.getFirstName();
  String? lastName = ProfessionalPreferences.getLastName();
  String? email = ProfessionalPreferences.getEmail();
}
