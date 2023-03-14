import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yali/providers/dashboard%20provider/dashboard_provider.dart';
import 'package:yali/screens/dashboard%20screen/dashboard_screen.dart';
import 'package:yali/screens/profile%20screen/profile_screen.dart';
import 'package:yali/screens/today%20request/today_request.dart';

class BottomNavigationProvider extends ChangeNotifier {
  // ---------------------------------------------------------- Getters ---------------------------------------------------------------

  int get value => _value;

  // ---------------------------------------------------------- Variables -------------------------------------------------------------

  int _value = 0;

  // ---------------------------------------------------------- Functionality ---------------------------------------------------------

  changeBody() {
    switch (_value) {
      case 0:
        return ChangeNotifierProvider(create: (BuildContext context) => DashBoardProvider(),
        child: const DashBoardScreen());
      case 1:
        return const TodayRequest();
      case 2:
        return const ProfileScreen();
      default:
    }
    notifyListeners();
  }

  changeBodyValue({required value}){
    _value = value;
    notifyListeners();
  }
}
