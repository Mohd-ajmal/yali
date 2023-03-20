import 'dart:convert';
import 'dart:io';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yali/constants/api_const.dart';
import 'package:yali/constants/string.dart';
import 'package:yali/model/district_model.dart';
import 'package:yali/model/error_model.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yali/model/get_accepted_orders.dart';
import 'package:yali/model/get_district_model.dart';
import 'package:yali/model/get_hospitals.dart';
import 'package:yali/model/get_orders_model.dart';
import 'package:yali/model/get_requested_orders.dart';
import 'package:yali/model/item_types_model.dart';
import 'package:yali/model/login_model.dart';
import 'package:yali/model/quantity_types_model.dart';
import 'package:yali/model/show_orders_model.dart';
import 'package:yali/model/state_model.dart';

class HttpService {
  static loginHttp(
      {required BuildContext context,
      required email,
      required password}) async {
    context.loaderOverlay.show();
    var url = Uri.parse(ApiContants.login);
    try {
      var response =
          await http.post(url, body: {"email": email, "password": password});
      log("${ApiContants.login} -> ${response.statusCode}");

      if (response == null) {
        context.loaderOverlay.hide();
        return "Something went wrong";
      } else if (response.statusCode == 422) {
        context.loaderOverlay.hide();
        var errorModel = errorModelFromJson(response.body);
        return errorModel.message;
      } else if (response.statusCode == 200) {
        var prefs = await SharedPreferences.getInstance();
        Map<String, dynamic> decodeOptions = jsonDecode(response.body);
        String user = jsonEncode(LoginModel.fromJson(decodeOptions));
        prefs.setString('userData', user);
        context.loaderOverlay.hide();
        var successModel = loginModelFromJson(response.body);
        return successModel;
      }
    } on SocketException {
      context.loaderOverlay.hide();
      log(Strings.internetIsNotConnected);
      return Strings.internetIsNotConnected;
    } catch (e) {
      context.loaderOverlay.hide();
      log("catch exception $e");
    }
  }

  static getItemTypes({required BuildContext context}) async {
    //context.loaderOverlay.show();
    var url = Uri.parse(ApiContants.itemtypes);
    try {
      var response = await http.get(url);
      log("${ApiContants.itemtypes} -> ${response.statusCode}");
      log(response.body);
      if (response == null) {
        //context.loaderOverlay.hide();
        return "Something went wrong";
      } else if (response.statusCode == 422) {
        //context.loaderOverlay.hide();
        var errorModel = errorModelFromJson(response.body);
        return errorModel.message;
      } else if (response.statusCode == 200) {
        //context.loaderOverlay.hide();

        var successModel = itemTypesModelFromJson(response.body);
        return successModel;
      }
    } on SocketException {
      //context.loaderOverlay.hide();
      log(Strings.internetIsNotConnected);
      return Strings.internetIsNotConnected;
    } catch (e) {
      context.loaderOverlay.hide();
      log("catch exception $e");
    }
  }

  static getState({required BuildContext context}) async {
    //context.loaderOverlay.show();
    var url = Uri.parse(ApiContants.states);
    try {
      var response = await http.get(url);
      log("${ApiContants.states} -> ${response.statusCode}");
      log(response.body);
      if (response == null) {
        //context.loaderOverlay.hide();
        return "Something went wrong";
      } else if (response.statusCode == 422) {
        //context.loaderOverlay.hide();
        var errorModel = errorModelFromJson(response.body);
        return errorModel.message;
      } else if (response.statusCode == 200) {
        //context.loaderOverlay.hide();

        var successModel = stateModelFromJson(response.body);
        return successModel;
      }
    } on SocketException {
      //context.loaderOverlay.hide();
      log(Strings.internetIsNotConnected);
      return Strings.internetIsNotConnected;
    } catch (e) {
      context.loaderOverlay.hide();
      log("catch exception $e");
    }
  }

  static getDistrict({required BuildContext context}) async {
    //context.loaderOverlay.show();
    var url = Uri.parse(ApiContants.districts);
    try {
      var response = await http.get(url);
      log("${ApiContants.districts} -> ${response.statusCode}");
      log(response.body);
      if (response == null) {
        //context.loaderOverlay.hide();
        return "Something went wrong";
      } else if (response.statusCode == 422) {
        //context.loaderOverlay.hide();
        var errorModel = errorModelFromJson(response.body);
        return errorModel.message;
      } else if (response.statusCode == 200) {
        //context.loaderOverlay.hide();

        var successModel = getDistrictFromJson(response.body);
        return successModel;
      }
    } on SocketException {
      //context.loaderOverlay.hide();
      log(Strings.internetIsNotConnected);
      return Strings.internetIsNotConnected;
    } catch (e) {
      context.loaderOverlay.hide();
      log("catch exception $e");
    }
  }

  static getHospitals({required BuildContext context}) async {
    LoginModel user;

    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap =
        jsonDecode(sharedUser.getString('userData')!);
    user = LoginModel.fromJson(userMap);

    var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${user.token}',
      };

