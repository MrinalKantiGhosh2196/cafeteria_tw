import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cafeteria_tw/widget/menu_item.dart';
import 'package:cafeteria_tw/widget/build_icon_button.dart';

void main() {
  testWidgets("should contain proper title in ListTile", (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new MenuItem("Chicken Sandwich")));

    Card card = tester.widget(find.byType(Card));
    ListTile listTile = card.child;
    Text title = listTile.title;

    expect(title.data, "Chicken Sandwich");
  });

  testWidgets("should contain like and dislike icon buttons", (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new MenuItem("Chicken Sandwich")));

    Card card = tester.widget(find.byType(Card));
    ListTile listTile = card.child;
    Row row = listTile.trailing;
    List<Widget> iconButtons = row.children;

    expect(row.mainAxisSize, MainAxisSize.min);
    expect(find.byType(BuildIconButton), findsNWidgets(2));
  });
}