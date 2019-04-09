import 'package:flutter/material.dart';
import 'package:cafeteria_tw/widget/menu_item.dart';

class MenuView extends StatelessWidget {
  List<String> menu;
  MenuView(this.menu);

  @override
  Widget build(BuildContext context) {
    return new ListView(
        children: menu.map((String menuItem){
          return new MenuItem(menuItem);
        }).toList()
    );
  }


}