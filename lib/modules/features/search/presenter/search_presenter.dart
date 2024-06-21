import 'package:bookstore/modules/common/bloc/bloc_impl.dart';
import 'package:bookstore/modules/features/search/router/router.dart';
import 'package:bookstore/modules/features/search/use_case/search_use_case.dart';
import 'package:bookstore/modules/features/search/presenter/search_view_model.dart';
import 'package:bookstore/modules/features/search/use_case/search_use_case_output.dart';
import 'package:bookstore/modules/features/search/presenter/new_releases_view_model.dart';

part 'search_presenter_output.dart';

class SearchPresenter with BlocImpl<SearchPresenterOutput> {
  final Router _router;
  final SearchUseCase _searchUseCase;

  SearchPresenter(this._searchUseCase, this._router) {
    _searchUseCase.stream.listen((event) {
      switch (event) {
        case PresentLoading():
          emit(ShowLoading());
        case PresentModel(:final searchPresentationModel):
          emit(ShowSearchResult(
              SearchViewModel.fromPresentation(searchPresentationModel)));
        case PresentNewReleases(:final newReleasesPresentationModel):
          emit(ShowNewReleases(NewReleasesViewModel.fromPresentation(
              newReleasesPresentationModel)));
        case PresentBookDetail(:final isbn):
          _router.routeShowBookDetail(isbn);
      }
    });
  }

  void eventSearchTapped(String value) {
    _searchUseCase.eventSearchTapped(value);
  }

  void eventLoadPaginatedData() {
    _searchUseCase.eventLoadPaginatedData();
  }

  void eventBookCardTapped(int index) {
    _searchUseCase.eventBookCardTapped(index);
  }

  void eventSearchFromRecentSearches(int index) {
    _searchUseCase.eventSearchFromRecentSearches(index);
  }

  @override
  void dispose() {
    _searchUseCase.dispose();
    super.dispose();
  }
}
