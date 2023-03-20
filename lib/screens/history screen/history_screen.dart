import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yali/constants/app_colors.dart';
import 'package:yali/model/get_orders_model.dart';
import 'package:yali/screens/history%20screen/widgets/history_screen_card.dart';

class HistoryScreen extends StatefulWidget {
  GetOrders orders;
  HistoryScreen({super.key, required this.orders});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

List<Datum> _declinedList = [];
List<Datum> _acceptedList = [];
List<Datum> _initiatedList = [];
List<Datum> _cancelledList = [];
List<Datum> _processingList = [];
List<Datum> _allOrders = [];

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    _allOrders = widget.orders.data;
    for (int i = 0; i < widget.orders.data.length; i++) {
      if (widget.orders.data[i].status == "declined") {
        _declinedList.add(widget.orders.data[i]);
      } else if (widget.orders.data[i].status == "accepted") {
        _acceptedList.add(widget.orders.data[i]);
      } else if (widget.orders.data[i].status == "cancelled") {
        _cancelledList.add(widget.orders.data[i]);
      } else if (widget.orders.data[i].status == "initiated") {
        _initiatedList.add(widget.orders.data[i]);
      } else if (widget.orders.data[i].status == "processing") {
        _processingList.add(widget.orders.data[i]);
      }
    }
    log("init state");
    // log(_declinedList.length.toString());
    // log(_acceptedList.length.toString());
    // log(_cancelledList.length.toString());
    // log(_initiatedList.length.toString());
    // log(_processingList.length.toString());
    // log(widget.orders.data.length.toString());
  }

  @override
  void dispose() {
    _declinedList.clear();
    _acceptedList.clear();
    _cancelledList.clear();
    _initiatedList.clear();
    _processingList.clear();
    _allOrders.clear();
    widget.orders.data.clear();
    super.dispose();
  }

  SingingCharacter? _character = SingingCharacter.allOrders;

  @override
  Widget build(BuildContext context) {
    log(widget.orders.toString());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(102),
        child:  Container(
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
                          padding: const EdgeInsets.only(right: 65,top: 10),
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
                          padding:  EdgeInsets.only(left: 20,right: 100),
                          child: Text(
                            "History",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                   Padding(
                     padding: const EdgeInsets.only(right: 10),
                     child: IconButton(
                                     onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        builder: ((context) => StatefulBuilder(
                          builder: (context, setState) => Container(
                                height: 400,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Padding(
                                         padding:  EdgeInsets.only(top: 20,left: 15),
                                         child:  Text(
                                          "Filter",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                                                         ),
                                       ),
                                       ListTile(
                                        title: const Text('All Orders',style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),),
                                        trailing: Radio<SingingCharacter>(
                                          value: SingingCharacter.allOrders,
                                          groupValue: _character,
                                          onChanged: (SingingCharacter? value) {
                                            setState(() {
                                              log("message");
                                              _character = value;
                                              changeState(list: _allOrders);
                                            });
                                            
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: const Text('Declined',style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),),
                                        trailing: Radio<SingingCharacter>(
                                          value: SingingCharacter.declined,
                                          groupValue: _character,
                                          onChanged: (SingingCharacter? value) {
                                            setState(() {
                                              log("message");
                                              _character = value;
                                              changeState(list: _declinedList);
                                            });
                                          },
                                        ),
                                      ),
                                     ListTile(
                                        title: const Text('Accepted',style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),),
                                        trailing: Radio<SingingCharacter>(
                                          value: SingingCharacter.accepted,
                                          groupValue: _character,
                                          onChanged: (SingingCharacter? value) {
                                            setState(() {
                                              log("message");
                                              _character = value;
                                              changeState(list: _acceptedList);
                                            });
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: const Text('Cancelled',style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),),
                                        trailing: Radio<SingingCharacter>(
                                          value: SingingCharacter.cancelled,
                                          groupValue: _character,
                                          onChanged: (SingingCharacter? value) {
                                            setState(() {
                                              log("message");
                                              _character = value;
                                              changeState(list: _cancelledList);
                                              log(_cancelledList.length.toString());
                                            });
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: const Text('Initiated',style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),),
                                        trailing: Radio<SingingCharacter>(
                                          value: SingingCharacter.initiated,
                                          groupValue: _character,
                                          onChanged: (SingingCharacter? value) {
                                            setState(() {
                                              _character = value;
                                              changeState(list: _initiatedList);
                                            });   
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: const Text('Processing',style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),),
                                        trailing: Radio<SingingCharacter>(
                                          value: SingingCharacter.processing,
                                          groupValue: _character,
                                          onChanged: (SingingCharacter? value) {
                                            setState(() {
                                              log("message");
                                              _character = value;
                                              changeState(list: _processingList);
                                            });
                                            
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                           
                        )),
                      );
                                     },
                                     icon: const Icon(Icons.filter_list_alt,color: Colors.white,)),
                   ),
                  ],
                ),
              ),
            ),
          )
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          children: [
            HistoryCard(historyData: widget.orders),
          ],
        ),
      ),
    );
  }
  changeState({required list}){
    log("change state");
    log(list.length.toString());
    setState(() {
       widget.orders.data = list;
    });
  }
}

enum SingingCharacter { accepted, cancelled, initiated, processing, declined, allOrders }


