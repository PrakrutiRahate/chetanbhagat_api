class VideosModal {
  String? id;
  String? title;
  String? videourl;
  List<VideosModal>? allvideos;

  VideosModal({this.id, this.title, this.videourl});

  VideosModal.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    videourl = json["video_url"];
  }
  static List<VideosModal> getVedioUrl(List ofVideos) {
    return ofVideos.map((e) => VideosModal.fromJson(e)).toList();
  }
}




// Video data

// [
//     {
//         "id": "3",
//         "title": "Motivational Speech By Chetan Bhagat",
//         "video_url": "tbQ8pk7wBAU"
//     },
//     {
//         "id": "4",
//         "title": "Chetan Bhagat Motivation speech",
//         "video_url": "GnVCI6fSj9U"
//     },
//     {
//         "id": "5",
//         "title": "6 Steps for Success ft. Chetan Bhagat Best Motivation Speech",
//         "video_url": "2MGRHigBpF8"
//     },
//     {
//         "id": "6",
//         "title": "Chetan Bhagat Motivation Seminar 2018 PACE IIT - Full Film",
//         "video_url": "DjKXY_Bi6BE"
//     },
//     {
//         "id": "7",
//         "title": "Chetan Bhagat's JOURNEY & MOTIVATIONAL SPEECH",
//         "video_url": "zlH75MGG9r8"
//     },
//     {
//         "id": "8",
//         "title": "Chetan Bhagat on how to achieve big things in life",
//         "video_url": "YzAYa06vFJY"
//     },
//     {
//         "id": "9",
//         "title": "Chetan Bhagat Motivational Speech 2018",
//         "video_url": "9YTO4yJtaZc"
//     },
//     {
//         "id": "10",
//         "title": "Chetan Bhagat's Motivational Journey",
//         "video_url": "dqMucCwLJEs"
//     },
//     {
//         "id": "11",
//         "title": "Motivational Speech For Success in Life in Hindi",
//         "video_url": "kXPOZdUc_MU"
//     },
//     {
//         "id": "12",
//         "title": "Chetan Bhagat Success Story",
//         "video_url": "sa_SeRQ80sI"
//     },
//     {
//         "id": "13",
//         "title": "Chetan bhagat 's best MOTIVATIONAL SPEECH",
//         "video_url": "CCU5pv0BNcI"
//     },
//     {
//         "id": "14",
//         "title": "Chetan Bhagat 5 Mantras of Success",
//         "video_url": "sTPsDf-ZTkg"
//     },
//     {
//         "id": "15",
//         "title": "Chetan Bhagat 7 rules of success",
//         "video_url": "WbWLWvQCzdY"
//     },
//     {
//         "id": "16",
//         "title": "One Indian Girl by Chetan Bhagat  Animated book summary",
//         "video_url": "YVPpn7bRmow"
//     },
//     {
//         "id": "17",
//         "title": "Chetan Bhagat’s “The Three Mistakes of My Life\" Summary | 3 Mistakes of My Life Story | Kai Po Che",
//         "video_url": "s3N54mhABpQ"
//     },
//     {
//         "id": "18",
//         "title": "Chetan Bhagat’s “Revolution 2020” Story / Summary in Hindi.",
//         "video_url": "IEARhGsvTvg"
//     },
//     {
//         "id": "19",
//         "title": "Chetan Bhagat’s Five Point Someone Summary/ Story | 3 Idiots Real Story",
//         "video_url": "n5sSZyTVILo"
//     },
//     {
//         "id": "20",
//         "title": "Five Point Someone by Chetan bhagat. Animated book summary |3 Idiots",
//         "video_url": "YNzIVk4eY_U"
//     },
//     {
//         "id": "21",
//         "title": "Baccha Yadav's Request To Chetan Bhagat - The Kapil Sharma Show",
//         "video_url": "4JfFKeloYTA"
//     },
//     {
//         "id": "22",
//         "title": "\"One Indian Girl\" By Chetan Bhagat | Audio Book",
//         "video_url": "yZTaH8rvThA"
//     }
// ]