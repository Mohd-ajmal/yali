import 'package:flutter/material.dart';
import 'package:yali/constants/app_colors.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  children: const [
                     Padding(
                      padding: EdgeInsets.only(left: 20, right: 75),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Vehicle Tracker",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                   
                  ],
                ),
              ),
            ),
          )),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 10,),
                child: Container(
                  height: 40,
                  width: 180,
                  decoration: BoxDecoration(
                    color:const Color(0xFFEBEEEF) ,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:const Center(
                    child: Text("Hospital Vehicle",style: TextStyle(fontWeight: FontWeight.w500),),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow:const [
                      BoxShadow(
                        blurRadius: 10.0,
                        color: Color(0xFFEBEEEF),
                      ),
                    ]
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:const [
                            Text("ID:",style: TextStyle(fontWeight: FontWeight.w500),),
                            Text("From:",style: TextStyle(fontWeight: FontWeight.w500),),
                            Text("To:",style: TextStyle(fontWeight: FontWeight.w500),),
                            Text("Time:",style: TextStyle(fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
    );
  }
}