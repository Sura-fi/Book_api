import 'package:book_api/server/controller.dart';
import 'package:book_api/view/detail_page.dart';
import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  void Function()? onTap;
   HomePage({super.key, required this.onTap});
  

//  Void onTap () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const Detail(), 
//             ),
//           );
//         }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book App'),
        elevation: 0,
        
         // Set app bar title
      ),
      body: FutureBuilder(
        future: getBooks(), // Fetch data before building the UI
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading books'));
          } else {
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return ListTile(
                  leading:const Icon(
                    Icons.menu_book_rounded,
                    color: Colors.orange,
                  ),
                  title: Text("Book: ${book.name}"),
                  subtitle: Text('type: ${book.type}'),

                  trailing: GestureDetector(
                    onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  DetailPage(bookId:book.id,), 
            ),
          );
        },
                   child: Text(
                      book.availability,
                      style: const TextStyle(color: Colors.green),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}