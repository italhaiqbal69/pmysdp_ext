import 'dart:convert';

import 'package:summerofcode_ext/apis/book_model.dart';
import 'package:http/http.dart' as http;

Future<List<Books>?> getAllBooks() async {
  const String baseUrl = 'https://library-management-api-i6if.onrender.com';
  const String endpoint = '/api/books';

  try {
    //to request server to get response
    final response = await http.get(
      Uri.parse(baseUrl + endpoint),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      // Extract the books list from response
      final List<dynamic> booksJson = data['books'] ?? [];

      // Convert to List<Book>
      final List<Books> books = booksJson
          .map((item) => Books.fromJson(item))
          .toList();

      print('✅ Successfully fetched ${books.length} books');
      return books;
    } else {
      print('❌ Failed to fetch books: ${response.statusCode}');
      print(response.body);
      return null;
    }
  } catch (e) {
    print('❌ Error: $e');
    return null;
  }
}

Future<Map<String, dynamic>?> addBook({
  required String title,
  required String author,
  required String category,
  required int publishedYear,
}) async {
  const String baseUrl = 'https://library-management-api-i6if.onrender.com';
  const String endpoint = '/api/books';

  try {
    final response = await http.post(
      Uri.parse(baseUrl + endpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': title,
        'author': author,
        'category': category,
        'publishedYear': publishedYear,
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      print('✅ Book added successfully: ${data['book']['title']}');
      return data;
    } else if (response.statusCode == 409) {
      print('⚠️ Book already exists');
      return jsonDecode(response.body);
    } else {
      print('❌ Failed to add book: ${response.statusCode}');
      print(response.body);
      return null;
    }
  } catch (e) {
    print('❌ Error: $e');
    return null;
  }
}
