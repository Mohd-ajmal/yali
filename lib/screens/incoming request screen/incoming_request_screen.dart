import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:yali/constants/app_colors.dart';
import 'package:yali/hooks/incoming_requst.dart';
import 'package:yali/hooks/request_fields.dart';
import 'package:yali/model/get_requested_orders.dart';
import 'package:yali/model/show_orders_model.dart';

class IncomingRequestScreen extends StatefulWidget {
  ShowOrders? showOrders;
  IncomingRequestScreen({super.key, required this.showOrders});

  @override
  State<IncomingRequestScreen> createState() => _IncomingRequestScreenState();
}

class _IncomingRequestScreenState extends State<IncomingRequestScreen> {
  @override
  Widget build(BuildContext context) {
    log("instance ${widget.showOrders}");
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
                padding: const EdgeInsets.only(top: 10,left: 20),
                child: Row(
                  children:  [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child:const Icon(
                        Icons.arrow_back_ios,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                   
                    const Padding(
                       padding:  EdgeInsets.only(left: 50),
                       child: Text(
                        "Incoming Request",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                                         ),
                     ),
                      Padding(
                          padding: const EdgeInsets.only(top: 10,left: 35),
                          child: SizedBox(
                            height: 50.0,
                            width: 50.0,
                              child: Image.asset(
                            "assets/images/yali_logo.png",
                            color: Colors.white,
                          )),
                        ),
                   
                  ],
                ),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          children: [
            
            IncomingRequestField(showOrders: widget.showOrders),
          ],
        ),
      ),
    );
  }
}
