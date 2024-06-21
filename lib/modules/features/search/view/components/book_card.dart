import 'package:bookstore/modules/common/bloc/bloc_provider.dart';
import 'package:bookstore/modules/features/search/presenter/search_presenter.dart';
import 'package:bookstore/modules/features/search/presenter/search_view_model.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final BookRowViewModel model;
  const BookCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final searchPresenter = BlocProvider.of<SearchPresenter>(context)!;

    return GestureDetector(
      onTap: () {
        searchPresenter.eventBookCardTapped(model.index);
      },
      child: Card(
        child: SizedBox(
          width: double.infinity,
          child: ListTile(
            title: Text(
              model.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            subtitle: Text(
              model.subtitle,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 12,
                  ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            leading: Image.network(model.image),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
          ),
        ),
      ),
    );
  }
}
