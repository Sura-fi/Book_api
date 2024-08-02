import "dart:convert";
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:book_api/model/home_page_model.dart';

class HomePageController extends GetxController {
  bool isLoading = false;
  bool isError = false;
  String? errorMessage;

  final List<Books> books = [];

  @override
  void onInit() {
    super.onInit();
    getBooks();
  }
// Fetch books from the API
  Future<void> getBooks() async {
    try {
      isLoading = true;
      update();
      isError = false;
      errorMessage = null;

      var url = Uri.parse('https://simple-books-api.glitch.me/books');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        for (var eachBook in jsonData) {
          books.add(Books.fromJson(eachBook));
        }
      } else {
        // Handle potential API errors
        print('Error fetching books: ${response.statusCode}');
      }
    } catch (e) {
      if (e is SocketException) {
        errorMessage = "Please check your internet connection";
      }
      isError = true;
    } finally {
      isLoading = false;
    }
    update();
  }
}
