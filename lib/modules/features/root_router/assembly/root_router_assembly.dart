import 'package:bookstore/modules/features/root_router/view/root_router.dart';
import 'package:bookstore/modules/features/root_router/presenter/root_router_presenter.dart';

class Assembly {
  final RootRouter rootRouter;
  Assembly._(this.rootRouter);

  factory Assembly() {
    final presenter = RootRouterPresenter();
    final view = RootRouter(presenter: presenter);

    return Assembly._(view);
  }
}
