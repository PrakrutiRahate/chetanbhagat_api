import 'package:chetanbhagat_api/modal/dashboardmodel.dart';
import 'package:chetanbhagat_api/view/Quotes.dart';
import 'package:chetanbhagat_api/view/books.dart';
import 'package:chetanbhagat_api/view/images.dart';
import 'package:chetanbhagat_api/view/motivation.dart';
import 'package:chetanbhagat_api/view/video.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    List<DashBoardItemsModal> ofDashBoard = [
      DashBoardItemsModal(
          title: "Books",
          img: "assets/books_1.png",
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Books()));
          }),
      DashBoardItemsModal(
          title: "Motivational Stroies",
          img: "assets/MOTIVATIONAL.png",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MotivationPage()));
          }),
      DashBoardItemsModal(
          title: "Quotes",
          img: "assets/Quotes.png",
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => QuotesPage()));
          }),
      DashBoardItemsModal(
          title: "Images",
          img: "assets/images.png",
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ImagesPage()));
          }),
      DashBoardItemsModal(
          title: "VIDEOS",
          img: "assets/VIDEOS.png",
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => VideoPages()));
          }),
    ];
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
                    const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 3.5,
                    ),
                    const Text(
                      "Home",
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
                    itemCount: ofDashBoard.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 4),
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              ofDashBoard[i].onTap();
                            },
                            child: Container(
                              height: 100,
                              width: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(ofDashBoard[i].img)),
                              ),
                            ),
                          ),
                          Text(
                            ofDashBoard[i].title,
                            maxLines: 2,
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          )
                        ],
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
