import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'webview.dart';
import "dart:async";
class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      title:  "Load ",
      theme: ThemeData(
        primaryColor:  Colors.blue

      ),
      home: SampleAppPage(),
    );
  }

  
}

class SampleAppPage extends StatefulWidget {

  @override
  _SampleAppState createState() => _SampleAppState();

}
class _SampleAppState extends State<SampleAppPage> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:  Text("VNPay")
      ),
      body: WebView(
        initialUrl: "https://vnpay.vn/tuyen-dung/",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },

      ) ,
    );


  }


}


//
//class MyWebView extends StatelessWidget {
//  final String title;
//  final String selectedUrl;
//
//  final Completer<WebViewController> _controller =
//  Completer<WebViewController>();
//
//  MyWebView({
//    @required this.title,
//    @required this.selectedUrl,
//  });
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text(title),
//        ),
//        body: WebView(
//          initialUrl: "https://vnpay.vn/?gclid=Cj0KCQjwu8r4BRCzARIsAA21i_DJqP0KC-scSqn1_ESHH2PVC-f0xf3Lb97dhnAD1uTzE3RWhsIUoSwaAuwVEALw_wcB",
//          javascriptMode: JavascriptMode.unrestricted,
//          onWebViewCreated: (WebViewController webViewController) {
//            _controller.complete(webViewController);
//          },
//
//        )
//
//    );
//
//  }
//}
