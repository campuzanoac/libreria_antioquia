import 'package:bookstore/modules/features/search/use_case/new_releases_presentation_model.dart';

class NewReleasesViewModel {
  final List<String> recentSearchesRow;
  final List<NewBookRowViewModel> rows;

  NewReleasesViewModel.fromPresentation(NewReleasesPresentationModel model)
      : rows = model.rows
            .map((row) => NewBookRowViewModel.fromPresentation(row))
            .toList(),
        recentSearchesRow = model.recentSearchesRow
            .map((searchTerm) => searchTerm.toUpperCase())
            .toList();
}

class NewBookRowViewModel {
  final int index;
  final String title;
  final String image;

  NewBookRowViewModel.fromPresentation(NewReleasePresentationRowModel model)
      : index = model.index,
        title = model.title,
        image = model.image;
}
