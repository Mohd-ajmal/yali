import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:yali/model/get_orders_model.dart';
import 'package:yali/screens/edit%20history%20screen/edit_history_screen.dart';
import 'package:yali/screens/some.dart';

class HistoryCard extends StatelessWidget {
  GetOrders historyData;
  HistoryCard({super.key, required this.historyData});

  @override
  Widget build(BuildContext context) {
    return historyData.data.isNotEmpty
        ? Column(
            children: [
              Container(
                padding: const EdgeInsets.all(7.0),
                decoration: const BoxDecoration(
                    color: Color(0xFFEBEEEF),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      SizedBox(
                          width: 40,
                          child: Text("Id",
                              style: TextStyle(fontWeight: FontWeight.bold))),
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
              //2
              Container(
                height: 670,
                child: ListView.builder(
                    itemCount: historyData.data.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        padding: const EdgeInsets.all(7.0),
                        decoration: BoxDecoration(
                          color: index % 2 == 0
                              ? Colors.white
                              : const Color(0xFFEBEEEF),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  width: 40,
                                  child: Text(
                                    historyData.data[index].id.toString(),
                                  )),
                              SizedBox(
                                  width: 100,
                                  child: Text(
                                    historyData.data[index].orderId.toString(),
                                  )),
                              SizedBox(
                                  width: 100,
                                  child: Text(
                                    historyData.data[index].status.toString(),
                                    style: TextStyle(
                                        color: historyData.data[index].status ==
                                                "accepted"
                                            ? Colors.green
                                            : historyData.data[index].status ==
                                                    "processing"
                                                ? Colors.yellow
                                                : historyData.data[index]
                                                            .status ==
                                                        "initiated"
                                                    ? Colors.orange
                                                    : Colors.red),
                                    textAlign: TextAlign.start,
                                  )),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditHistoryScreen(showOrder: historyData,index: index,)));
                                },
                                  child: const SizedBox(
                                      width: 70, child: Icon(Icons.warning))),
                            ]),
                      );
                    })),
              ),
              // Container(
              //   padding: const EdgeInsets.all(7.0),
              //   decoration: const BoxDecoration(
              //     color: Colors.white,
              //   ),
              //   child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: const [
              //         SizedBox(
              //             width: 100,
              //             child: Text(
              //               "#12453",
              //             )),
              //         SizedBox(
              //             width: 100,
              //             child: Text(
              //               "#14532",
              //             )),
              //         SizedBox(
              //             width: 100,
              //             child: Text(
              //               "Action",
              //               style: TextStyle(color: Colors.green),
              //             )),
              //         SizedBox(width: 70, child: Icon(Icons.warning)),
              //       ]),
              // ),
              //3
              // Container(
              //   padding: const EdgeInsets.all(7.0),
              //   decoration: const BoxDecoration(
              //     color: Color(0xFFEBEEEF),
              //   ),
              //   child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: const [
              //         SizedBox(
              //             width: 100,
              //             child: Text(
              //               "#12453",
              //             )),
              //         SizedBox(
              //             width: 100,
              //             child: Text(
              //               "#14532",
              //             )),
              //         SizedBox(
              //             width: 100,
              //             child: Text(
              //               "Action",
              //               style: TextStyle(color: Colors.green),
              //             )),
              //         SizedBox(width: 70, child: Icon(Icons.warning)),
              //       ]),
              // ),
              // //4
              // Container(
              //   padding: const EdgeInsets.all(7.0),
              //   decoration: const BoxDecoration(
              //     color: Colors.white,
              //   ),
              //   child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: const [
              //         SizedBox(
              //             width: 100,
              //             child: Text(
              //               "#12453",
              //             )),
              //         SizedBox(
              //             width: 100,
              //             child: Text(
              //               "#14532",
              //             )),
              //         SizedBox(
              //             width: 100,
              //             child: Text(
              //               "Action",
              //               style: TextStyle(color: Colors.green),
              //             )),
              //         SizedBox(width: 70, child: Icon(Icons.warning)),
              //       ]),
              // ),
              // //5
              // Container(
              //   height: 35,
              //   padding: const EdgeInsets.all(7.0),
              //   decoration: const BoxDecoration(
              //     color: Color(0xFFEBEEEF),
              //   ),
              // ),
              // //6
              // Container(
              //   height: 35,
              //   padding: const EdgeInsets.all(7.0),
              //   decoration: const BoxDecoration(
              //     color: Colors.white,
              //   ),
              // ),
              // //7
              // Container(
              //   height: 35,
              //   padding: const EdgeInsets.all(7.0),
              //   decoration: const BoxDecoration(
              //     color: Color(0xFFEBEEEF),
              //   ),
              // ),
              // //8
              // Container(
              //   height: 35,
              //   padding: const EdgeInsets.all(7.0),
              //   decoration: const BoxDecoration(
              //     color: Colors.white,
              //   ),
              // ),
              // //9
              // Container(
              //   height: 35,
              //   padding: const EdgeInsets.all(7.0),
              //   decoration: const BoxDecoration(
              //     color: Color(0xFFEBEEEF),
              //   ),
              // ),
              // //10
              // Container(
              //   height: 35,
              //   padding: const EdgeInsets.all(7.0),
              //   decoration: const BoxDecoration(
              //     color: Colors.white,
              //   ),
              // ),
            ],
          )
        : Expanded(
            child: Column(
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
            ),
          );
  }
}
