import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:cafeteria_tw/constants/constant_texts.dart';

void main(){
  group("user journey test", (){
    FlutterDriver driver;
    setUpAll(() async{
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if(driver != null){
        driver.close();
      }
    });

    test("should expect authentication error when logging in with incorrect credentials", () async{
      driver.tap(find.byType("MaterialButton"));
      await driver.tap(find.byValueKey("usernameTextField"));
      await driver.enterText("wrongUsername");
      await driver.tap(find.byValueKey("passwordTextField"));
      await driver.enterText("wrongPassword");
      await driver.tap(find.byValueKey("loginButton"));
      expect(await driver.getText(find.byValueKey("errorMessage")), ConstantText.loginAuthenticationErrorMessage);
    });

    test("should expect to navigate to homepage when logging in with correct credentials", () async{
      await driver.tap(find.byValueKey("usernameTextField"));
      await driver.enterText("admin");
      await driver.tap(find.byValueKey("passwordTextField"));
      await driver.enterText("admin");
      await driver.tap(find.byValueKey("loginButton"));
      await driver.waitFor(find.byValueKey("homepage"));
    });
  });
}