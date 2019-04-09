import 'package:flutter_test/flutter_test.dart';
import 'package:cafeteria_tw/widget/login_page.dart';
import 'package:flutter/material.dart';
import 'package:cafeteria_tw/constants/style.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver{}

void main() {
  testWidgets("should have background color set as blue", (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new LoginPage()));
    Scaffold scaffold = tester.widget(find.byType(Scaffold));

    expect(scaffold.backgroundColor, Colors.teal);
  });

  testWidgets("Should have elevation 0 for appbar", (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new LoginPage()));
    AppBar appBar = tester.widget(find.byType(AppBar));

    expect(appBar.elevation, 0);
  });

  testWidgets("should have Main Axis Alignment of column as center", (WidgetTester tester) async{
    await tester.pumpWidget(new MaterialApp(home: new LoginPage()));
    Column column = tester.widget(find.byType(Column));

    expect(column.mainAxisAlignment, MainAxisAlignment.center);
  });
  
  testWidgets("Should have Padding LTRB(20, 10 , 20, 10) for all widgets of column", (WidgetTester tester) async{
    await tester.pumpWidget(new MaterialApp(home: new LoginPage()));
    Column column = tester.widget(find.byType(Column));

    List<Widget> loginPaddingWidgets = column.children;

    for(Padding padding in loginPaddingWidgets)
      expect(padding.padding, Style.loginWidgetsPadding);
  });
  
  testWidgets("should have widgets in order", (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new LoginPage()));
    Column column = tester.widget(find.byType(Column));

    List<Widget> columnChildrenWidgets = column.children;

    List<Padding> loginPaddingWidgets = columnChildrenWidgets.map((Widget widget){
      Padding padding = widget;
      return padding;
    }).toList();

    expect(loginPaddingWidgets[0].key, new Key("adminLoginHeadingPadding"));
    expect(loginPaddingWidgets[1].key, new Key("usernameTextFieldPadding"));
    expect(loginPaddingWidgets[2].key, new Key("passwordTextFieldPadding"));
    expect(loginPaddingWidgets[3].key, new Key("loginButtonPadding"));
    expect(loginPaddingWidgets[4].key, new Key("errorMessagePadding"));
  });

  testWidgets("Should have title Admin Login & style as heading1White", (WidgetTester tester) async{
    await tester.pumpWidget(new MaterialApp(home: new LoginPage()));
    Padding adminLoginHeading = tester.widget(find.byKey(new Key("adminLoginHeadingPadding")));
    Text adminLoginHeadingText = adminLoginHeading.child;

    expect(adminLoginHeadingText.data, "Admin Login");
    expect(adminLoginHeadingText.style, Style.heading1White);
  });

  testWidgets("Should have username textfield with appropriate properties", (WidgetTester tester) async{
    await tester.pumpWidget(new MaterialApp(home: new LoginPage()));
    Padding usernameField = tester.widget(find.byKey(new Key("usernameTextFieldPadding")));
    TextField usernameTextField = usernameField.child;
    InputDecoration inputDecorationForUsernameField = usernameTextField.decoration;

    expect(usernameTextField.autofocus, true);
    expect(inputDecorationForUsernameField.labelText, "Username");
    expect(inputDecorationForUsernameField.filled, true);
    expect(inputDecorationForUsernameField.labelStyle, Style.paragraphBlack18);
    expect(inputDecorationForUsernameField.fillColor, Colors.white);
  });

  testWidgets("Should have password textfield with appropriate properties", (WidgetTester tester) async{
    await tester.pumpWidget(new MaterialApp(home: new LoginPage()));
    Padding passwordField = tester.widget(find.byKey(new Key("passwordTextFieldPadding")));
    TextField passwordTextField = passwordField.child;
    InputDecoration inputDecorationForUsernameField = passwordTextField.decoration;

    expect(passwordTextField.obscureText, true);
    expect(inputDecorationForUsernameField.labelText, "Password");
    expect(inputDecorationForUsernameField.filled, true);
    expect(inputDecorationForUsernameField.labelStyle, Style.paragraphBlack18);
    expect(inputDecorationForUsernameField.fillColor, Colors.white);
  });

  testWidgets("Should have password textfield with appropriate properties", (WidgetTester tester) async{
    await tester.pumpWidget(new MaterialApp(home: new LoginPage()));
    
    Padding loginButton = tester.widget(find.byKey(new Key("loginButtonPadding")));
    RaisedButton loginRaisedButton = loginButton.child;
    Text loginButtonText = loginRaisedButton.child;
    
    expect(loginButtonText.data, "Login");
    expect(loginRaisedButton.color, Colors.black54);
    expect(loginRaisedButton.textColor, Colors.white);
    expect(loginRaisedButton.splashColor, Colors.blue);
    expect(loginRaisedButton.animationDuration, new Duration(microseconds: 1));
  });
  
  testWidgets("should show error if the user is not authenticated", (WidgetTester tester) async{
    await tester.pumpWidget(new MaterialApp(home: new LoginPage()));

    await tester.enterText(find.byKey(Key("usernameTextField")), "wrong_username");
    await tester.enterText(find.byKey(Key("passwordTextField")), "wrong_password");
    await tester.tap(find.byType(RaisedButton));
    await tester.pump();

    Padding padding = tester.widget(find.byKey(Key("errorMessagePadding")));
    Text errorMessageText = padding.child;

    expect(errorMessageText.data, "Invalid Username or Password");
    expect(padding.padding, Style.loginWidgetsPadding);
    expect(errorMessageText.style, Style.errorText);
  });

  testWidgets("should not show error message in intital state", (WidgetTester tester) async{
    await tester.pumpWidget(new MaterialApp(home: new LoginPage()));
    expect(find.text("Invalid Username or Password"), findsNothing);
  });
}