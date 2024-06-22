part of 'search_view.dart';

class _SearchViewNewReleases extends StatelessWidget {
  final NewReleasesViewModel viewModel;
  const _SearchViewNewReleases({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (viewModel.recentSearchesRow.isNotEmpty) ...[
          RecentSearches(recentSearches: viewModel.recentSearchesRow),
          const Divider(
            thickness: 0.0,
            indent: 16.0,
          ),
        ],
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TextStrings.recommended,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: viewModel.rows.map((book) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridBookCard(model: book),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
