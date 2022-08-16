import 'package:demo_app/bloc_pattern/blocs/bloc.dart';
import 'package:flutter/material.dart';

///scoped instance
class Provider extends InheritedWidget {
  final bloc = Bloc();

  Provider({ Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
        .bloc;
  }
}
