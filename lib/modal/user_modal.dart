class UserModalDart {
  String? id;
  String? bookLinkImage;
  String? thumbImage;
  String? bookLinkName;
  String? bookLinkUrl;

  UserModalDart(
      {this.id,
      this.bookLinkImage,
      this.thumbImage,
      this.bookLinkName,
      this.bookLinkUrl});

  UserModalDart.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    bookLinkImage = json["book_link_image"];
    thumbImage = json["thumb_image"];
    bookLinkName = json["book_link_name"];
    bookLinkUrl = json["book_link_url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["book_link_image"] = bookLinkImage;
    _data["thumb_image"] = thumbImage;
    _data["book_link_name"] = bookLinkName;
    _data["book_link_url"] = bookLinkUrl;
    return _data;
  }

  static List<UserModalDart> ofBooksMethd(List ofBook) {
    return ofBook.map((e) => UserModalDart.fromJson(e)).toList();
  }
}
