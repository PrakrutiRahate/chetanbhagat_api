import 'dart:convert';

import 'package:chetanbhagat_api/modal/image_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImagesPage extends StatefulWidget {
  const ImagesPage({super.key});

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  List<ImageModal> ofImages = [];
  void bookResponse() async {
    var resp = await http.get(Uri.parse(
        "https://mapi.trycatchtech.com/v3/chetan_bhagat/image_quotes"));

    if (resp.statusCode == 200) {
      setState(() {
        ofImages = ImageModal.ofImageMethod(jsonDecode(resp.body));
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    bookResponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ofImages.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Container(
                width: double.infinity,
                color: const Color(0xFF021C4F),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                // Add functionality for menu icon onPressed event
                              },
                            ),
                            const Expanded(
                              child: Text(
                                "Images",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                                width: 48), // Adjust the width as needed
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        // Wrap the Container with Expanded
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: GridView.builder(
                              itemCount: ofImages.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, i) {
                                return Container(
                                  height: 300,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(ofImages[i].image!),
                                          fit: BoxFit.fill)),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
