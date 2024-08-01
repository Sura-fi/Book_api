import "dart:convert";
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:book_api/model/models.dart';

final List<Books> books = []; // Initialize an empty list

// Fetch books from the API
Future<void> getBooks() async {
  try {
    var url = Uri.parse('https://simple-books-api.glitch.me/books');
    var response = await http.get(url);
    
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      for (var eachBook in jsonData) {
        final book = Books(
          id: eachBook['id'],
          name: eachBook['name'],
          type: eachBook['type'],
          availability: eachBook['available'] ? "Available" : "Unavailable",
        );
        books.add(book);
      }
    } else {
      // Handle potential API errors
      // print('Error fetching books: ${response.statusCode}');
    }
  } catch (e) {
    log(e.toString());
  }
}
