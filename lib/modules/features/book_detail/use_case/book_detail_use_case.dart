import 'dart:async';

import 'package:bookstore/modules/common/bloc/bloc_impl.dart';
import 'package:bookstore/modules/repository/network/network_mixin.dart';
import 'package:flutter/foundation.dart';

import 'book_detail_use_case_output.dart';

class BookDetailUseCase with BlocImpl<BookDetailUseCaseOutput>, NetworkMixin {
  final String _isbn;

  BookDetailUseCase(this._isbn) {
    unawaited(_initialize());
  }

  Future<void> _initialize() async {
    emit(PresentLoading());
    final result = await fetchBookDetails(_isbn);
    debugPrint('RESULT TITLE: ${result.title}');
  }
}
