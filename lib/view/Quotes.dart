import 'dart:convert';

import 'package:chetanbhagat_api/modal/quotes_modal.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class QuotesPage extends StatefulWidget {
  QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  List<QuotesModal> ofQuotes = [];
  QuotesResponse() async {
    var resp = await http.get(Uri.parse(
        "https://mapi.trycatchtech.com/v3/chetan_bhagat/text_quotes"));

    if (resp.statusCode == 200) {
      setState(() {
        ofQuotes = QuotesModal.ofQuotes(jsonDecode(resp.body));
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    QuotesResponse();
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
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 3.5,
                    ),
                    const Text(
                      "Quotes",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
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
                child: GridView.builder(
                    itemCount: ofQuotes.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemBuilder: (context, i) {
                      return Container(
                        height: 300,
                        width: 150,
                        child: Text(ofQuotes[i].textQuote!),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
