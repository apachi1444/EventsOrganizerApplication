class EmailValidator{
  static String? validate(String? value){
    if (value!.isEmpty){
      return "Email can't be empty";
    }
    if(value.length < 3){
      return 'Name must be at least 3 chars';
    }
    return null;
  }
}

class PasswordValidator{
  static String? validate(String? value){
    if (value!.isEmpty){
      return "Password can't be empty";
    }
    if(value.length < 3){
      return 'Name must be at least 3 chars';
    }
    return null;
  }
}


class DescriptionValidator{
  static String? validate(String? value){
    if (value!.isEmpty){
      return "description can't be empty";
    }
    if(value.length < 3){
      return 'Name must be at least 3 chars';
    }
    return null;
  }
}

class PriceValidator{
  static String? validate(String? value){
    if (value!.isEmpty){
      return "price can't be empty";
    }
    if(value.length < 3){
      return 'Name must be at least 3 chars';
    }
    return null;
  }
}

class FirstNameValidator{
  static String? validate(String? value){
    if (value!.isEmpty){
      return "firstName can't be empty";
    }
    if(value.length < 3){
      return 'Name must be at least 3 chars';
    }
    return null;
  }
}

class LastNameValidator{
  static String? validate(String? value){
    if (value!.isEmpty){
      return "firstName can't be empty";
    }
    if(value.length < 3){
      return 'Name must be at least 3 chars';
    }
    return null;
  }
}

class LocalisationValidator{
  static String? validate(String? value){
    if (value!.isEmpty){
      return "firstName can't be empty";
    }
    if(value.length < 3){
      return 'Name must be at least 3 chars';
    }
    return null;
  }
}

class AgeValidator{
  static String? validate(String? value){
    RegExp _regExp = RegExp(r'^[0-9]+$');

    var bool = _regExp.hasMatch(value!);
    if ( !bool ){
      return 'you should type a number';
    }
    return null;
  }
}



