import 'dart:convert';

import 'package:chetanbhagat_api/modal/videos_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VideoController extends ChangeNotifier {
  List<VideosModal>? _allVideos;
  List<VideosModal>? get videos => _allVideos;
  VideosModal? _videovaar;

  getVideo() async {
    var response = await http.get(Uri.parse(
        "https://mapi.trycatchtech.com/v3/chetan_bhagat/video_stories"));
    if (response.statusCode == 200) {
      _videovaar = VideosModal.fromJson(jsonDecode(response.body));
      _allVideos = List<VideosModal>.from(_videovaar! as Iterable);
      // List<AllPosts>.from(_recepies!.allPosts!);
      notifyListeners();
    }
  }
}
