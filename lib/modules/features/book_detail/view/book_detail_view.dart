import 'package:flutter/material.dart';

class BookDetailView extends StatelessWidget {
  final String isbn;
  const BookDetailView({super.key, required this.isbn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isbn),
      ),
      body: const Column(),
    );
  }
}
