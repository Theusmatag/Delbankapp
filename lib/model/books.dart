class Books {
  int rank;
  String publisher;
  String description;
  String price;
  String title;
  String author;
  String bookImage;
  String amazonProductUrl;
  Books({
    required this.rank,
    required this.publisher,
    required this.description,
    required this.price,
    required this.title,
    required this.author,
    required this.bookImage,
    required this.amazonProductUrl,
  });

  factory Books.fromMap(Map<String, dynamic> map) {
    return Books(
      rank: map['rank'] as int,
      publisher: map['publisher'] as String,
      description: map['description'] as String,
      price: map['price'] as String,
      title: map['title'] as String,
      author: map['author'] as String,
      bookImage: map['book_image'] as String,
      amazonProductUrl: map['amazon_product_url'] as String,
    );
  }
}
