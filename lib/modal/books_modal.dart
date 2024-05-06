class BooksModal {
  String? id;
  String? bookLinkImage;
  String? thumbImage;
  String? bookLinkName;
  String? bookLinkUrl;

  BooksModal(
      {this.id,
      this.bookLinkImage,
      this.thumbImage,
      this.bookLinkName,
      this.bookLinkUrl});

  BooksModal.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    bookLinkImage = json["book_link_image"];
    thumbImage = json["thumb_image"];
    bookLinkName = json["book_link_name"];
    bookLinkUrl = json["book_link_url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["book_link_image"] = bookLinkImage;
    data["thumb_image"] = thumbImage;
    data["book_link_name"] = bookLinkName;
    data["book_link_url"] = bookLinkUrl;
    return data;
  }

  static List<BooksModal> ofBooksMethd(List ofBook) {
    return ofBook.map((e) => BooksModal.fromJson(e)).toList();
  }
}
