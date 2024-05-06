import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class LinksBook extends StatefulWidget {
  String b1;
  LinksBook({required this.b1, super.key});

  @override
  State<LinksBook> createState() => _LinksBookState();
}

class _LinksBookState extends State<LinksBook> {
  late WebViewController c1;
  @override
  void initState() {
    // TODO: implement initState
    c1 = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Color.fromARGB(0, 0, 0, 0))
      ..setNavigationDelegate(NavigationDelegate())
      ..loadRequest(Uri.parse(widget.b1));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0xFF021C4F),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 3.5,
                    ),
                    Text(
                      "Links",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height / 1.1 -
                    kToolbarHeight +
                    40,
                child: WebViewWidget(
                  controller: c1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
