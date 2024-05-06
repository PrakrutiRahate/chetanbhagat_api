import 'dart:convert';

import 'package:chetanbhagat_api/modal/videos_modal.dart';
import 'package:chetanbhagat_api/view/youtube.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class VideoPages extends StatefulWidget {
  const VideoPages({super.key});

  @override
  State<VideoPages> createState() => _VideoPagesState();
}

class _VideoPagesState extends State<VideoPages> {
  List<VideosModal> videos = [];
  videoResponse() async {
    var resp = await http.get(Uri.parse(
        "https://mapi.trycatchtech.com/v3/chetan_bhagat/video_stories"));
    if (resp.statusCode == 200) {
      videos = VideosModal.getVedioUrl(jsonDecode(resp.body));
      // print( );
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    videoResponse();
    super.initState();
  }

  Widget rowTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF021C4F),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Icon(
                Icons.arrow_right,
                color: Colors.white,
                size: 50,
              ),
            ],
          ),
        ),
      ),
    );
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
                      "Videos",
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
                child: ListView.builder(
                  itemCount: videos.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => YoutubePage(
                                      vtag: videos[i].videourl!,
                                      vtitle: videos[i].title!)));
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF021C4F),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: rowTitle(videos[i].title ?? "")

                              //  Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Flexible(
                              //       child: Text(
                              //         videos[i].title!,
                              //         style: TextStyle(
                              //             color: Colors.white, fontSize: 16),
                              //       ),
                              //     ),
                              //     Icon(
                              //       Icons.arrow_right,
                              //       color: Colors.white,
                              //       size: 50,
                              //     ),
                              //   ],
                              // ),
                              ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
