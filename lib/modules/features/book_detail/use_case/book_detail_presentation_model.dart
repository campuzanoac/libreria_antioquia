import 'package:bookstore/modules/repository/entities/book_detail.dart';

class BookDetailPresentationModel {
  final BookDetailPresentationRowModel bookDetailRowModel;

  BookDetailPresentationModel.fromEntity(BookDetail bookDetail)
      : bookDetailRowModel = BookDetailPresentationRowModel(bookDetail);
}

class BookDetailPresentationRowModel {
  final String title;
  final String subtitle;
  final String authors;
  final String publisher;
  final String language;
  final String isbn10;
  final String isbn13;
  final String pages;
  final String year;
  final String rating;
  final String desc;
  final String price;
  final String image;

  BookDetailPresentationRowModel(BookDetail bookDetail)
      : title = bookDetail.title,
        subtitle = bookDetail.subtitle,
        authors = bookDetail.authors,
        publisher = bookDetail.publisher,
        language = bookDetail.language,
        isbn10 = bookDetail.isbn10,
        isbn13 = bookDetail.isbn13,
        pages = bookDetail.pages,
        year = bookDetail.year,
        rating = bookDetail.rating,
        desc = bookDetail.desc,
        price = bookDetail.price,
        image = bookDetail.image;
}
