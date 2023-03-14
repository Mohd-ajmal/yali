import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:provider/provider.dart';
import 'package:yali/providers/bottom%20navigation%20provider/bottm_navigation_provider.dart';
import 'package:yali/providers/dashboard%20provider/dashboard_provider.dart';
import 'package:yali/screens/splash%20screen/no_internet.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationProvider>(context, listen: true);
    return Scaffold(
      body: OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            ConnectivityResult connectivity, Widget child) {
          if (connectivity == ConnectivityResult.none) {
            return const Scaffold(
              body: Center(child: NoInternetScreen()),
            );
          }
          return child;
        },
        child: provider.changeBody(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.lock_clock), label: "today"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (value) => provider.changeBodyValue(value: value),
        currentIndex: provider.value,
      ),
    );
  }
}
