import 'dart:async';

import 'package:bookstore/modules/common/bloc/bloc_impl.dart';
import 'package:bookstore/modules/repository/entities/book.dart';
import 'package:bookstore/modules/repository/network/network_mixin.dart';
import 'package:bookstore/modules/repository/local/recent_searches_saved_mixin.dart';
import 'package:bookstore/modules/features/search/use_case/search_use_case_output.dart';
import 'package:bookstore/modules/features/search/use_case/search_presentation_model.dart';
import 'package:bookstore/modules/features/search/use_case/new_releases_presentation_model.dart';

class SearchUseCase
    with BlocImpl<SearchUseCaseOutput>, RecentSearchesSavedMixin, NetworkMixin {
  List<String> _recentSearches = [];
  List<Book> _listOfBooks = [];

  int _nextPage = 1;
  String get _lastSearchTerm => _recentSearches.first;

  SearchUseCase() {
    unawaited(_initialize());
  }

  Future<void> _initialize() async {
    emit(PresentLoading());
    final result = await fetchNewBookReleases();
    _listOfBooks = result.books;
    _recentSearches = await getRecentSearches();
    _presentNewReleases();
  }

  void _refreshPresentation() {
    emit(PresentModel(
      SearchPresentationModel.fromEntities(_listOfBooks, _recentSearches),
    ));
  }

  void _presentNewReleases() {
    emit(PresentNewReleases(
      NewReleasesPresentationModel.fromEntities(_listOfBooks, _recentSearches),
    ));
  }

  Future<void> eventSearchTapped(String search) async {
    if (search.isEmpty) {
      return;
    }

    emit(PresentLoading());

    _addSearchTermToRecentSearches(search);

    final result = await fetchBooksBySearchTerm(search, page: 1);
    _listOfBooks = result.books;
    _refreshPresentation();
  }

  Future<void> eventSearchFromRecentSearches(int index) async {
    emit(PresentLoading());
    final searchTerm = _recentSearches.elementAt(index);

    final result = await fetchBooksBySearchTerm(searchTerm, page: 1);
    _listOfBooks = result.books;
    _refreshPresentation();
    _addSearchTermToRecentSearches(searchTerm);
  }

  Future<void> eventLoadPaginatedData() async {
    _nextPage++;
    final result =
        await fetchBooksBySearchTerm(_lastSearchTerm, page: _nextPage);
    _listOfBooks.addAll([...result.books]);
    _refreshPresentation();
  }

  void eventBookCardTapped(int index) {
    final isbn = _listOfBooks[index].isbn13;
    emit(PresentBookDetail(isbn));
  }

  void _addSearchTermToRecentSearches(String searchTerm) async {
    if (!_recentSearches.contains(searchTerm)) {
      if (_recentSearches.length == 5) {
        _recentSearches.removeAt(4);
        _recentSearches.insert(0, searchTerm);
      } else {
        _recentSearches.insert(0, searchTerm);
      }
      await saveRecentSearches(_recentSearches);
    } else if (_recentSearches.contains(searchTerm)) {
      /// Reorganiza la lista de busquedas recientes para que la última
      /// busqueda quede al inicio de la lista si el término de
      /// busqueda ya existe dentro de la lista.
      final elementPosition = _recentSearches.indexOf(searchTerm);
      _recentSearches.removeAt(elementPosition);
      _recentSearches.insert(0, searchTerm);
      await saveRecentSearches(_recentSearches);
    }
  }
}
