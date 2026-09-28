import 'package:flutter/material.dart';
import 'package:summerofcode_ext/apis/api_service.dart';

class Readbooksapi extends StatefulWidget {
  const Readbooksapi({super.key});

  @override
  State<Readbooksapi> createState() => _ReadbooksapiState();
}

class _ReadbooksapiState extends State<Readbooksapi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Books')),
      body: FutureBuilder(
        future: getAllBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No books found'));
          }

          final books = snapshot.data!;

          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];

              return ListTile(
                title: Text(book.title.toString()),
                subtitle: Text(book.author.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
