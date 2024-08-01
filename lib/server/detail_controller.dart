import 'dart:convert';
import 'dart:developer';
import 'package:book_api/model/detail_model.dart';
import 'package:http/http.dart' as http;


// fetching books from api
Future<Details> getDetails(int bookId) async{
  
  Details? details;
  try {
      var detailUrl = Uri.parse("https://simple-books-api.glitch.me/books/$bookId");
  var response = await http.get(detailUrl);


log(response.statusCode.toString());
  if(response.statusCode == 200){
    var jsonData = jsonDecode(response.body);
    details = Details.fromJson(jsonData);
     return details;
       }     
      else {
    throw Exception("Error fetching book details: ${response.statusCode}");
   }
  } catch (e) {
    log(e.toString());
  }
return details!;
    
}