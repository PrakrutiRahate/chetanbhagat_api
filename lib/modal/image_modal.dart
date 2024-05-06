class ImageModal {
  String? id;
  String? image;
  String? thumbImage;

  ImageModal({this.id, this.image, this.thumbImage});

  ImageModal.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    thumbImage = json["thumb_image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["image"] = image;
    _data["thumb_image"] = thumbImage;
    return _data;
  }

  static List<ImageModal> ofImageMethod(List ofImage) {
    return ofImage.map((e) => ImageModal.fromJson(e)).toList();
  }
}
