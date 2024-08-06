import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:book_api/model/detail_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailController extends GetxController {
  Detail? detail;
//  Details details;
  int? bookId;
  bool isLoading = false;
  bool isError = false;
  String? errorMessage = '';

  setId(int id) {
    bookId = id;
    update();
  }

// fetching books from api
  Future<void> getDetails() async {
    try {
      isLoading = true;
      update();
      isError = false;
      errorMessage = null;

      var detailUrl =
          Uri.parse("https://simple-books-api.glitch.me/books/$bookId");
      var response = await http.get(detailUrl);

      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        log(jsonData.toString());
        detail = Detail.fromJson(jsonData);
      } else {

        throw Exception("Error fetching book details: ${response.statusCode}");
      }
    } catch (e) {
      log('___________________'); 
      if (e is SocketException) {
        errorMessage = "Please check you internet connection!";
      }
      isError = true;
    } finally {
      isLoading = false;
    }
    update();
  }
}
