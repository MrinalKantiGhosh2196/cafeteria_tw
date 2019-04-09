import 'package:flutter_test/flutter_test.dart';
import 'package:cafeteria_tw/service/user_authenticator.dart';
import 'package:cafeteria_tw/model/user.dart';

void main(){
  test("should return true for providing admin credentials", () {
    User user = User("admin", "admin");
    expect(true, UserAuthenticator.isAuthenticUser(user));
  });

  test("should return false for providing wrong admin credentials", () {
    User user = User("admin", "password");
    expect(false, UserAuthenticator.isAuthenticUser(user));
  });
}