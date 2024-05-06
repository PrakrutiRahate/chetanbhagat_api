class QuotesModal {
  String? id;
  String? textQuote;

  QuotesModal({this.id, this.textQuote});

  QuotesModal.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    textQuote = json["text_quote"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["text_quote"] = textQuote;
    return _data;
  }

    static List<QuotesModal> ofQuotes(List ofQuotes) {
    return ofQuotes.map((e) => QuotesModal.fromJson(e)).toList();
  }
}
