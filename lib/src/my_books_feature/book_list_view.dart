import 'package:books/src/my_books_feature/book.dart';
import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'book_details_view.dart';
import 'book_service.dart';

class _BookListViewState extends State<BookListView> {
  _BookListViewState(this.bookDataService);

  final BookService bookDataService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Books'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: bookDataService.items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = bookDataService.items[index];

          return ListTile(
              title: Text(item.name),
              leading: const CircleAvatar(
                // Display the Flutter Logo image asset.
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                // Navigate to the details page. If the user leaves and returns to
                // the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.pushNamed(context, BookDetailsView.routeName,
                    arguments: item);
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddBook(
                      bookDataService: bookDataService,
                    )),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// Displays a list of SampleItems.
class BookListView extends StatefulWidget {
  const BookListView({
    Key? key,
    required this.bookDataService,
  }) : super(key: key);

  static const routeName = '/';

  final BookService bookDataService;

  @override
  // ignore: no_logic_in_create_state
  _BookListViewState createState() => _BookListViewState(bookDataService);
}

//new item

class _AddBookState extends State<AddBook> {
  _AddBookState(this.bookDataService);

  final BookService bookDataService;
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
                      setState(() {
                        bookDataService.addBook(Book(bookNameController.text));
                      });
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

class AddBook extends StatefulWidget {
  const AddBook({Key? key, required this.bookDataService}) : super(key: key);

  final BookService bookDataService;

  @override
  // ignore: no_logic_in_create_state
  _AddBookState createState() => _AddBookState(bookDataService);
}
