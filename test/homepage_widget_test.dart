import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cafeteria_tw/widget/homepage.dart';
import 'package:cafeteria_tw/widget/menu_view.dart';
import 'package:cafeteria_tw/model/meal_type.dart';
import 'package:cafeteria_tw/model/meals.dart';
import 'package:matcher/matcher.dart' as matcher;
import 'package:cafeteria_tw/service/time_provider_service.dart';
import 'package:mockito/mockito.dart';
import 'package:cafeteria_tw/constants/style.dart';

class MockTimeProvider extends Mock implements TimeProvider {}

void main() {

  testWidgets("should contain necessary widgets with specific count", (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new Homepage(new TimeProvider())));

    expect(find.byType(DefaultTabController), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(TabBar), findsOneWidget);
    expect(find.byType(Tab), findsNWidgets(3));
    expect(find.byType(TabBarView), findsOneWidget);
    expect(find.byType(MenuView), findsOneWidget);
  });

  testWidgets("Should contain all necessary widgets", (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new Homepage(new TimeProvider())));

    DefaultTabController defaultTabController = tester.firstWidget(find.byType(DefaultTabController));
    Scaffold scaffold = defaultTabController.child;
    AppBar appBar = scaffold.appBar;

    expect(defaultTabController.child, matcher.TypeMatcher<Scaffold>());
    expect(scaffold.appBar, matcher.TypeMatcher<AppBar>());
    expect(scaffold.body, matcher.TypeMatcher<TabBarView>());
    expect(appBar.bottom, matcher.TypeMatcher<TabBar>());
  });

  testWidgets("should have correct App title & AppBar", (WidgetTester tester) async{
    await tester.pumpWidget(new MaterialApp(home: new Homepage(new TimeProvider())));

    AppBar appBar = tester.firstWidget(find.byType(AppBar));
    Row appBarRow = appBar.title;
    Text appBarTitleText = appBarRow.children[0];
    MaterialButton materialButton = appBarRow.children[1];
    Text buttonText = materialButton.child;

    expect(appBarTitleText.data, "TW Cafeteria");
    expect(appBarRow.mainAxisAlignment, MainAxisAlignment.spaceBetween);
    expect(buttonText.data, "Admin Login");
    expect(buttonText.style, Style.paragraphWhite);
  });

  testWidgets("should have breakfast, lunch and snacks tabbar", (WidgetTester tester) async{
    await tester.pumpWidget(new MaterialApp(home: new Homepage(new TimeProvider())));

    TabBar tabBar = tester.widget(find.byType(TabBar));
    List<Tab> tabs = tabBar.tabs;

    expect(tabs.length, 3);
    expect(tabs[0].text, "Breakfast");
    expect(tabs[1].text, "Lunch");
    expect(tabs[2].text, "Snacks");
  });

  testWidgets("should have Menu for breakfast, lunch and snacks in TabbarView", (WidgetTester tester) async{
    await tester.pumpWidget(new MaterialApp(home: new Homepage(new TimeProvider())));

    TabBarView tabBarView = tester.widget(find.byType(TabBarView));
    List<MenuView> menuViews = tabBarView.children;

    expect(menuViews.length, 3);
    expect(menuViews[0].menu, meals[MealType.breakfast]);
    expect(menuViews[1].menu, meals[MealType.lunch]);
    expect(menuViews[2].menu, meals[MealType.snacks]);
  });

  testWidgets("should have initialIndex as 0 at 10:00", (WidgetTester tester) async {
    var mockTimeProvider = new MockTimeProvider();
    when(mockTimeProvider.getCurrentTime()).thenReturn(new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,10));
    await tester.pumpWidget(new MaterialApp(home: new Homepage(mockTimeProvider)));

    DefaultTabController defaultTabController = tester.firstWidget(find.byType(DefaultTabController));
    expect(defaultTabController.length, 3);
    expect(defaultTabController.initialIndex, 0);
  });

  testWidgets("should have initialIndex as 1 at 14:00", (WidgetTester tester) async {
    var mockTimeProvider = new MockTimeProvider();
    when(mockTimeProvider.getCurrentTime()).thenReturn(new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,14));
    await tester.pumpWidget(new MaterialApp(home: new Homepage(mockTimeProvider)));

    DefaultTabController defaultTabController = tester.firstWidget(find.byType(DefaultTabController));
    expect(defaultTabController.initialIndex, 1);
  });

  testWidgets("should have initialIndex as 2 at 19:00", (WidgetTester tester) async {
    var mockTimeProvider = new MockTimeProvider();
    when(mockTimeProvider.getCurrentTime()).thenReturn(new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,19));
    await tester.pumpWidget(new MaterialApp(home: new Homepage(mockTimeProvider)));

    DefaultTabController defaultTabController = tester.firstWidget(find.byType(DefaultTabController));
    expect(defaultTabController.initialIndex, 2);
  });
}