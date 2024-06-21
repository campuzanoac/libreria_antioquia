import 'package:bookstore/modules/features/search/presenter/new_releases_view_model.dart';
import 'package:flutter/material.dart';

class GridBookCard extends StatelessWidget {
  final NewBookRowViewModel model;
  const GridBookCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                model.image,
                height: 120,
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
