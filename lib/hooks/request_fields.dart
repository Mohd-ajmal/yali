import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RequestFields extends StatelessWidget {
  const RequestFields({super.key});

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
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                SizedBox(
                    width: 25,
                    child: Text("Id",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                SizedBox(
                    width: 100,
                    child: Text("Drone No",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                SizedBox(
                    width: 60,
                    child: Text("Status",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                SizedBox(
                    width: 60,
                    child: Text("Action",
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ]),
        ),
        Container(
          padding: const EdgeInsets.all(7.0),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const SizedBox(
                width: 25,
                child: Text(
                  "12",
                )),
            const SizedBox(
                width: 100,
                child: Text(
                  "#44466",
                )),
            const SizedBox(
                width: 60,
                child: Text(
                  "Active",
                  style: TextStyle(color: Colors.green),
                )),
            SizedBox(
                width: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/svg/cross.svg"),
                    SvgPicture.asset("assets/svg/edit.svg"),
                  ],
                )),
          ]),
        ),
      ],
    );
  }
}
