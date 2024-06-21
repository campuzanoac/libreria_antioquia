import 'package:flutter/material.dart';
import 'package:bookstore/modules/common/bloc/bloc_builder_data.dart';
import 'package:bookstore/modules/common/stateful_setter/stateful_setter.dart';
import 'package:bookstore/modules/features/book_detail/presenter/book_detail_presenter_output.dart';

import 'package:bookstore/modules/features/book_detail/presenter/book_detail_presenter.dart';

class BookDetailView extends StatefulWidget {
  final BookDetailPresenter presenter;
  const BookDetailView({super.key, required this.presenter});

  @override
  State<BookDetailView> createState() => _BookDetailViewState();
}

class _BookDetailViewState extends State<BookDetailView> {
  late final BookDetailPresenter _presenter;
  final _appBarKey = GlobalKey<StatefulSetterState<String>>();

  @override
  void initState() {
    _presenter = widget.presenter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.0,
        title: StatefulSetter<String>(
            key: _appBarKey,
            builder: (context, data) {
              return Text(data);
            }),
      ),
      body: SafeArea(
          child:
              BlocBuilderData<BookDetailPresenter, BookDetailPresenterOutput>(
        bloc: _presenter,
        builder: (context, data) {
          switch (data) {
            case ShowLoading():
              StatefulSetter.value(key: _appBarKey, value: '');
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ShowModel():
              return Container();
          }
        },
      )),
    );
  }
}
