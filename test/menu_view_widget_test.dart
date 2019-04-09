import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:cafeteria_tw/widget/menu_view.dart';
import 'package:cafeteria_tw/model/meal_type.dart';

void main(){

  List<String> dummyMealMenu;


  setUp((){
    dummyMealMenu = ["Item1", "Item2", "Item3", "Item4"];
  });

  testWidgets("Should have necessary widgets", (WidgetTester tester) async{
    int numberOfDishes = dummyMealMenu.length;

    await tester.pumpWidget(
      new MaterialApp(
        home : new Material(
          child: new MenuView(dummyMealMenu)
        )
      )
    );

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(numberOfDishes));
  });

  testWidgets("should have correct menu items for breakfast", (WidgetTester tester) async{
    await tester.pumpWidget(
      new MaterialApp(
        home : new Material(
          child: new MenuView(dummyMealMenu)
        )
      )
    );

    Iterable<ListTile> menuItemsListTile = tester.widgetList(find.byType(ListTile));

    List<String> actualMenu = menuItemsListTile.map((ListTile listTile){
      Text menuItemText = listTile.title;
      return menuItemText.data;
    }).toList();

    expect(actualMenu, dummyMealMenu);
  });
}