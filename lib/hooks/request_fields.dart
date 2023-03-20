import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:yali/model/get_requested_orders.dart';
import 'package:yali/model/show_orders_model.dart';
import 'package:yali/screens/cancel%20screen/cancel_screen.dart';
import 'package:yali/screens/some.dart';
import 'package:yali/service/service.dart';

class RequestFields extends StatefulWidget {
  GetRequestedOrders? showOrders;
  RequestFields({super.key, required this.showOrders});

  @override
  State<RequestFields> createState() => _RequestFieldsState();
}

CancelRequest _cancelRequest = CancelRequest.someReason1;

class _RequestFieldsState extends State<RequestFields> {
  double _dynamicHeight = 300;
  bool _visible = false;
  TextEditingController? _reasonController;

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
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
                width: MediaQuery.of(context).size.width/6,
                child:
                    Text("Id", style: TextStyle(fontWeight: FontWeight.bold))),
            SizedBox(
                width: MediaQuery.of(context).size.width/4,
                child: Text("Drone No",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            SizedBox(
                width: MediaQuery.of(context).size.width/3.9,
                child: Text("Status",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            SizedBox(
                width: MediaQuery.of(context).size.width/4.5,
                child: Text("Action",
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ]),
        ),
        
        widget.showOrders?.orderId != null ? Container(
          padding: const EdgeInsets.all(7.0),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
                width: MediaQuery.of(context).size.width/6,
                child: Text(
                  widget.showOrders?.id.toString() ?? "null",
                )),
            SizedBox(
                width: MediaQuery.of(context).size.width/4,
                child: Text(
                  widget.showOrders?.orderId.toString() ?? "null",
                )),
            SizedBox(
                width: MediaQuery.of(context).size.width/3.9,
                child: Text(
                  widget.showOrders?.status.toString() ?? "null",
                  style: TextStyle(color: Colors.green),
                )),
            SizedBox(
                width: MediaQuery.of(context).size.width/4.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                                              "Reason to cancel 3",
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
                                            title: const Text("Needed patient is refused to be here"),
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
                                            title: const Text("Got item from another resource"),
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
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: TextFormField(
                                                  controller: _reasonController,
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  Colors.blue),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                          Center(
                                              child: ElevatedButton(
                                                  onPressed: () async {
                                                    context.loaderOverlay
                                                        .show();
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
                                                    await HttpService
                                                        .cancelOrder(
                                                            context: context,
                                                            reason: reason);
                                                    context.loaderOverlay
                                                        .hide();
                                                  },
                                                  child: const Text(
                                                    "Submit",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )))
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
                    const SizedBox(width: 25.0,),
                    GestureDetector(
                        onTap: () {
                          // showModalBottomSheet(
                          //   context: context,
                          //   builder: ((context) {
                          //     return Container(
                          //       height: 300,
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.start,
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           const SizedBox(
                          //             height: 10.0,
                          //           ),
                          //           Center(
                          //             child: Container(
                          //               height: 4,
                          //               width: 150,
                          //               color: Colors.grey,
                          //             ),
                          //           ),
                          //           const SizedBox(
                          //             height: 10.0,
                          //           ),
                          //           Center(
                          //             child: Text(
                          //               "Order Id : ${widget.showOrders!.orderId}",
                          //               style: TextStyle(
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //           ),
                          //           const SizedBox(
                          //             height: 20.0,
                          //           ),
                          //           Text(
                          //               "Order Status : ${widget.showOrders!.status}",
                          //               style: TextStyle(
                          //                   fontWeight: FontWeight.bold,
                          //                   color: widget.showOrders!.status ==
                          //                           "accepted"
                          //                       ? Colors.green
                          //                       : widget.showOrders!.status ==
                          //                               "processing"
                          //                           ? Colors.yellow
                          //                           : widget.showOrders!
                          //                                       .status ==
                          //                                   "initiated"
                          //                               ? Colors.orange
                          //                               : Colors.red)),
                          //           const SizedBox(
                          //             height: 10.0,
                          //           ),
                          //           Row(
                          //             children: [
                          //               Text(
                          //                 "Vehicle Status : ${widget.showOrders!.meta?.vehicleStatus}",
                          //                 style: const  TextStyle(
                          //                     fontWeight: FontWeight.bold,
                          //                     color: Colors.green),
                          //               ),
                          //               const SizedBox(width: 10.0,),
                          //               SizedBox(
                          //                   height: 80.0,
                          //                   width: 80.0,
                          //                   child: LottieBuilder.asset(
                          //                       "assets/images/lottieDron.json"))
                          //             ],
                          //           ),
                          //           const SizedBox(height: 10.0),
                          //         ],
                          //       ),
                          //     );
                          //   }),
                          //   shape: const RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.only(
                          //           topLeft: Radius.circular(20.0),
                          //           topRight: Radius.circular(20.0))),
                          // );
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => SummaWidget(showOrder: widget.showOrders,))));
                        },
                        child: SvgPicture.asset("assets/svg/edit.svg")),
                  ],
                )),
          ]),
        ) : Container(
          padding: const EdgeInsets.all(5.0),
          height: 100.0,
          width: 150.0,
          child:  Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("No Records Found",style: TextStyle(fontSize: 12.0),),
            ],
          ),)),
      ],
    );
  }
}

enum CancelRequest { someReason1, someReason2, other }
