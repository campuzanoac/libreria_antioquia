import 'package:flutter/material.dart';
import 'package:bookstore/modules/common/bloc/bloc_impl.dart';
import 'package:bookstore/modules/common/bloc/bloc_builder.dart';

class BlocBuilderData<BlocT extends BlocImpl<BlocOutput>, BlocOutput>
    extends StatelessWidget {
  final BlocT bloc;
  final Widget Function(BuildContext, BlocOutput) builder;

  const BlocBuilderData({super.key, required this.bloc, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocT, BlocOutput>(
      bloc: bloc,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.data!;
        return builder(context, data);
      },
    );
  }
}
