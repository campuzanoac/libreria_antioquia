part of 'search_presenter.dart';

sealed class SearchPresenterOutput {}

final class ShowLoading extends SearchPresenterOutput {}

final class ShowNewReleases extends SearchPresenterOutput {
  final NewReleasesViewModel newReleasesViewModel;

  ShowNewReleases(this.newReleasesViewModel);
}

final class ShowSearchResult extends SearchPresenterOutput {
  final SearchViewModel searchViewModel;

  ShowSearchResult(this.searchViewModel);
}
