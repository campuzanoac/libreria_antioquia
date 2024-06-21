import 'package:bookstore/modules/common/bloc/bloc_impl.dart';
import 'package:bookstore/modules/features/search/router/router.dart'
    as search_router;
import 'package:bookstore/modules/features/root_router/presenter/root_router_presenter_output.dart';

class RootRouterPresenter
    with BlocImpl<RootRouterPresenterOutput>
    implements search_router.Router {
  @override
  void routeShowBookDetail(String isbn) {
    emit(ShowBookDetail(isbn));
  }
}
