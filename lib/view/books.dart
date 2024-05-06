import 'dart:convert';

import 'package:chetanbhagat_api/modal/books_modal.dart';
import 'package:chetanbhagat_api/view/webview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Books extends StatefulWidget {
  const Books({super.key});

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  List<BooksModal> ofBooks = [];

  void bookResponse() async {
    var resp = await http.get(
        Uri.parse("https://mapi.trycatchtech.com/v3/chetan_bhagat/book_link"));
    if (resp.statusCode == 200) {
      setState(() {
        ofBooks = BooksModal.ofBooksMethd(jsonDecode(resp.body));
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
      body: ofBooks.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Center(
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
                            "Books",
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
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GridView.builder(
                            itemCount: ofBooks.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 10),
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LinksBook(
                                              b1: ofBooks[i].bookLinkUrl ??
                                                  "")));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: NetworkImage(
                                            ofBooks[i].bookLinkImage!),
                                        fit: BoxFit.fill,
                                      )),
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: 20,
                                        width: double.infinity,
                                        color: Colors.black26,
                                        child: Text(
                                          ofBooks[i].bookLinkName ?? "NO DATA",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(255, 9, 9, 9),
                                            fontSize: 16,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
