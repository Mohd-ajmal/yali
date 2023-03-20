import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yali/constants/app_colors.dart';
 
class TrackScreen extends StatefulWidget {
  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

WebViewController? _controller;

class _TrackScreenState extends State<TrackScreen> {

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://suite.auterion.com/live/788/01GRTGK3CXYGS0W389Y53P2CBS')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse('https://suite.auterion.com/live/788/01GRTGK3CXYGS0W389Y53P2CBS'));
  }
   
   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: AppColors.blue,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.track_changes),
              SizedBox(width: 10.0,),
              Text("Track Yali"),
            ],
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(height: 40,),
            Expanded(
            //  height: double.infinity,
            //  width: double.infinity,
              child: WebViewWidget(controller: _controller!,)
            ),
          ],
        ),
      ),
    );
  }
}