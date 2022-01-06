import 'package:books/src/my_books_feature/book.dart';
import 'package:books/src/my_books_feature/book_service.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Books data service
  List<Book> books = <Book>[
    // ignore: prefer_const_constructors
    Book('Czysta architektura'),
    // ignore: prefer_const_constructors
    Book('NoSQL Przyjazny przewodnik'),
    // ignore: prefer_const_constructors
    Book('Spark Zaawansowana analiza danych'),
    // ignore: prefer_const_constructors
    Book('Australia gdzie kwiaty rodzą się z ognia'),
    // ignore: prefer_const_constructors
    Book('Wzorce Projektowe')
  ];

  final bookDataService = BookService(books);
  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(BooksApp(
    settingsController: settingsController,
    bookDataService: bookDataService,
  ));
}
