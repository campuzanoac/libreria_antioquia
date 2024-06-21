part of 'search_view.dart';

class _SearchViewWithModel extends StatefulWidget {
  final void Function() loadPaginatedCallback;
  final SearchViewModel viewModel;
  const _SearchViewWithModel(
      {required this.viewModel, required this.loadPaginatedCallback});

  @override
  State<_SearchViewWithModel> createState() => _SearchViewWithModelState();
}

class _SearchViewWithModelState extends State<_SearchViewWithModel> {
  late ScrollController _scrollController;

  final _scrollThreshold = 0.7;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(paginationScrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RecentSearches(recentSearches: widget.viewModel.recentSearchesRow),
        const Divider(
          thickness: 0.0,
          indent: 16.0,
        ),
        switch (widget.viewModel.rows.isEmpty) {
          true => const Padding(
              padding: EdgeInsets.all(16.0),
              child: _EmptyListCard(),
            ),
          false => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: widget.viewModel.rows.length,
                  itemBuilder: (context, index) {
                    return BookCard(model: widget.viewModel.rows[index]);
                  },
                ),
              ),
            ),
        }
      ],
    );
  }
}

extension on _SearchViewWithModelState {
  void paginationScrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent * _scrollThreshold &&
        !_scrollController.position.outOfRange) {
      widget.loadPaginatedCallback.call();
    }
  }
}

class _EmptyListCard extends StatelessWidget {
  const _EmptyListCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Oops! No se encontraron resultados para esa búsqueda.\n\nIntenta con otro término.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
