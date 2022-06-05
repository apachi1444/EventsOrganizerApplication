class ConstantColors {
  static const KGreyColor = 0XFFF8F4F4;
  static const KPinkColor = 0XFFFF006B;
  static const KGreenColor = 0XFF00CD4C;

  static var activeColor = 0xFFC7D0D8;

  static var inactiveColor = 0xFF000000;

  // String getGreyColor() {return KGreyColor;}
  // String getPinkColor() {return KPinkColor;}

}

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
const String kEmailNullError = 'Please Enter your email';
const String kInvalidEmailError = 'Please Enter Valid Email';
const String kPassNullError = 'Please Enter your password';
const String kShortPassError = 'Password is too short';
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = 'Please Enter your name';
const String kPhoneNumberNullError = 'Please Enter your phone number';
const String kAddressNullError = 'Please Enter your address';
