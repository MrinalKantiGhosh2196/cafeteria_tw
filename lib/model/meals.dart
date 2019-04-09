import 'package:cafeteria_tw/model/meal_type.dart';
import 'package:cafeteria_tw/model/menus.dart';

final Map<MealType, List<String>> meals = <MealType, List<String>>{
  MealType.breakfast: breakfastMenu,
  MealType.lunch: lunchMenu,
  MealType.snacks: snacksMenu
};
