import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yali/model/get_district_model.dart';
import 'package:yali/model/get_hospitals.dart';
import 'package:yali/providers/dashboard%20provider/create%20request%20provider/create_request_provider.dart';
import 'package:yali/service/service.dart';

import '../../../model/district_model.dart';
import '../../../model/item_types_model.dart';
import '../../../model/quantity_types_model.dart';
import '../../../model/state_model.dart';

class CreateRequest extends StatefulWidget {
  ItemTypesModel itemTypesModel;
  StateModel stateModel;
  GetDistrict districtModel;
  ItemQuantityTypes itemQuantityTypes;
  GetHospitals? hospitaltypes;
  CreateRequest(
      {super.key,
      required this.itemTypesModel,
      required this.stateModel,
      required this.districtModel,
      required this.itemQuantityTypes,
      required this.hospitaltypes});

  @override
  State<CreateRequest> createState() => _CreateRequestState();
}

class _CreateRequestState extends State<CreateRequest> {
  final formKey = GlobalKey<FormState>();
  
  double _kItemExtent = 32.0;

  int _selectedState = 0;
  int _selectedDistrict = 0;
  int _selectedHospital = 0;
  int _selectedItemQuantiyType = 0;
  int _selectedItemType = 0;

  List<String> itemTypesDropDown = [];
  List<String> stateModelDropDown = [];
  List<String> districtModelDropDown = [];
  List<String> itemQuantityTypesDropDown = [];
  List<String> hospitalDropDown = [];

