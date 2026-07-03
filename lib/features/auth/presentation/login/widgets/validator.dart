import 'package:movie_app/core/helpers/app_regex.dart';

class Validator{

  static String? validatePassword(String? val){
    if(val==null || val.isEmpty){
      return "cannot be empty";
    }
    else if(!AppRegex.isPasswordValid(val)){
      return '''password should contain uppercase and lowercase\nletters, a special character and be at least 8 characters''';
    }
    return null;
  }

  static String? validateEmail(String? val){
    if(val==null || val.isEmpty){
      return "cannot be empty";
    }
    else if(!AppRegex.isEmailVaild(val)){
      return "Please enter a valid email";
    }
    return null;
  }

  static String? validateName(String? val){
    if(val==null || val.isEmpty){
      return "cannot be empty";
    }
    else if(val.length<2){
      return "Please enter a valid name";
    }
    return null;
  }

  static String? PasswordsMatch(String? val1,String? val2){
    if(val1!=val2){
      return "passwords do not match";
    }
    return null;
  }

}