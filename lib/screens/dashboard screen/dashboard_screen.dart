import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yali/constants/app_colors.dart';
import 'package:yali/hooks/get_accepted_order_request_field.dart';
import 'package:yali/hooks/incoming_requst.dart';
import 'package:yali/hooks/notification_helper.dart';
import 'package:yali/hooks/request_fields.dart';
import 'package:yali/model/get_accepted_orders.dart';
import 'package:yali/model/get_orders_model.dart';
import 'package:yali/model/get_requested_orders.dart';
import 'package:yali/model/login_model.dart';
import 'package:yali/providers/dashboard%20provider/create%20request%20provider/create_request_provider.dart';
import 'package:yali/providers/dashboard%20provider/dashboard_provider.dart';
import 'package:yali/screens/dashboard%20screen/create%20request/create_request.dart';
import 'package:yali/screens/dashboard%20screen/widget/dashboard_card.dart';
import 'package:yali/screens/history%20screen/history_screen.dart';
import 'package:yali/screens/incoming%20request%20screen/incoming_request_screen.dart';
import 'package:yali/screens/outgoing%20request%20screen/outgoing_request_screen.dart';
import 'package:yali/screens/profile%20screen/profile_screen.dart';
import 'package:yali/screens/some.dart';
import 'package:yali/screens/track%20screen/track_screen.dart';
import 'package:yali/service/service.dart';

import '../../model/show_orders_model.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

var _orders;
var _getAcceptedOrders;

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    super.initState();
    printData();
  }

  printData() async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap =
        jsonDecode(sharedUser.getString('userData')!);
    var user = LoginModel.fromJson(userMap);
    log(user.token.toString());
  }

  getShowOrders() async {
    _orders = await HttpService.getRequesteOrders(context: context);
    log('message');
    log("incoming orders ${_orders.toString()}");
  }

  getAcceptedOrders() async {
    _getAcceptedOrders = await HttpService.getAcceptedOrders(context: context);
    log("Accepted orders");
    log("addicted order  $_getAcceptedOrders");
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DashBoardProvider>(context, listen: true);
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30,top: 10),
                          child: SizedBox(
                            height: 50.0,
                            width: 50.0,
                              child: Image.asset(
                            "assets/images/yali_logo.png",
                            color: Colors.white,
                          )),
                        ),
                        SizedBox(width: 10.0,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Dashboard",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  context.loaderOverlay.show();
                  var itemResponse =
                      await HttpService.getItemTypes(context: context);
                  //log(itemResponse.runtimeType.toString());
                  var stateResponse =
                      await HttpService.getState(context: context);
                  //log(stateResponse.runtimeType.toString());
                  var districtResponse =
                      await HttpService.getDistrict(context: context);
                  //log(districtResponse.runtimeType.toString());
                  var hospitalsResponse =
                      await HttpService.getHospitals(context: context);
                  log(hospitalsResponse.runtimeType.toString());
                  var itemQuantityTypesResponse =
                      await HttpService.getItemQuantityTypes(context: context);
                  //log(itemQuantityTypesResponse.runtimeType.toString());
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                            create: (BuildContext context) =>
                                CreateRequstProvider(),
                            child: CreateRequest(
                              districtModel: districtResponse,
                              itemQuantityTypes: itemQuantityTypesResponse,
                              itemTypesModel: itemResponse,
                              stateModel: stateResponse,
                              hospitaltypes: hospitalsResponse,
                            ),
                          )));
                  context.loaderOverlay.hide();
                },
                child: DashBoardCard(
                    height: 110,
                    width: double.infinity,
                    imagePath: "assets/svg/symbol_1.svg",
                    color: AppColors.createProject,
                    title: "Create Request"),
              ),
              const SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: GestureDetector(
                      onTap: () async {
                        context.loaderOverlay.show();
                        var data =
                            await HttpService.getOrders(context: context);
                        if (data.runtimeType == null) {
                          context.loaderOverlay.hide();
                          provider.showSuccessSnackBar(
                              context: context, msg: data);
                        } else if (data.runtimeType == String) {
                          context.loaderOverlay.hide();
                          provider.showSuccessSnackBar(
                              context: context, msg: data);
                        } else if (data.runtimeType == GetOrders) {
                          log("message");
                          context.loaderOverlay.hide();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      HistoryScreen(orders: data))));
                        }
                      },
                      child: DashBoardCard(
                          height: 120,
                          width: MediaQuery.of(context).size.width / 2.2,
                          imagePath: "assets/svg/history.svg",
                          color: AppColors.history,
                          title: "History"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TrackScreen()));
                    },
                    child: DashBoardCard(
                        height: 120,
                        width: MediaQuery.of(context).size.width / 2.2,
                        imagePath: "assets/svg/track.svg",
                        color: AppColors.track,
                        title: "Track"),
                  )
                ],
              ),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const SummaWidget()));

                  NotificationHelper.showNotification(
                      title: "Yali",
                      body: "You have received an order",
                      payload: "heart");
                },
                child: DashBoardCard(
                    height: 110,
                    width: double.infinity,
                    imagePath: "assets/svg/manage.svg",
                    color: AppColors.manage,
                    title: "Manage"),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Incoming Request ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "(Order you requested)",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      context.loaderOverlay.show();
                      var data = await HttpService.showOrders(context: context);
                      // if(data.runtimeType != GetRequestedOrders){
                      //   data = null;
                      // }
                      //log(data.toString());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  IncomingRequestScreen(showOrders: data))));
                      context.loaderOverlay.hide();
                    },
                    child: const Text(
                      "View all",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              FutureBuilder(
                  future: getShowOrders(),
                  builder: (context, snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting) {
                      return const Center(child: Text("Please Wait..."));
                    }
                    return Column(
                      children: [
                        RequestFields(showOrders: _orders),
                      ],
                    );
                  }),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Outgoing Request ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "(Order you have to send)",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 10.0),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      context.loaderOverlay.show();
                      var data =
                          await HttpService.getRequesteOrders(context: context);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  const OutgoingRequestScreen())));
                      context.loaderOverlay.hide();
                    },
                    child: const Text(
                      "View all",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              FutureBuilder(
                  future: getAcceptedOrders(),
                  builder: (context, snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: Text("Please Wait..."),
                      );
                    }

                    return Column(
                      children: [
                        GetAcceptedOrderRequestField(
                            showOrders: _getAcceptedOrders),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
