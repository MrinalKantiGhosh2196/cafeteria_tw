import 'package:flutter/material.dart';

class MealType{
  final String _name;
  final TimeOfDay _startTimeInHours;
  final Duration _duration;

  const MealType(this._name, this._startTimeInHours, this._duration);
  String get name => _name;

  DateTime getStartDateTime(){
    DateTime currentTime = DateTime.now();
    return DateTime(currentTime.year, currentTime.month, currentTime.day,
        _startTimeInHours.hour);
  }

  DateTime getEndDateTime(){
    return getStartDateTime().add(_duration);
  }

  static const breakfast = const MealType("Breakfast", TimeOfDay(hour: 0, minute: 0), Duration(hours: 11));
  static const lunch = const MealType("Lunch", TimeOfDay(hour: 11,minute: 0), Duration(hours: 4));
  static const snacks = const MealType("Snacks", TimeOfDay(hour: 15,minute: 0), Duration(hours: 9));
}
