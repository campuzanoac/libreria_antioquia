import 'package:bookstore/modules/common/bloc/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/modules/common/bloc/bloc.dart';

class BlocBuilder<TBloc extends Bloc<Output>, Output> extends StatelessWidget {
  final TBloc bloc;
  final Widget Function(BuildContext, AsyncSnapshot<Output>) builder;

  const BlocBuilder({super.key, required this.bloc, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: bloc,
      child: StreamBuilder<Output>(
        stream: bloc.stream,
        builder: builder,
      ),
    );
  }
}
