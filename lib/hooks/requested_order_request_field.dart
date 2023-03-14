import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yali/model/get_requested_orders.dart';
import 'package:yali/model/show_orders_model.dart';
import 'package:yali/screens/cancel%20screen/cancel_screen.dart';

class RequestedOrdersRequestField extends StatefulWidget {
  GetRequestedOrders? requestedOrders;
  RequestedOrdersRequestField({super.key, required this.requestedOrders});

  @override
  State<RequestedOrdersRequestField> createState() =>
      _RequestedOrdersRequestFieldState();
}

class _RequestedOrdersRequestFieldState
    extends State<RequestedOrdersRequestField> {
  CancelRequest _cancelRequest = CancelRequest.anotherReason;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(7.0),
          decoration: const BoxDecoration(
              color: Color(0xFFEBEEEF),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
            SizedBox(
                width: 100,
                child:
                    Text("Id", style: TextStyle(fontWeight: FontWeight.bold))),
            SizedBox(
                width: 100,
                child: Text("Drone No",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            SizedBox(
                width: 100,
                child: Text("Status",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            SizedBox(
                width: 70,
                child: Text("Action",
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ]),
        ),
        Container(
          padding: const EdgeInsets.all(7.0),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
                width: 100,
                child: Text(
                  widget.requestedOrders?.id.toString() ?? "null",
                )),
            SizedBox(
                width: 100,
                child: Text(
                  widget.requestedOrders?.orderId.toString() ?? "null",
                )),
            SizedBox(
                width: 100,
                child: Text(
                  widget.requestedOrders?.status.toString() ?? "null",
                  style: TextStyle(color: Colors.green),
                )),
            SizedBox(
                width: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0))),
                          context: context,
                          builder: (context) => Container(
                                height: 300,
                                decoration: const BoxDecoration(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 15.0,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Text(
                                        "Reason to cancel 2",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    ListTile(
                                      title: const Text('www.javatpoint.com'),
                                      leading: Radio(
                                        value: CancelRequest.anotherReason,
                                        groupValue: _cancelRequest,
                                        onChanged: (CancelRequest? value) {
                                          setState(() {
                                            _cancelRequest = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                      child: Material(
                        child: SvgPicture.asset("assets/svg/cross.svg"),
                      ),
                    ),
                    SvgPicture.asset("assets/svg/edit.svg"),
                  ],
                )),
          ]),
        ),
      ],
    );
  }
}

enum CancelRequest { gotItem, anotherReason }
