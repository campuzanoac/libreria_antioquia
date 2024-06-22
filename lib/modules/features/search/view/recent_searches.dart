import 'package:flutter/material.dart';
import 'package:bookstore/modules/common/bloc/bloc_provider.dart';
import 'package:bookstore/modules/common/constants/text_strings.dart';
import 'package:bookstore/modules/features/search/presenter/search_presenter.dart';

class RecentSearches extends StatelessWidget {
  final List<String> recentSearches;
  const RecentSearches({super.key, required this.recentSearches});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: Text(
              TextStrings.recentSearches,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          _RecentSearchesList(recentSearches: recentSearches),
        ],
      ),
    );
  }
}

class _RecentSearchesList extends StatelessWidget {
  final List<String> recentSearches;
  const _RecentSearchesList({required this.recentSearches});

  @override
  Widget build(BuildContext context) {
    final presenter = BlocProvider.of<SearchPresenter>(context)!;

    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: recentSearches.indexed.map((indexedPair) {
              return Padding(
                padding: getPaddingForChipPosition(indexedPair.$1),
                child: GestureDetector(
                  onTap: () {
                    presenter.eventSearchFromRecentSearches(indexedPair.$1);
                  },
                  child: Chip(
                    label: Text(indexedPair.$2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

extension on _RecentSearchesList {
  EdgeInsets getPaddingForChipPosition(int index) {
    return index == 0
        ? const EdgeInsets.only(left: 16.0, right: 1.0)
        : const EdgeInsets.symmetric(horizontal: 1.0);
  }
}
