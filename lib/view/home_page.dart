import 'package:book_api/server/home_page_controller.dart';
import 'package:book_api/view/detail_page.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book App'),
        elevation: 0,
      ),
      body: GetBuilder<HomePageController>(builder: (_) {
        if (_.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (_.isError) {
          return Center(child: Text(_.errorMessage ?? "Someting went wrong"));
        } else {
          return Column(
              children: List.generate(
                  _.books.length,
                  (index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                bookId: _.books[index].id!,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          color: !_.books[index].available!
                              ? const Color.fromARGB(78, 175, 76, 76)
                              : null,
                          child: ListTile(
                            leading: const Icon(
                              Icons.menu_book_rounded,
                              color: Colors.orange,
                            ),
                            title: Text("Book: ${_.books[index].name}"),
                            subtitle: Text('type: ${_.books[index].type}'),
                          ),
                        ),
                      )));
        }
      }),
    );
  }
}







        // return FutureBuilder(
        //     future: _.getBooks(), // Fetch data before building the UI
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const Center(child: CircularProgressIndicator());
        //       } else if (snapshot.hasError) {
        //         return const Center(child: Text('Error loading books'));
        //       } else {
        //         return ListView.builder(
        //           itemCount: _.books.length,
        //           itemBuilder: (context, index) {
        //             final book = _.books[index];

        //           },
        //         );
        //       }
        //     },
        //   );