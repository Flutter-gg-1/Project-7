import 'package:flutter/material.dart';

extension SizeConfig on BuildContext{
  getWidth({required double multiply})=>MediaQuery.of(this).size.width * multiply ;
  getHeight({required double multiply})=>MediaQuery.of(this).size.height * multiply;
}