import 'package:bookstore/modules/features/book_detail/view/book_detail_view.dart';
import 'package:bookstore/modules/features/book_detail/use_case/book_detail_use_case.dart';
import 'package:bookstore/modules/features/book_detail/presenter/book_detail_presenter.dart';

class Assembly {
  final BookDetailView bookDetailView;

  Assembly._(this.bookDetailView);

  factory Assembly(String isbn) {
    final bookDetailUseCase = BookDetailUseCase(isbn);
    final presenter = BookDetailPresenter(bookDetailUseCase);
    final view = BookDetailView(presenter: presenter);

    return Assembly._(view);
  }
}
