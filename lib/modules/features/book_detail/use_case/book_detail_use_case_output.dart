import 'package:bookstore/modules/features/book_detail/use_case/book_detail_presentation_model.dart';

sealed class BookDetailUseCaseOutput {}

final class PresentLoading extends BookDetailUseCaseOutput {}

final class PresentBookDetailModel extends BookDetailUseCaseOutput {
  final BookDetailPresentationModel bookDetailPresentationModel;

  PresentBookDetailModel(this.bookDetailPresentationModel);
}
