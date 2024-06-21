import 'package:bookstore/modules/repository/entities/book.dart';

class NewReleasesPresentationModel {
  List<String> recentSearchesRow;
  List<NewReleasePresentationRowModel> rows;

  NewReleasesPresentationModel.fromEntities(
    List<Book> entities,
    List<String> recentSearches,
  )   : rows = entities.indexed
            .map((indexedPair) =>
                NewReleasePresentationRowModel(indexedPair.$2, indexedPair.$1))
            .toList(),
        recentSearchesRow = recentSearches;
}

class NewReleasePresentationRowModel {
  final int index;
  final String title;
  final String subtitle;
  final String isbn13;
  final String price;
  final String image;

  NewReleasePresentationRowModel(Book entity, this.index)
      : title = entity.title,
        subtitle = entity.subtitle,
        isbn13 = entity.isbn13,
        price = entity.price,
        image = entity.image;
}
