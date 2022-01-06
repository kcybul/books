import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class BookDetailsView extends StatelessWidget {
  const BookDetailsView({Key? key}) : super(key: key);

  static const routeName = '/book';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
