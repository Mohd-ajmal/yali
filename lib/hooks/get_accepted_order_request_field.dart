import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yali/model/get_accepted_orders.dart';
import 'package:yali/model/get_requested_orders.dart';
import 'package:yali/model/show_orders_model.dart';
import 'package:yali/screens/cancel%20screen/cancel_screen.dart';
import 'package:yali/service/service.dart';

class GetAcceptedOrderRequestField extends StatefulWidget {
  GetAcceptedOrders? showOrders;
  GetAcceptedOrderRequestField({super.key, required this.showOrders});

  @override
  State<GetAcceptedOrderRequestField> createState() =>
      _GetAcceptedOrderRequestFieldState();
}

CancelRequest _cancelRequest = CancelRequest.someReason1;
double _dynamicHeight = 300;
bool _visible = false;
TextEditingController? _reasonController;

class _GetAcceptedOrderRequestFieldState
    extends State<GetAcceptedOrderRequestField> {
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
                width: 30,
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
                width: 30,
                child: Text(
                  widget.showOrders?.id.toString() ?? "null",
                )),
            SizedBox(
                width: 100,
                child: Text(
                  widget.showOrders?.orderId.toString() ?? "null",
                )),
            SizedBox(
                width: 100,
                child: Text(
                  widget.showOrders?.status.toString() ?? "null",
                  style: TextStyle(color: Colors.green),
                )),
            SizedBox(
                width: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => showModalBottomSheet(
                          isScrollControlled: true,
                          isDismissible: false,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0))),
                          context: context,
                          builder: (context) => WillPopScope(
                                onWillPop: () {
                                  log('message');
                                  setState(() {
                                    _dynamicHeight = 300;
                                    _visible = false;
                                    _cancelRequest = CancelRequest.someReason1;
                                  });

                                  return Future.value(true);
                                },
                                child: StatefulBuilder(
                                    builder: (context, setState) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: Container(
                                      height: _dynamicHeight,
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(left: 15.0),
                                            child: Text(
                                              "Reason to cancel 1",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          const SizedBox(height: 10.0),
                                          RadioListTile(
                                            value: CancelRequest.someReason1,
                                            groupValue: _cancelRequest,
                                            onChanged: (value) => setState(() {
                                              _cancelRequest =
                                                  CancelRequest.someReason1;
                                                  _visible = false;
                                                  _dynamicHeight = 300;
                                            }),
                                            title: const Text("Some problem"),
                                          ),
                                          const SizedBox(height: 10.0),
                                          RadioListTile(
                                            value: CancelRequest.someReason2,
                                            groupValue: _cancelRequest,
                                            onChanged: (value) => setState(() {
                                              _cancelRequest =
                                                  CancelRequest.someReason2;
                                              _visible = false;
                                              _dynamicHeight = 300;
                                            }),
                                            title: const Text("Some problem 2"),
                                          ),
                                          const SizedBox(height: 10.0),
                                          RadioListTile(
                                            value: CancelRequest.other,
                                            groupValue: _cancelRequest,
                                            onChanged: (value) => setState(() {
                                              _cancelRequest =
                                                  CancelRequest.other;
                                              _dynamicHeight = 450;
                                              _visible = true;
                                            }),
                                            title: const Text("Other"),
                                          ),
                                          Visibility(
                                            visible: _visible,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: TextFormField(
                                                validator: (value) {
                                                    if (value == null) {
                                                      return "Field can't be empty";
                                                    } else if (value.isEmpty) {
                                                      return "Field cant' be empty";
                                                    } else if (value.length >
                                                        5) {
                                                      return "Reason is too small";
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  maxLines: 3,
                                                  decoration: InputDecoration(
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(10.0),
                                                    borderSide: const BorderSide(
                                                        width: 1,
                                                        color: Colors.grey),
                                                  ),
                                                  focusedBorder:OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(10.0),
                                                    borderSide: const BorderSide(
                                                        width: 1,
                                                        color: Colors.blue),
                                                  ), )),
                                            ),
                                          ),
                                          Center(
                                            child: ElevatedButton(onPressed: () async {
                                              context.loaderOverlay.show();
                                              String reason = _cancelRequest ==
                                                              CancelRequest
                                                                  .someReason1
                                                          ? "Some reason 1"
                                                          : _cancelRequest ==
                                                                  CancelRequest
                                                                      .someReason2
                                                              ? "Some reason 2"
                                                              : _reasonController
                                                                      ?.text ??
                                                                  "Some reason 3";
                                              await HttpService.cancelOrder(context: context, reason: reason);
                                              context.loaderOverlay.hide();
                                            }, child: const Text("Submit",style: TextStyle(color: Colors.white),)),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
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

enum CancelRequest { someReason1, someReason2, other }
