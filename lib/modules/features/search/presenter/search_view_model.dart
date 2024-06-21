import 'package:bookstore/modules/features/search/use_case/search_presentation_model.dart';

class SearchViewModel {
  final List<String> recentSearchesRow;
  final List<BookRowViewModel> rows;

  SearchViewModel.fromPresentation(SearchPresentationModel model)
      : rows = model.rows
            .map((row) => BookRowViewModel.fromPresentation(row))
            .toList(),
        recentSearchesRow = model.recentSearchesRow
            .map((searchTerm) => searchTerm.toUpperCase())
            .toList();
}

class BookRowViewModel {
  final int index;
  final String title;
  final String subtitle;
  final String image;

  BookRowViewModel.fromPresentation(SearchPresentationRowModel model)
      : index = model.index,
        title = model.title,
        subtitle = model.subtitle,
        image = model.image;
}