    var url = Uri.parse(ApiContants.hospitals);
    try {
      var response = await http.get(url);
      log("${ApiContants.hospitals} -> ${response.statusCode}");
      log(response.body);
      if (response == null) {
        //context.loaderOverlay.hide();
        return "Something went wrong";
      } else if (response.statusCode == 422) {
        //context.loaderOverlay.hide();
        var errorModel = errorModelFromJson(response.body);
        return errorModel.message;
      } else if (response.statusCode == 200) {
        //context.loaderOverlay.hide();

         var successModel = getHospitalFromJson(response.body);
        return successModel;
      }
    } on SocketException {
      //context.loaderOverlay.hide();
      log(Strings.internetIsNotConnected);
      return Strings.internetIsNotConnected;
    } catch (e) {
      context.loaderOverlay.hide();
      log("catch exception $e");
    }
  }

  static getItemQuantities({required BuildContext context}) async {
    //context.loaderOverlay.show();
    var url = Uri.parse(ApiContants.itemQuantities);
    try {
      var response = await http.get(url);
      log("${ApiContants.itemQuantities} -> ${response.statusCode}");
      log(response.body);
      if (response == null) {
        //context.loaderOverlay.hide();
        return "Something went wrong";
      } else if (response.statusCode == 422) {
        //context.loaderOverlay.hide();
        var errorModel = errorModelFromJson(response.body);
        return errorModel.message;
      } else if (response.statusCode == 200) {
        //context.loaderOverlay.hide();

        // var successModel = districtModelFromJson(response.body);
        return "success";
      }
    } on SocketException {
      //context.loaderOverlay.hide();
      log(Strings.internetIsNotConnected);
      return Strings.internetIsNotConnected;
    } catch (e) {
      context.loaderOverlay.hide();
      log("catch exception $e");
    }
  }

  static getItemQuantityTypes({required BuildContext context}) async {
    //context.loaderOverlay.show();
    var url = Uri.parse(ApiContants.itemQuantities);
    try {
      var response = await http.get(url);
      log("${ApiContants.itemQuantities} -> ${response.statusCode}");
      log(response.body);
      if (response == null) {
        //context.loaderOverlay.hide();
        return "Something went wrong";
      } else if (response.statusCode == 422) {
        //context.loaderOverlay.hide();
        var errorModel = errorModelFromJson(response.body);
        return errorModel.message;
      } else if (response.statusCode == 200) {
        //context.loaderOverlay.hide();

        var successModel = itemQuantityTypesFromJson(response.body);
        return successModel;
      }
    } on SocketException {
      //context.loaderOverlay.hide();
      log(Strings.internetIsNotConnected);
      return Strings.internetIsNotConnected;
    } catch (e) {
      context.loaderOverlay.hide();
      log("catch exception $e");
    }
  }

  static getOrders({required BuildContext context}) async {
    LoginModel user;

    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap =
        jsonDecode(sharedUser.getString('userData')!);
    user = LoginModel.fromJson(userMap);
     log("user id ${user.token}");
    // log("user id ${user.data!.id}");
    var url = Uri.parse(ApiContants.orders);

    var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${user.token}',
      };

    var response = await http.get(url, headers: headers);
    log(response.body.toString());
    log("${ApiContants.orders} -> ${response.statusCode}");

    if (response == null) {
      //context.loaderOverlay.hide();
      return "Something went wrong";
    } else if (response.statusCode == 422) {
      //context.loaderOverlay.hide();
      var errorModel = errorModelFromJson(response.body);
      return errorModel.message;
    } else if (response.statusCode == 401) {
      //context.loaderOverlay.hide();
      log('message6');
      // log(response.body.toString());
      
      return "Unauthenticated";
    }
    else if (response.statusCode == 200) {
      //context.loaderOverlay.hide();
      log(response.body.runtimeType.toString());
      // log(response.body.toString());
      var successModel = getOrdersFromJson(response.body);
      return successModel;
    }
  }

  static showOrders({required BuildContext context}) async {
    LoginModel user;

    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap =
        jsonDecode(sharedUser.getString('userData')!);
    user = LoginModel.fromJson(userMap);
    log("user id ${user.data!.id.toString()}");

  var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${user.token}',
      };
  String addedUrl = ApiContants.showOrders ;
  // ?+ user.data!.id.toString();
  log("added url ${addedUrl}");

    var url = Uri.parse(addedUrl);
    // try {
      var response = await http.get(url, headers: headers);
      log(response.body.toString());
      log("${ApiContants.showOrders} -> ${response.statusCode}");

      if (response == null) {
        //context.loaderOverlay.hide();
        return "Something went wrong";
      } else if (response.statusCode == 422) {
        //context.loaderOverlay.hide();
        var errorModel = errorModelFromJson(response.body);
        return errorModel.message;
      } else if (response.statusCode == 200) {
        //context.loaderOverlay.hide();
        // log('message');
        // log(response.body.toString());
        var successModel = showOrdersFromJson(response.body.toString());
        //log(successModel.data.orderId);
        return successModel;
      }
    // } on SocketException {
    //   //context.loaderOverlay.hide();
    //   log(Strings.internetIsNotConnected);
    //   return Strings.internetIsNotConnected;
    // } catch (e) {
    //   context.loaderOverlay.hide();
    //   log("catch exception $e");
    // }
  }

  static getRequesteOrders({required BuildContext context}) async {
    LoginModel user;

    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap =
        jsonDecode(sharedUser.getString('userData')!);
    user = LoginModel.fromJson(userMap);
    log("user id ${user.data!.id.toString()}");
    log("token ${user.token.toString()}");

  var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${user.token}',
      };

    var url = Uri.parse(ApiContants.getRequestedOrders);
    try {
      var response = await http.get(url,headers: headers);
      log(response.body.toString());
      log("${ApiContants.getRequestedOrders} -> ${response.statusCode}");

      if (response == null) {
        //context.loaderOverlay.hide();
        return "Something went wrong";
      } else if (response.statusCode == 422) {
        //context.loaderOverlay.hide();
        var errorModel = errorModelFromJson(response.body);
        return errorModel.message;
      } else if (response.statusCode == 200) {
        //context.loaderOverlay.hide();
        // log('message');
        log("response ${response.body.toString()}");
        var successModel = getRequestedOrdersFromJson(response.body);
        //log(successModel.data.orderId);
        return successModel;
      }
    } on SocketException {
      //context.loaderOverlay.hide();
      log(Strings.internetIsNotConnected);
      return Strings.internetIsNotConnected;
    } catch (e) {
      context.loaderOverlay.hide();
      //log("catch exception $e");
    }
  }

  static getAcceptedOrders({required BuildContext context}) async {
    LoginModel user;

    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap =
        jsonDecode(sharedUser.getString('userData')!);
    user = LoginModel.fromJson(userMap);
    log("user id ${user.data!.id.toString()}");

  var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${user.token}',
      };

    var url = Uri.parse(ApiContants.getAcceptedOrders);
    try {
      var response = await http.get(url,headers: headers);
      log(response.body.toString());
      log("${ApiContants.getAcceptedOrders} -> ${response.statusCode}");

      if (response == null) {
        //context.loaderOverlay.hide();
        return "Something went wrong";
      } else if (response.statusCode == 422) {
        //context.loaderOverlay.hide();
        var errorModel = errorModelFromJson(response.body);
        return errorModel.message;
      } else if (response.statusCode == 200) {
        //context.loaderOverlay.hide();
        // log('message');
        // log(response.body.toString());
        var successModel = getAcceptedOrdersFromJson(response.body);
        //log(successModel.data.orderId);
        return successModel;
      }
    } on SocketException {
      //context.loaderOverlay.hide();
      log(Strings.internetIsNotConnected);
      return Strings.internetIsNotConnected;
    } catch (e) {
      context.loaderOverlay.hide();
      //log("catch exception $e");
    }
  }

  static postOrders({required BuildContext context,required String payload,required recieverId}) async {
    LoginModel user;

    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap =
        jsonDecode(sharedUser.getString('userData')!);
    user = LoginModel.fromJson(userMap);
    log("user id ${user.data!.id.toString()}");

  var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${user.token}',
      };
  var body = {
    "receiver_id": recieverId.toString(),
    "payload": payload
  };
  log(recieverId.toString());
  log(payload);
    var url = Uri.parse(ApiContants.postOrders);
    try {
      var response = await http.post(url, headers: headers,body: body);
      log(response.body.toString());
      log("${ApiContants.getAcceptedOrders} -> ${response.statusCode}");

      return response.statusCode;
    } on SocketException {
      //context.loaderOverlay.hide();
      log(Strings.internetIsNotConnected);
      return Strings.internetIsNotConnected;
    } catch (e) {
      context.loaderOverlay.hide();
      log("catch exception $e");
    }
  }

  static cancelOrder({required BuildContext context,required reason}) async {
    LoginModel user;

    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap =
        jsonDecode(sharedUser.getString('userData')!);
    user = LoginModel.fromJson(userMap);
    log("user id ${user.data!.id.toString()}");

  var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${user.token}',
      };

    var url = Uri.parse(ApiContants.cancelOrder);
    
    try {
      var response = await http.post(url, headers: headers,body: {
        "id":"${user.data!.id}",
        "reason":reason
      });
      
      log("$url -> ${response.statusCode}");
      if(response.statusCode == 200) {
        return "Order cancelled";
      } else {
        return "Something went wrong";
      }
    } on SocketException {
      //context.loaderOverlay.hide();
      log(Strings.internetIsNotConnected);
      return Strings.internetIsNotConnected;
    } catch (e) {
      context.loaderOverlay.hide();
      log("catch exception $e");
    }
  }
}
