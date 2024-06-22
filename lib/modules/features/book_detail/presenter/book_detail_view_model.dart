import 'package:html_unescape/html_unescape_small.dart';
import 'package:bookstore/modules/features/book_detail/use_case/book_detail_presentation_model.dart';

class BookDetailViewModel {
  final BookDetailRowModel bookDetailRowModel;

  BookDetailViewModel.fromPresentation(
      BookDetailPresentationModel bookDetailPresentationModel)
      : bookDetailRowModel =
            BookDetailRowModel(bookDetailPresentationModel.bookDetailRowModel);
}

class BookDetailRowModel {
  final String title;
  final String subtitle;
  final String authors;
  final String language;
  final String pages;
  final String year;
  final String rating;
  String? description;
  final String price;
  final String image;

  BookDetailRowModel(BookDetailPresentationRowModel rowModel)
      : title = rowModel.title,
        subtitle = rowModel.subtitle,
        authors = rowModel.authors.replaceAll(RegExp(r', '), '\n'),
        language = rowModel.language,
        pages = rowModel.pages,
        year = rowModel.year,
        rating = rowModel.rating,
        price = rowModel.price.split('\$').last,
        image = rowModel.image {
    description = _unescapeHtmlEncodedString(rowModel.desc);
  }
}

extension on BookDetailRowModel {
  /// Algunas descripciones vienen codificadas en HTML, y por lo tanto algunos
  /// caracteres especiales no se muestran como deben; debido a esto
  /// se crea este método con librería externa para decodificar los
  /// caracteres especiales.
  String _unescapeHtmlEncodedString(String string) {
    final unescape = HtmlUnescape();
    return unescape.convert(string);
  }
}
