import 'package:books/src/my_books_feature/book.dart';
import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class BookDetailsView extends StatelessWidget {
  const BookDetailsView({Key? key, required this.book}) : super(key: key);

  final Book book;

  static const routeName = '/book';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.name),
      ),
      body: Center(
        child: Text(book.toString()),
      ),
    );
  }
}