  @override
  void initState() {
    super.initState();
    itemQuantityTypesDropDown
        .addAll(widget.itemQuantityTypes.data.map((e) => e.quantityName));
    stateModelDropDown
        .addAll(widget.stateModel.data.map((e) => e.stateName));
    districtModelDropDown
        .addAll(widget.districtModel.data.map((e) => e.districtName));
    itemTypesDropDown
        .addAll(widget.itemTypesModel.data.map((e) => e.typeName));
    // hospitalDropDown.addAll(widget.hospitaltypes.data.map((e) => e.hospitalName));
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CreateRequstProvider>(context, listen: true);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 40.0,
          left: 10.0,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(
                //   height: 10.0,
                // ),
                // const Text(
                //   "Name",
                //   style: TextStyle(fontWeight: FontWeight.bold),
                // ),
                // const SizedBox(
                //   height: 10.0,
                // ),
                // TextFormField(
                //     validator: (value) {
                //       if (value == null) {
                //         return "Field Can't be empty";
                //       } else if (value.isEmpty) {
                //         return "Field Can't be empty";
                //       } else if (value.length < 3) {
                //         return "Must be greater then 3";
                //       }
                //       return null;
                //     },
                //     decoration: provider.inputDecoration),
                // const SizedBox(
                //   height: 10.0,
                // ),
                // const Text(
                //   "Mobile number",
                //   style: TextStyle(fontWeight: FontWeight.bold),
                // ),
                // const SizedBox(
                //   height: 10.0,
                // ),
                // TextFormField(
                //     validator: (value) {
                //       if (value == null) {
                //         return "Field Can't be empty";
                //       } else if (value.isEmpty) {
                //         return "Field Can't be empty";
                //       } else if (value.length != 10) {
                //         return "Mobile number must have 10 digits";
                //       }
                //       return null;
                //     },
                //     decoration: provider.inputDecoration),
                // // const SizedBox(
                // //   height: 10.0,
                // // ),
                // // const Text(
                // //   "Select country",
                // //   style: TextStyle(fontWeight: FontWeight.bold),
                // // ),
                // // const SizedBox(
                // //   height: 10.0,
                // // ),
                // // DropdownButtonFormField(
                // //   items: [],
                // //   onChanged: (value) {},
                // //   decoration: provider.inputDecoration
                // // ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Select state",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    _showDialog(
                  CupertinoPicker(
                    magnification: 1.22,
                    squeeze: 1.2,
                    useMagnifier: true,
                    itemExtent: _kItemExtent,
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        _selectedState = selectedItem;
                      });
                    },
                    children:
                        List<Widget>.generate(stateModelDropDown.length, (int index) {
                      return Center(
                        child: Text(
                          stateModelDropDown[index].toString(),
                        ),
                      );
                    }),
                  ),
                );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 65.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10.0),
                      border: const Border(
                        top: BorderSide(color: Colors.black),
                        bottom: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(stateModelDropDown[_selectedState].toString()),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                ),
                
                // DropdownButtonFormField(
                //     items: stateModelDropDown,
                //     validator: (value) =>
                //         value == null ? 'Field required' : null,
                //     onChanged: (value) {},
                //     decoration: provider.inputDecoration),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Select district",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    _showDialog(
                  CupertinoPicker(
                    magnification: 1.22,
                    squeeze: 1.2,
                    useMagnifier: true,
                    itemExtent: _kItemExtent,
                    
                    // This is called when selected item is changed.
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        _selectedDistrict = selectedItem;
                      });
                     
                    },
                    children:
                        List<Widget>.generate(districtModelDropDown.length, (int index) {
                      return Center(
                        child: Text(
                          districtModelDropDown.isEmpty ? "Nothing to show" : districtModelDropDown[index].toString(),
                        ),
                      );
                    }),
                  ),
                );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 65.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10.0),
                      border: const Border(
                        top: BorderSide(color: Colors.black),
                        bottom: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(districtModelDropDown.isEmpty ? "Nothing to show" : districtModelDropDown[_selectedDistrict].toString()),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Select hospital",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    _showDialog(
                  CupertinoPicker(
                    magnification: 1.22,
                    squeeze: 1.2,
                    useMagnifier: true,
                    itemExtent: _kItemExtent,
                    
                    // This is called when selected item is changed.
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        _selectedHospital = selectedItem;
                      });
                     
                    },
                    children:
                        List<Widget>.generate(hospitalDropDown.length, (int index) {
                      return Center(
                        child: Text(
                          hospitalDropDown.isEmpty ? "Nothing to show" : hospitalDropDown[index].toString(),
                        ),
                      );
                    }),
                  ),
                );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 65.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10.0),
                      border: const Border(
                        top: BorderSide(color: Colors.black),
                        bottom: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(hospitalDropDown.isEmpty ? "Nothing to show" : hospitalDropDown[_selectedHospital].toString()),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Select item quantity type",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    _showDialog(
                  CupertinoPicker(
                    magnification: 1.22,
                    squeeze: 1.2,
                    useMagnifier: true,
                    itemExtent: _kItemExtent,
                    
                    // This is called when selected item is changed.
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        _selectedItemQuantiyType = selectedItem;
                      });
                     
                    },
                    children:
                        List<Widget>.generate(itemQuantityTypesDropDown.length, (int index) {
                      return Center(
                        child: Text(
                          itemQuantityTypesDropDown.isEmpty ? "Nothing to show" : itemQuantityTypesDropDown[index].toString(),
                        ),
                      );
                    }),
                  ),
                );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 65.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10.0),
                      border: const Border(
                        top: BorderSide(color: Colors.black),
                        bottom: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(itemQuantityTypesDropDown.isEmpty ? "Nothing to show" : itemQuantityTypesDropDown[_selectedItemQuantiyType].toString()),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Select item type",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    _showDialog(
                  CupertinoPicker(
                    magnification: 1.22,
                    squeeze: 1.2,
                    useMagnifier: true,
                    itemExtent: _kItemExtent,
                    
                    // This is called when selected item is changed.
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        _selectedItemType = selectedItem;
                      });
                     
                    },
                    children:
                        List<Widget>.generate(itemTypesDropDown.length, (int index) {
                      return Center(
                        child: Text(
                          itemTypesDropDown.isEmpty ? "Nothing to show" : itemTypesDropDown[index].toString(),
                        ),
                      );
                    }),
                  ),
                );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 65.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10.0),
                      border: const Border(
                        top: BorderSide(color: Colors.black),
                        bottom: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(itemTypesDropDown.isEmpty ? "Nothing to show" : itemTypesDropDown[_selectedItemType].toString()),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                // DropdownButtonFormField(
                //     items: itemTypesDropDown,
                //     validator: (value) =>
                //         value == null ? 'Field required' : null,
                //     onChanged: (value) {},
                //     decoration: provider.inputDecoration),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            var response = HttpService.postOrders(context: context);
                          }
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ))),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
