import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cafeteria_tw/widget/build_icon_button.dart';

void main() {
  mockOnPressed() {}

  testWidgets("should have appropriate properties for iconbutton", (WidgetTester tester) async{
    await tester.pumpWidget(new MaterialApp(home: new Material(child: new BuildIconButton(Icons.thumb_up, mockOnPressed(), true, Colors.blueAccent))));

    IconButton iconButton = tester.widget(find.byType(IconButton));
    Icon icon = iconButton.icon;

    expect(iconButton.padding, EdgeInsets.all(0));
    expect(icon.icon, Icons.thumb_up);
    expect(iconButton.color, Colors.blueAccent);
    expect(iconButton.disabledColor, Colors.grey);
    expect(iconButton.onPressed, mockOnPressed());
  });
}