import 'package:flutter/material.dart';

import 'search_app_bar.dart';
import 'package:bookstore/modules/common/bloc/bloc_builder_data.dart';
import 'package:bookstore/modules/features/search/view/recent_searches.dart';
import 'package:bookstore/modules/common/stateful_setter/stateful_setter.dart';
import 'package:bookstore/modules/features/search/view/components/book_card.dart';
import 'package:bookstore/modules/features/search/presenter/search_presenter.dart';
import 'package:bookstore/modules/features/search/presenter/search_view_model.dart';
import 'package:bookstore/modules/features/search/view/components/grid_book_card.dart';
import 'package:bookstore/modules/features/search/presenter/new_releases_view_model.dart';

part 'search_view_with_model.dart';
part 'search_view_new_releases.dart';

class SearchView extends StatefulWidget {
  final SearchPresenter presenter;
  const SearchView({super.key, required this.presenter});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final SearchPresenter _presenter;
  final _appBarKey = GlobalKey<StatefulSetterState>();

  @override
  void initState() {
    _presenter = widget.presenter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 80),
          child: StatefulSetter<({bool textFieldEnabled})>(
            key: _appBarKey,
            builder: (context, enabled) => SearchAppBar(
              enabled: enabled,
              onSearchTapped: (value) {
                _presenter.eventSearchTapped(value);
              },
            ),
          ),
        ),
        body: SafeArea(
          child: BlocBuilderData<SearchPresenter, SearchPresenterOutput>(
            bloc: _presenter,
            builder: (context, data) {
              switch (data) {
                case ShowLoading():
                  StatefulSetter.value(
                      key: _appBarKey, value: (textFieldEnabled: false));
                  return const Center(child: CircularProgressIndicator());
                case ShowSearchResult(:final searchViewModel):
                  StatefulSetter.value(
                      key: _appBarKey, value: (textFieldEnabled: true));
                  return _SearchViewWithModel(
                    viewModel: searchViewModel,
                    loadPaginatedCallback: () {
                      _presenter.eventLoadPaginatedData();
                    },
                  );
                case ShowNewReleases(:final newReleasesViewModel):
                  StatefulSetter.value(
                      key: _appBarKey, value: (textFieldEnabled: true));
                  return _SearchViewNewReleases(
                      viewModel: newReleasesViewModel);
              }
            },
          ),
        ),
      ),
    );
  }
}
