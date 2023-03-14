import 'dart:developer';

import 'package:flutter/material.dart';
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
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(20)),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Spacer(),
                      Text(
                        "Today request",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(
                        Icons.download,
                        size: 24,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0)
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
                  return const  Center(
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
              return const CircularProgressIndicator();
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
