import 'dart:developer';

import 'package:laravel_echo/laravel_echo.dart';
import 'package:pusher_client/pusher_client.dart';


class LaravelEcho {
  static LaravelEcho? _singleton;
  static late Echo _echo;
  final String token;

  LaravelEcho._({
    required this.token
  }){
    _echo =  createLaravelEcho(token);
    
  }

  factory LaravelEcho.init({required String token}){
    if(_singleton == null || token != _singleton?.token){
      _singleton = LaravelEcho._(token: token);
    }

    return _singleton!;
  }

  static Echo get instance => _echo;

  static String get socketId => _echo.socketId() ?? '111111.111111111';
}

class PusherConfig {
  static const appId = "1570229";
  static const key = "31e9129d991d0626beaf";
  static const secret = "666f3549d2d594be3206";
  static const cluster = "ap2";
  static const hostEndPoint = "https://webappstudio-demo.online/api/v1/api/broadcasting/auth";
  static const hostAuthEndPoint = "https://webappstudio-demo.online/api/v1/api/broadcasting/auth/";
  static const port = 80;
}

 PusherClient createPusherClient(String token) {
  
  PusherOptions options = PusherOptions(
    wsPort: PusherConfig.port,
    encrypted: true,
    host: PusherConfig.hostEndPoint,
    cluster: PusherConfig.cluster,
    auth: PusherAuth(PusherConfig.hostAuthEndPoint, headers: {
      'Authorization': 'Bearer ${token}',
      'Content-Type':'application/json',
      'Accept': 'application/json',
    }),
  );

  PusherClient pusherClient = PusherClient(PusherConfig.key, options,autoConnect: true, enableLogging: true);
  log("pusher connect");
  pusherClient.connect();
  pusherClient.onConnectionStateChange((state) { log("pusher status ${state!.currentState}");});
  pusherClient.onConnectionError((error) {log("pusher error $error");});
  pusherClient.subscribe("order-received");
  return pusherClient;
}


Echo createLaravelEcho(String token){
  return Echo(client: createPusherClient(token),broadcaster: EchoBroadcasterType.Pusher);
}
