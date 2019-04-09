import 'package:cafeteria_tw/model/user.dart';
import 'package:cafeteria_tw/constants/user_credential.dart';

class UserAuthenticator{

  static bool isAuthenticUser(User user){

    User adminUser = new User(UserCredential.adminUsername, UserCredential.adminPassword);

    return adminUser == user;
  }

}