import 'package:flutter/material.dart';
import 'package:yali/constants/app_colors.dart';
import 'package:yali/hooks/request_fields.dart';

class OutgoingRequestScreen extends StatefulWidget {
  const OutgoingRequestScreen({super.key});

  @override
  State<OutgoingRequestScreen> createState() => _OutgoingRequestScreenState();
}

class _OutgoingRequestScreenState extends State<OutgoingRequestScreen> {
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
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
                       padding:  EdgeInsets.only(left: 20),
                       child: Text(
                        "Outgoing Request",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                                         ),
                     ),
                    Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10),
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
            RequestFields(showOrders: null),
          ],
        ),
      ),
    );
  }
}
