import 'package:flutter/material.dart';

import 'package:bookstore/modules/common/bloc/bloc_provider.dart';
import 'package:bookstore/modules/features/search/presenter/new_releases_view_model.dart';

import '../../presenter/search_presenter.dart';

class GridBookCard extends StatelessWidget {
  final NewBookRowViewModel model;
  const GridBookCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final searchPresenter = BlocProvider.of<SearchPresenter>(context)!;

    return GestureDetector(
      onTap: () {
        searchPresenter.eventBookCardTapped(model.index);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                model.image,
                height: 105,
                width: 100,
                fit: BoxFit.cover,
              ),
              Text(
                model.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 10),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
