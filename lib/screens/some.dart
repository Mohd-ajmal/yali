// import 'package:flutter/material.dart';
// import 'package:flutter_offline/flutter_offline.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:growzeri_delivery_app/dashboard/delivery_dashboard.dart';
// import 'package:growzeri_delivery_app/screens/auth/deliver_profile_screen.dart';
// import 'package:growzeri_delivery_app/screens/todayorders.dart';
// import 'package:growzeri_delivery_app/screens/widgets/no_internet_connection.dart';

// class DeliveryBottomBar extends StatefulWidget {
//   const DeliveryBottomBar({Key? key}) : super(key: key);

//   @override
//   State<DeliveryBottomBar> createState() => _DeliveryBottomBarState();
// }

// class _DeliveryBottomBarState extends State<DeliveryBottomBar> {
//   int currentIndex = 0;
//   DateTime currentBackPressTime = DateTime.now();
//   Future<bool> onWillPop() {
//     DateTime now = DateTime.now();
//     if (currentBackPressTime == null ||
//         now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
//       currentBackPressTime = now;
//       Fluttertoast.showToast(msg: 'Press again to Exit');
//       return Future.value(false);
//     }
//     return Future.value(true);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return await onWillPop();
//       },
//       child: OfflineBuilder(
//         connectivityBuilder: (BuildContext context, ConnectivityResult connectivity, Widget child) { 
//           if (connectivity == ConnectivityResult.none) {
//             return const Scaffold(
//               body: InternetAccess(),
//             );
//           }
//           return child;
//         },
         
//         child: Scaffold(
//           body: currentIndex == 0
//               ? DeliveryPersonDashboard()
//               : currentIndex == 1
//                   ? TodayOrders(isBackButton: false)
//                   : DeliveryProfileScreen(),
//           bottomNavigationBar: BottomNavigationBar(
//               type: BottomNavigationBarType.fixed,
//               // backgroundColor: Colors.amber,
//               showSelectedLabels: true,
//               currentIndex: currentIndex,
//               onTap: (value) {
//                 setState(() {
//                   currentIndex = value;
//                 });
//               },
//               elevation: 5.0,
//               selectedItemColor: Theme.of(context).primaryColor,
//               items: const [
//                 BottomNavigationBarItem(
//                   icon: Icon(
//                     Icons.home,
//                   ),
//                   label: 'Home',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.delivery_dining_outlined),
//                   label: 'Orders',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(
//                     Icons.person,
//                   ),
//                   label: 'Profile',
//                 ),
//               ]),
//         ),
//       ),
//     );
//   }
// }