import 'package:pfs/services/authService.dart';

import 'guestProfilePageClickInterface.dart';

class ButtonGuestProfilePageRoleInterfaceImpl
    implements ButtonGuestProfilePageRoleInterface {
  @override
  void editProfile() {}

  @override
  void logOut() {
    AuthService().signOut();
  }
}
