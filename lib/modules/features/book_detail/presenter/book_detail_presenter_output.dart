import 'package:bookstore/modules/features/book_detail/presenter/book_detail_view_model.dart';

sealed class BookDetailPresenterOutput {}

final class ShowLoading extends BookDetailPresenterOutput {}

final class ShowModel extends BookDetailPresenterOutput {
  final BookDetailViewModel viewModel;

  ShowModel(this.viewModel);
}
