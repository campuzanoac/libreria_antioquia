import 'package:bookstore/modules/features/search/presenter/search_presenter.dart';
import 'package:bookstore/modules/features/search/use_case/search_use_case.dart';

import '../router/router.dart';
import '../view/search_view.dart';

class Assembly {
  final SearchView searchView;
  Assembly._(this.searchView);

  factory Assembly(Router router) {
    final searchUseCase = SearchUseCase();
    final presenter = SearchPresenter(searchUseCase, router);
    final view = SearchView(presenter: presenter);

    return Assembly._(view);
  }
}
