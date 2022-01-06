import 'package:flutter/material.dart';

import 'book.dart';

class BookService with ChangeNotifier {
  BookService(this.items);

  final List<Book> items;

  void addBook(Book book) {
    items.add(book);
    notifyListeners();
  }
}
