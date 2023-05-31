class BestSeller {
  String displayname;
  String listnameencoded;
  String oldestpublisheddate;
  String newestpublisheddate;
  BestSeller({
    required this.displayname,
    required this.listnameencoded,
    required this.oldestpublisheddate,
    required this.newestpublisheddate,
  });

  factory BestSeller.fromMap(Map<String, dynamic> map) {
    return BestSeller(
      displayname: map['display_name'] as String,
      listnameencoded: map['list_name_encoded'] as String,
      oldestpublisheddate: map['oldest_published_date'] as String,
      newestpublisheddate: map['newest_published_date'] as String,
    );
  }
}
