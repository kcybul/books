import 'package:books/src/my_books_feature/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'book_service.dart';

class AddBook extends StatelessWidget {
  AddBook({Key? key}) : super(key: key);

  final bookNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Book"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: bookNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Book name',
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<BookService>()
                          .addBook(Book(bookNameController.text));
                      Navigator.pop(context);
                    },
                    child: const Text('Add'),
                  )),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Go back!'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
