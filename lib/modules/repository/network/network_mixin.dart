import 'dart:convert';

import '../entities/book.dart';
import 'package:http/http.dart' as http;

import '../entities/book_detail.dart';

/// Se opta por escoger un mixin ya que no es necesario agregar la
/// complejidad que un patrón repositorio tendría.
///
/// Los llamados a la API no requieren de ningún Key, autenticación, o
/// algún Header especial en particular
/// por lo que se opta por mantenerla simple.
mixin NetworkMixin {
  final baseUrl = 'https://api.itbook.store/1.0';

  Future<Books> fetchBooksBySearchTerm(
    String searchTerm, {
    required int page,
  }) async {
    final response =
        await http.get(Uri.parse('$baseUrl/search/$searchTerm/$page'));

    if (response.statusCode == 200) {
      return Books.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Item not found or an error occurred');
    }
  }

  Future<Books> fetchNewBookReleases() async {
    final response = await http.get(Uri.parse('$baseUrl/new'));

    if (response.statusCode == 200) {
      return Books.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Item not found or an error occurred');
    }
  }

  Future<BookDetail> fetchBookDetails(String isbn) async {
    final response = await http.get(Uri.parse('$baseUrl/books/$isbn'));

    if (response.statusCode == 200) {
      return BookDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Item not found or an error occurred');
    }
  }
}
