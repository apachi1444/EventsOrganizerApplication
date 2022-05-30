import 'package:flutter/cupertino.dart';
import 'package:pfs/services/professionalServiceService.dart';

import '../Models/Service.dart';

class DisplayProfessionalsToGuest extends ChangeNotifier {
  final String _professionalUid;

  DisplayProfessionalsToGuest(this._professionalUid);

  final ProfessionalServiceService _professionalServiceService =
      ProfessionalServiceService(professionalUid: '');

  late List<Service> _listProfessionals;

  // List<Service?> getAllServicesOfProfessional(){
  //   return _professionalServiceService.getAllServicesOfProfessional();
  // }

}
