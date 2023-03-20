import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yali/model/get_requested_orders.dart';
import 'package:yali/service/service.dart';

import '../../constants/app_colors.dart';
import '../../hooks/request_fields.dart';
import '../../hooks/requested_order_request_field.dart';

class TodayRequest extends StatelessWidget {
  const TodayRequest({super.key});

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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 24,top: 10),
                          child: SizedBox(
                            height: 50.0,
                            width: 50.0,
                              child: Image.asset(
                            "assets/images/yali_logo.png",
                            color: Colors.white,
                          )),
                        ),
                        const SizedBox(width: 10.0,),
                        const Padding(
                          padding: EdgeInsets.only(left: 20,right: 109),
                          child: Text(
                            "Today Request",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                   
                  ],
                ),
              ),
            ),
          )),
        body: Container(
          child: FutureBuilder(
            future: HttpService.getRequesteOrders(context: context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.runtimeType == null) {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                } else if (snapshot.data.runtimeType == String) {
                  return Center(
                    child: Text(snapshot.data.toString()),
                  );
                } else {
                  log(snapshot.data.runtimeType.toString());
                  GetRequestedOrders orders =
                      snapshot.data as GetRequestedOrders;
                  log("snapshot ${snapshot.data.toString()}");
                  return RequestedOrdersRequestField(
                    requestedOrders: orders,
                  );
                }
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Center(
                    child: Text("Something went wrong"),
                  ),
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('No Data...'),
                  Center(
                    child: Container(
                        padding: const EdgeInsets.all(5.0),
                        height: 200.0,
                        width: 200.0,
                        child: Lottie.asset("assets/images/noData.json")),
                  ),
                ],
              );
            },
          ),
        )

        // Padding(
        //   padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        //   child: Column(
        //     children: [
        //       Reques  tFields(showOrders: null),
        //     ],
        //   ),
        // ),
        );
  }
}
