import 'dart:convert';

import '../entities/book.dart';
import 'package:http/http.dart' as http;

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
}
