import 'package:flutter/material.dart';

class BuildIconButton extends StatelessWidget{
  final IconData _icon;
  final double paddingLeft;
  final double paddingRight;
  final VoidCallback _onPressed;
  final Color initialColor;
  final Color onTappedColor;

  final bool isTapped;

  BuildIconButton(this._icon, this._onPressed, this.isTapped, this.onTappedColor, {this.paddingLeft = 0, this.paddingRight = 0, this.initialColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return new IconButton(
      padding: EdgeInsets.only(left: paddingLeft, right: paddingRight),
      icon: new Icon(_icon),
      color: isTapped ? onTappedColor: initialColor,
      disabledColor: Colors.grey,
      onPressed: _onPressed,
    );
  }

}