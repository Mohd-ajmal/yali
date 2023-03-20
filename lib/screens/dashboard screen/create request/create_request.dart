import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
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
  GetHospital hospitaltypes;
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

late VideoPlayerController _controller;

class _CreateRequestState extends State<CreateRequest> {
  final formKey = GlobalKey<FormState>();

  double _kItemExtent = 32.0;

  int _selectedState = 0;
  int _selectedDistrict = 0;
  int _selectedHospital = 0;
  int _selectedItemQuantiyType = 0;
  List<int> _selectedItemType1 = [0, 0, 0];
  int _selectedItemType = 0;
  int _selectedNoOfItems = 0;
  List<int> _selectedSubItemType1 = [0, 0, 0];
  int _selectedSubItemType = 0;
  int itemQuantity = 0;

  bool isSubmitPressed = false;

  List<String> itemTypesDropDown = [];
  List<String> stateModelDropDown = [];
  List<String> districtModelDropDown = [];
  List<String> itemQuantityTypesDropDown = [];
  List<String> hospitalDropDown = [];
  List<String> noOfItems = ["1", "2", "3"];
  List<String> mainItems = [];
  List<String> organs = ["Heart", "Eye", "Kidney", "Heart Tissue", "Skin"];
  List<String> subItemsOrgans = [
    "Antibiotics",
    "Vaccine",
    "Emergency Aid",
    "Insuline",
    "Medicament",
    "Blood Supplies",
    "Organ",
    "Blood Sample"
  ];

