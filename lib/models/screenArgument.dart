


import 'dart:convert' as convert;

class ScreenArgument {
  /// l'email de l'utilisateur 
  final String email;

  /// le mot de passe de l'utilisateur 
  final String password;

  /// indique si la page d'inscription sera en anglais, vrai francais , faux anglais 
  final bool trad;
  
  ScreenArgument(this.email, this.password, this.trad);

   static String base64Encode(String data){
    var content = convert.utf8.encode(data);
    var digest = convert.base64Encode(content);
    return digest;
  }

}