import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yali/constants/app_colors.dart';
import 'package:yali/hooks/request_fields.dart';
import 'package:yali/screens/dashboard%20screen/widget/dashboard_card.dart';
import 'package:yali/screens/incoming%20request%20screen/incoming_request_screen.dart';
import 'package:yali/screens/outgoing%20request%20screen/outgoing_request_screen.dart';
import 'package:yali/screens/profile%20screen/profile_screen.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(102),
          child: Container(
            height: 102,
            decoration: const BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "Dashbord",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 100, right: 25),
                      child: Icon(
                        Icons.notifications,
                        size: 24,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
      body: Container(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashBoardCard(
                height: 120,
                width: double.infinity,
                imagePath: "assets/svg/symbol_1.svg",
                color: AppColors.createProject,
                title: "Create Request"),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DashBoardCard(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 2.2,
                    imagePath: "assets/svg/history.svg",
                    color: AppColors.history,
                    title: "History"),
                DashBoardCard(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 2.2,
                    imagePath: "assets/svg/track.svg",
                    color: AppColors.track,
                    title: "Track")
              ],
            ),
            const SizedBox(height: 6),
            DashBoardCard(
                height: 120,
                width: double.infinity,
                imagePath: "assets/svg/manage.svg",
                color: AppColors.manage,
                title: "Manage"),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Incoming Request",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                const IncomingRequestScreen())));
                  },
                  child: const Text(
                    "View all",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Column(
              children: const [
                RequestFields(),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Outgoing Request",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                const OutgoingRequestScreen())));
                  },
                  child: const Text(
                    "View all",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Column(
              children: const [
                RequestFields(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock), label: "today"),
          BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const ProfileScreen())));
                  },
                  child: const Icon(Icons.home)),
              label: "Profile"),
        ],
      ),
    );
  }
}