  List<String> tablet = [
    "Amoxicillin",
    "Azithromycin",
    "Ceftriaxone",
    "Cephalexin",
    "Clindamycin",
    "Ciprofloxacin",
    "Metronidazole",
    "Levofloxacin",
    "trimethoprim",
    "Aminophylline",
    "Amphetamine sulfate",
    "Atropine sulfate",
    "Caffeine sodium benzoate",
    "Calcium Gluconate",
    "Chlorpheniramine",
    "Digoxin",
    "Diphenylhydantoin sodium",
    "Phenylephrine",
    "Hydrocortisone",
    "Magnesium sulfate",
    "Mannitol injection",
    "Nalorphine",
    "Neostigmine",
    "NorEpinephrine",
    "Phenobarbital",
    "Protamine injection",
    "Saline for injection",
    "Sodium chloride",
    "Corticosteroids",
    "Anticholinergics"
  ];
  List<String> tonic = [
    "Amoxicillin",
    "Azithromycin",
    "Cephalexin",
    "Metronidazole",
    "Levofloxacin",
  ];
  List<String> vaccine = [
    "Covid Vaccines",
    "DPT (Diphtheria Pertussis Tetanus)",
    "Biovac A vaccine",
    "hepatitis B vaccine",
    "hepatitis B vaccine",
    "Varivax",
    "polio",
    "hepatitis b vaccine / Engerix - B",
    "Fluzone High-Dose Quadrivalent",
    "Aminophylline",
    "Calcium Gluconate",
    "Chlorpheniramine",
    "Digoxin",
    "Phenylephrine",
    "Phenobarbital",
  ];
  List<String> emergencyAid = ["Compact Defibrillator"];
  List<String> insulin = ["Diabetes mellitus"];
  List<String> bloodSupplies = [
    "O+ 250 ml",
    "O- 250 ml",
    "A+ 250 m",
    "A- 250 ml",
    "B+ 250 ml",
    "B- 250 ml",
    "AB+ 250 ml",
    "AB- 250 ml",
  ];
  List<String> blood = [
    "ELISA test",
    "Rapid influenza diagnostic tests (RIDTs)",
    "PCR Testing",
    "Stool test.",
    "Complete blood count (CBC), thyroid function, and erythrocyte sedimentation rate (ESR)",
    "Monospot test.",
    "Complete blood count (CBC)",
    "Tumor marker tests",
    "High-sensitivity CRP",
    "Nucleic acid test (NAT)",
    "NAT",
    "Fever panel test",
    "A1C test",
    "Estradiol",
    "Prostate-specific antigen (PSA)",
    "Testosterone",
    "Thyroid-stimulating hormone (TSH test)",
    "C-reactive protein test",
    "Homocysteine",
    "DHEA",
    "Complete Metabolic and Lipid Panel (CMP)",
    "Vitamin D-25 Hydroxy",
    "Human chorionic gonadotropin Test (HCG)"
  ];
  List<String> urine = [
    "Urine pH",
    "Rapid urine test",
    "Urinalysis Test",
    "Human chorionic gonadotropin Test (HCG)",
  ];
  List<String> throat = ["Throat Culture", "strep A test"];
  List<String> stoolSample = ["Fecal occult blood test (FOBT)"];
  List<String> spinalTap = ["lumbar	Puncture"];

  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    itemQuantityTypesDropDown
        .addAll(widget.itemQuantityTypes.data.map((e) => e.quantityName));
    stateModelDropDown.addAll(widget.stateModel.data.map((e) => e.stateName));
    districtModelDropDown
        .addAll(widget.districtModel.data.map((e) => e.districtName));
    itemTypesDropDown.addAll(widget.itemTypesModel.data.map((e) => e.typeName));
    hospitalDropDown.addAll(widget.hospitaltypes.data.map((e) => e.hName));
    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.asset("assets/images/yali_video.mp4"),
    );
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
      body: isSubmitPressed == false
          ? Container(
              padding: const EdgeInsets.only(
                  top: 40.0, left: 10.0, right: 10, bottom: 10),
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
                              children: List<Widget>.generate(
                                  stateModelDropDown.length, (int index) {
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
                                Text(stateModelDropDown[_selectedState]
                                    .toString()),
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
                              children: List<Widget>.generate(
                                  districtModelDropDown.length, (int index) {
                                return Center(
                                  child: Text(
                                    districtModelDropDown.isEmpty
                                        ? "Nothing to show"
                                        : districtModelDropDown[index]
                                            .toString(),
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
                                Text(districtModelDropDown.isEmpty
                                    ? "Nothing to show"
                                    : districtModelDropDown[_selectedDistrict]
                                        .toString()),
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
                        "No. of items you are going to request",
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
                                  _selectedNoOfItems = selectedItem;
                                  log(_selectedNoOfItems.toString());
                                });
                              },
                              children: List<Widget>.generate(noOfItems.length,
                                  (int index) {
                                return Center(
                                  child: Text(
                                    noOfItems.isEmpty
                                        ? "Nothing to show"
                                        : noOfItems[index].toString(),
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
                                Text(noOfItems.isEmpty
                                    ? "Nothing to show"
                                    : noOfItems[_selectedNoOfItems].toString()),
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
                              children: List<Widget>.generate(
                                  hospitalDropDown.length, (int index) {
                                return Center(
                                  child: Text(
                                    hospitalDropDown.isEmpty
                                        ? "Nothing to show"
                                        : hospitalDropDown[index].toString(),
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
                                Text(hospitalDropDown.isEmpty
                                    ? "Nothing to show"
                                    : hospitalDropDown[_selectedHospital]
                                        .toString()),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 10.0,
                      // ),
                      // const Text(
                      //   "Select item quantity type",
                      //   style: TextStyle(fontWeight: FontWeight.bold),
                      // ),
                      // const SizedBox(
                      //   height: 10.0,
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     _showDialog(
                      //       CupertinoPicker(
                      //         magnification: 1.22,
                      //         squeeze: 1.2,
                      //         useMagnifier: true,
                      //         itemExtent: _kItemExtent,

                      //         // This is called when selected item is changed.
                      //         onSelectedItemChanged: (int selectedItem) {
                      //           setState(() {
                      //             _selectedItemQuantiyType = selectedItem;
                      //           });
                      //         },
                      //         children: List<Widget>.generate(
                      //             itemQuantityTypesDropDown.length, (int index) {
                      //           return Center(
                      //             child: Text(
                      //               itemQuantityTypesDropDown.isEmpty
                      //                   ? "Nothing to show"
                      //                   : itemQuantityTypesDropDown[index].toString(),
                      //             ),
                      //           );
                      //         }),
                      //       ),
                      //     );
                      //   },
                      //   child: Container(
                      //     width: double.infinity,
                      //     height: 65.0,
                      //     decoration: BoxDecoration(
                      //       color: Colors.grey[100],
                      //       borderRadius: BorderRadius.circular(10.0),
                      //       border: const Border(
                      //         top: BorderSide(color: Colors.black),
                      //         bottom: BorderSide(color: Colors.black),
                      //         left: BorderSide(color: Colors.black),
                      //         right: BorderSide(color: Colors.black),
                      //       ),
                      //     ),
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Text(itemQuantityTypesDropDown.isEmpty
                      //               ? "Nothing to show"
                      //               : itemQuantityTypesDropDown[
                      //                       _selectedItemQuantiyType]
                      //                   .toString()),
                      //           Icon(Icons.arrow_drop_down)
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      const SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        children: [
                          for (int i = 1; i <= _selectedNoOfItems + 1; i++)
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    i == 1
                                        ? "First item type"
                                        : i == 2
                                            ? "Second item type"
                                            : i == 3
                                                ? "Third item type"
                                                : "",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                          onSelectedItemChanged:
                                              (int selectedItem) {
                                            log(selectedItem.toString());
                                            setState(() {
                                              _selectedSubItemType =
                                                  selectedItem;
                                              if (selectedItem == 0) {
                                                mainItems.clear();

                                                mainItems.addAll(tablet);
                                              } else if (selectedItem == 1) {
                                                mainItems.clear();

                                                mainItems.addAll(vaccine);
                                              } else if (selectedItem == 2) {
                                                mainItems.clear();

                                                mainItems.addAll(emergencyAid);
                                              } else if (selectedItem == 3) {
                                                mainItems.clear();
                                                _selectedItemType = 0;
                                                mainItems.addAll(insulin);
                                              } else if (selectedItem == 4) {
                                                mainItems.clear();

                                                mainItems.addAll(tonic);
                                              } else if (selectedItem == 5) {
                                                mainItems.clear();

                                                mainItems.addAll(bloodSupplies);
                                              } else if (selectedItem == 6) {
                                                mainItems.clear();

                                                mainItems.addAll(organs);
                                              } else if (selectedItem == 7) {
                                                mainItems.clear();

                                                mainItems.addAll(blood);
                                              }
                                              log(_selectedSubItemType
                                                  .toString());
                                            });
                                          },
                                          children: List<Widget>.generate(
                                              subItemsOrgans.length,
                                              (int index) {
                                            return Center(
                                              child: Text(
                                                subItemsOrgans.isEmpty
                                                    ? "Nothing to show"
                                                    : subItemsOrgans[index]
                                                        .toString(),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: const Border(
                                          top: BorderSide(color: Colors.black),
                                          bottom:
                                              BorderSide(color: Colors.black),
                                          left: BorderSide(color: Colors.black),
                                          right:
                                              BorderSide(color: Colors.black),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(subItemsOrgans.isEmpty
                                                ? "Nothing to show"
                                                : subItemsOrgans[
                                                        _selectedSubItemType]
                                                    .toString()),
                                            const Icon(Icons.arrow_drop_down)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    i == 1
                                        ? "First sub item type"
                                        : i == 2
                                            ? "Second sub item type"
                                            : i == 3
                                                ? "Third sub item type"
                                                : "",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
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
                                          onSelectedItemChanged:
                                              (int selectedItem) {
                                            setState(() {
                                              _selectedItemType = selectedItem;
                                              log("selected $_selectedItemType");
                                            });
                                          },
                                          children: List<Widget>.generate(
                                              mainItems.length, (int index) {
                                            return Center(
                                              child: Text(
                                                mainItems.isEmpty
                                                    ? "Nothing to show"
                                                    : mainItems[index]
                                                        .toString(),
                                              ),
                                            );
                                          }),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 65.0,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: const Border(
                                              top: BorderSide(
                                                  color: Colors.black),
                                              bottom: BorderSide(
                                                  color: Colors.black),
                                              left: BorderSide(
                                                  color: Colors.black),
                                              right: BorderSide(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(mainItems.isEmpty
                                                    ? "Nothing to show"
                                                    : mainItems[
                                                            _selectedItemType]
                                                        .toString()),
                                                Icon(Icons.arrow_drop_down)
                                              ],
                                            ),
                                          ),
                                        ),
                                        mainItems.isNotEmpty
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  const Text("Qty:"),
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          itemQuantity -= 1;
                                                          if (itemQuantity <
                                                              0) {
                                                            itemQuantity = 0;
                                                          }
                                                        });
                                                      },
                                                      icon: const Icon(
                                                          Icons.remove)),
                                                  Text(itemQuantity.toString()),
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          itemQuantity += 1;
                                                        });
                                                      },
                                                      icon: const Icon(
                                                          Icons.add)),
                                                ],
                                              )
                                            : SizedBox()
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ],
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
                              onPressed: () async {
                                var data = {
                                  "mainItemType": "$_selectedItemType",
                                  "subItemType": "$_selectedSubItemType",
                                  "quantity": "$itemQuantity"
                                };
                                String payload = json.encode(data);
                                if (formKey.currentState!.validate()) {
                                  var response = await HttpService.postOrders(
                                      context: context,
                                      payload: payload,
                                      recieverId: _selectedHospital);
                                  log(response.toString());
                                  if (response.toString() == "201") {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                        "Order Placed Successfully",
                                      ),
                                      backgroundColor: Colors.green,
                                    ));
                                    log("message");
                                    setState(() {
                                      isSubmitPressed = true;
                                    });
                                    Timer.periodic(Duration(seconds: 2),
                                        (timer) {
                                      Navigator.pop(context);
                                    });
                                  }
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
            )
          : Container(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                  child: Image.asset(
                "assets/images/yali_video_hif.gif",
                height: double.infinity,
                fit: BoxFit.fill,
              )),
            ),
    );
  }
}
