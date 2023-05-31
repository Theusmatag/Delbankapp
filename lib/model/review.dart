// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReviewBooks {
  final String url;
  final String publicationdt;
  final String byline;
  final String booktitle;
  final String bookauthor;
  final String summary;
  ReviewBooks({
    required this.url,
    required this.publicationdt,
    required this.byline,
    required this.booktitle,
    required this.bookauthor,
    required this.summary,
  });

  factory ReviewBooks.fromMap(Map<String, dynamic> map) {
    return ReviewBooks(
      url: map['url'] as String,
      publicationdt: map['publication_dt'] as String,
      byline: map['byline'] as String,
      booktitle: map['book_title'] as String,
      bookauthor: map['book_author'] as String,
      summary: map['summary'] as String,
    );
  }
}
