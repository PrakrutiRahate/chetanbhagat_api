import 'dart:convert';

import 'package:chetanbhagat_api/modal/motivational_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MotivationPage extends StatefulWidget {
  const MotivationPage({super.key});

  @override
  State<MotivationPage> createState() => _MotivationPageState();
}

class _MotivationPageState extends State<MotivationPage> {
  List<MotivationalStories> ofMotivation = [];

  MotiResponse() async {
    var resp = await http.get(Uri.parse(
        "https://mapi.trycatchtech.com/v3/chetan_bhagat/text_stories"));

    if (resp.statusCode == 200) {
      setState(() {
        ofMotivation = MotivationalStories.ofMotivation(jsonDecode(resp.body));
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    MotiResponse();
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
                      "Motivational",
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
                    itemCount: ofMotivation.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, i) {
                      return Container(
                        height: 300,
                        width: 300,
                        child: Text(ofMotivation[i].textStories!),
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
