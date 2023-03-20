import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:laravel_flutter_pusher/laravel_flutter_pusher.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yali/hooks/pusher_config.dart';
import 'package:yali/screens/splash%20screen/splash_screen.dart';
import 'package:yali/theme/theme.dart';

import 'hooks/notification_helper.dart';
import 'model/login_model.dart';

LoginModel? user;
String token = "";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  PusherOptions options = PusherOptions(
    encrypted: true,
    host: PusherConfig.hostEndPoint,
    cluster: PusherConfig.cluster,
    auth: PusherAuth(PusherConfig.hostAuthEndPoint, headers: {
      'Authorization': 'Bearer ${token}',
      'Content-Type':'application/json',
      'Accept': 'application/json', 
    }),
  );
  initializeNotification();
  
  await initilize();
}

userDetails() async {
  SharedPreferences sharedUser = await SharedPreferences.getInstance();
  Map<String, dynamic> userMap = jsonDecode(sharedUser.getString('userData')!);
  user = LoginModel.fromJson(userMap);
  token = user!.token!;
  log("main file receiver $token");
}

initilize() async {
  final service = FlutterBackgroundService();
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,
      autoStartOnBoot: true,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
    ),
  );
  service.startService();
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  // bring to foreground
  Timer.periodic(const Duration(seconds: 5), (timer) async {
    await userDetails();
  LaravelEcho.init(token: token);
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');
        //log("main file receiver ${user!.token}");
        // NotificationHelper.showNotification(title:"Yali",body:"You have received an order",payload:"heart");
      }
    }
    // NotificationHelper.showNotification(title:"Yali",body:"You have received an order",payload:"heart");
    /// you can see this log in logcat
    print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');
    DateTime now = DateTime.now();

    LaravelEcho.instance.connect();

    LaravelEcho.instance.private('order-received').listen('order-received',
        (e) {
      log(e.toString());
    });

    log("socket id ${LaravelEcho.socketId.toString()}");
    createPusherClient(token);

    service.invoke(
      'update',
      {
        "current_date": DateTime.now().toIso8601String(),
        "device": "Android",
      },
    );
  });
}

void initializeNotification() async {
  try {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  } catch (e) {
    print(e.toString());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: MaterialApp(
        title: 'Yali',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
