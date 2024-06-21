class Books {
  final List<Book> books;

  Books({
    required this.books,
  });

  factory Books.fromJson(Map<String, dynamic> json) => Books(
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
      );
}

class Book {
  final String title;
  final String subtitle;
  final String isbn13;
  final String price;
  final String image;
  final String url;

  Book({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        title: json["title"],
        subtitle: json["subtitle"],
        isbn13: json["isbn13"],
        price: json["price"],
        image: json["image"],
        url: json["url"],
      );
}
