import 'package:cafeteria_tw/service/time_provider_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test("getCurrentTime should return currentTime", (){
    var actualCurrentTime = TimeProvider().getCurrentTime();
    var expectedCurrentTime = DateTime.now();

    expect(actualCurrentTime.year, expectedCurrentTime.year);
    expect(actualCurrentTime.month, expectedCurrentTime.month);
    expect(actualCurrentTime.day, expectedCurrentTime.day);
  });
}