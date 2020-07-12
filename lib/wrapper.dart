import 'package:flutter/material.dart';
import 'home.dart';
import 'authenticate.dart';
import 'package:provider/provider.dart';
import 'modal/user.dart';
import 'Home_Screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return HomeScreen();
    }
  }
}
