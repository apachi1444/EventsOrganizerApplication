import 'package:pfs/StateNotifier/ProfessionalPreferences.dart';

final fieldsOfProfessionals = [
  'Name',
  'Name',
  'Name',
  'Name',
  'Name',
  'Name',
];

final dataProfessional = [
  ProfessionalPreferences.getFirstName().toString(),
  ProfessionalPreferences.getLastName().toString(),
  ProfessionalPreferences.getEmail().toString(),
  ProfessionalPreferences.getLocalisation().toString(),
  'Gender',
  'Birth Date'
];
