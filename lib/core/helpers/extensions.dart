

import 'package:flutter/cupertino.dart';

extension Navigation on BuildContext{
  Future<dynamic>pushNamed(String routeName,{Object? arguments}){
    return Navigator.of(this).pushNamed( routeName,arguments: arguments);
  }

  void popPage()=> Navigator.of(this).pop();
}