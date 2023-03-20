import 'package:flutter/material.dart';
import 'package:yali/constants/app_colors.dart';
import 'package:yali/model/show_orders_model.dart';

import '../../model/get_orders_model.dart';

class EditHistoryScreen extends StatelessWidget {
  GetOrders showOrder;
  int index;
  EditHistoryScreen({super.key, required this.showOrder,required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order Status",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Card(
              color: Colors.white,
              elevation: 10.0,
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  // border: Border(
                  //     top: BorderSide(color: Colors.grey),
                  //     bottom: BorderSide(color: Colors.grey),
                  //     left: BorderSide(color: Colors.grey),
                  //     right: BorderSide(color: Colors.grey))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Order id",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(showOrder.data[index].orderId ?? "null")
                          ],
                        ),
                      ),
                      const VerticalDivider(),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Order Status",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              showOrder.data[index].status ?? "null",
                              style: TextStyle(color: Colors.green),
                            )
                          ],
                        ),
                      ),
                      const VerticalDivider(),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Vehicle Status",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              showOrder.data[index].meta?.vehicleStatus ?? "Waiting for\nresponse",
                              style: TextStyle(color: Colors.red,fontSize: 10.0),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.local_hospital),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "Sender Details",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Meenatchi maruthuvamanai"),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    children: [
                      Icon(Icons.shopping_bag),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "Items you requested",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 5,
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset("assets/images/heart3d.jpg")),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Heart",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text("nos-1"),
                          SizedBox(
                            width: 10.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 5,
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset("assets/images/liver.jpg")),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Liver",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text("nos-2"),
                          SizedBox(
                            width: 10.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 5,
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset("assets/images/tablet.jpg")),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Amoxilyne",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text("nos-2"),
                          SizedBox(
                            width: 10.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 100.0,),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Edit",
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
