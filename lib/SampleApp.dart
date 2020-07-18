import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview/CustomWidget.dart';
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
      home: MyFadeTest(),
    );
  }

  
}

class SampleAppPage extends StatefulWidget {

  @override
//  _SampleAppState createState() => _SampleAppState();
  _SampleAppPageState createState() => _SampleAppPageState();

}
//Load Webview
//class _SampleAppState extends State<SampleAppPage> {
//  final Completer<WebViewController> _controller =
//  Completer<WebViewController>();
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(
//        title:  Text("VNPay")
//      ),
//      body: WebView(
//        initialUrl: "https://vnpay.vn/tuyen-dung/",
//        javascriptMode: JavascriptMode.unrestricted,
//        onWebViewCreated: (WebViewController webViewController) {
//          _controller.complete(webViewController);
//        },
//
//      ) ,
//    );
//
//
//  }
//
//}

class _SampleAppPageState extends State<SampleAppPage>
{

  bool toggle = true;
  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return Text('Toggle One');
    } else {
      return CupertinoButton(
        onPressed: () {},
        child: Text('Toggle Two'),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text("Sample App"),
        ),
        body: Center(
          child: _getToggleChild(),

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _toggle,
          tooltip: 'Update Text',
          child: Icon(Icons.update),

        ),
      );
  }

}

// Animation
class MyFadeTest extends StatefulWidget {
  @override
  _MyFadeTest createState() => _MyFadeTest();

}
class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {

  AnimationController controller;
  CurvedAnimation curve;
  @override
  void initState() {
    controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),

      ),
      body:  Center(
        child: Container(
          child: FadeTransition(
            opacity: curve,
            child:  CustomButton("Hello")
//            FlutterLogo(
//              size: 100.0,
//            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        child: Icon(Icons.brush),
        onPressed: (){
          controller.reverse();
        },
      ),

    );

  }


}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;

  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

class Signature extends StatefulWidget {
  SignatureState createState() => SignatureState();
}

class SignatureState extends State<Signature> {

  List<Offset> _points = <Offset>[];

  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          RenderBox referenceBox = context.findRenderObject();
          Offset localPosition =
          referenceBox.globalToLocal(details.globalPosition);
          _points = List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) => _points.add(null),
      child: CustomPaint(painter: SignaturePainter(_points), size: Size.infinite),
    );
  }
}