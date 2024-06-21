import 'package:bookstore/modules/common/bloc/bloc_impl.dart';
import 'package:bookstore/modules/features/book_detail/use_case/book_detail_use_case.dart';
import 'package:bookstore/modules/features/book_detail/use_case/book_detail_use_case_output.dart';

import 'book_detail_presenter_output.dart';

class BookDetailPresenter with BlocImpl<BookDetailPresenterOutput> {
  final BookDetailUseCase _bookDetailUseCase;

  BookDetailPresenter(this._bookDetailUseCase) {
    _bookDetailUseCase.stream.listen((event) {
      switch (event) {
        case PresentLoading():
          emit(ShowLoading());
        case PresentBookDetailModel():
          emit(ShowModel());
      }
    });
  }
}
