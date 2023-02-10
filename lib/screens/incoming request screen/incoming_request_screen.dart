import 'package:flutter/material.dart';
import 'package:yali/constants/app_colors.dart';
import 'package:yali/hooks/request_fields.dart';

class IncomingRequestScreen extends StatefulWidget {
  const IncomingRequestScreen({super.key});

  @override
  State<IncomingRequestScreen> createState() => _IncomingRequestScreenState();
}

class _IncomingRequestScreenState extends State<IncomingRequestScreen> {
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
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  [
                    InkWell(
                      onTap: (){
                        
                      },
                      child:const Icon(
                        Icons.arrow_back_ios,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Incoming Request",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    const Icon(
                      Icons.download,
                      size: 24,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          children: const [
            RequestFields(),
          ],
        ),
      ),
    );
  }
}
