import 'package:bookstore/modules/features/search/use_case/new_releases_presentation_model.dart';
import 'package:bookstore/modules/features/search/use_case/search_presentation_model.dart';

sealed class SearchUseCaseOutput {}

final class PresentLoading extends SearchUseCaseOutput {}

final class PresentNewReleases extends SearchUseCaseOutput {
  final NewReleasesPresentationModel newReleasesPresentationModel;

  PresentNewReleases(this.newReleasesPresentationModel);
}

final class PresentModel extends SearchUseCaseOutput {
  final SearchPresentationModel searchPresentationModel;

  PresentModel(this.searchPresentationModel);
}

final class PresentBookDetail extends SearchUseCaseOutput {
  final String isbn;

  PresentBookDetail(this.isbn);
}
