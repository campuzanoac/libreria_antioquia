import 'package:bookstore/modules/repository/entities/book.dart';

class SearchPresentationModel {
  List<String> recentSearchesRow;
  List<SearchPresentationRowModel> rows;

  SearchPresentationModel.fromEntities(
    List<Book> entities,
    List<String> recentSearches,
  )   : rows = entities.indexed
            .map((indexedPair) =>
                SearchPresentationRowModel(indexedPair.$2, indexedPair.$1))
            .toList(),
        recentSearchesRow = recentSearches;
}

class SearchPresentationRowModel {
  final int index;
  final String title;
  final String subtitle;
  final String isbn13;
  final String price;
  final String image;

  SearchPresentationRowModel(Book entity, this.index)
      : title = entity.title,
        subtitle = entity.subtitle,
        isbn13 = entity.isbn13,
        price = entity.price,
        image = entity.image;
}
