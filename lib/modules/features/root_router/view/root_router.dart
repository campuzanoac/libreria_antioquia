import 'package:bookstore/modules/features/book_detail/view/book_detail_view.dart';
import 'package:flutter/material.dart';
import '../../search/assembly/search_assembly.dart' as search_assembly;
import 'package:bookstore/modules/features/root_router/presenter/root_router_presenter.dart';
import 'package:bookstore/modules/features/root_router/presenter/root_router_presenter_output.dart';

class RootRouter extends StatefulWidget {
  final RootRouterPresenter presenter;
  const RootRouter({super.key, required this.presenter});

  @override
  State<RootRouter> createState() => _RootRouterState();
}

class _RootRouterState extends State<RootRouter> {
  late final RootRouterPresenter _presenter;
  final _navKey = GlobalKey<NavigatorState>();
  var _pages = <MaterialPage>[];

  @override
  void initState() {
    super.initState();
    _presenter = widget.presenter;
    _pages = [
      MaterialPage(
        key: const ValueKey('search_view'),
        child: search_assembly.Assembly(_presenter).searchView,
      ),
    ];

    _presenter.stream.listen((event) {
      switch (event) {
        case ShowPop():
          _navKey.currentState!.pop();
        default:
          _pages.add(event._page());
          setState(() {
            _pages = _pages.toList();
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navKey,
      pages: _pages,
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        _pages.removeLast();
        setState(() {
          _pages = _pages.toList();
        });
        return true;
      },
    );
  }
}

extension on RootRouterPresenterOutput {
  MaterialPage _page() {
    return switch (this) {
      ShowBookDetail(:final isbn) => MaterialPage(
          key: const ValueKey('book_detail_view'),
          child: BookDetailView(isbn: isbn),
        ),
      _ => MaterialPage(child: Container()),
    };
  }
}
