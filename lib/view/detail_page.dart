
import "package:book_api/model/detail_model.dart";
import "package:book_api/controller/detail_page_controller.dart";
import "package:flutter/material.dart";

class DetailPage extends StatelessWidget {
  final int bookId;

  const DetailPage({
    super.key,
      required this.bookId
     });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text("Details"),
        centerTitle: true,
        backgroundColor:Colors.transparent,
        foregroundColor:const Color.fromARGB(255, 88, 75, 67),
        elevation: 4,
        iconTheme:  const IconThemeData(color:Colors.purple, size: 25),
        // .fallback
      ),
      body: FutureBuilder<Details>(
        future: getDetails(bookId), 
        builder: (context, snapshot){     
          if(snapshot.connectionState == ConnectionState.waiting){
           return const Center(child: CircularProgressIndicator(
            backgroundColor: Colors.orange, strokeWidth: 5.0,));

          }else if( snapshot.hasError){
            return const Center(child: 
            Text("Error occured...", style:
             TextStyle(color:Colors.orange),
             ));
          }
          else {
            final bookDetails = snapshot.data; if(bookDetails!=null){
              return Container(
                width: double.infinity,
                height: 400,
                decoration:  BoxDecoration(
                  color: Colors.orange[200],
                ),              
                 child: Padding(
                   padding: const EdgeInsets.only(left:15),
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(bookDetails.name! , style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),),
                   
                                 Text('Book: ${bookDetails.type}' , style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),),
                   
                                 Text('Type: ${bookDetails.author}' , style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),),
                   
                                 Text('Isbn: ${bookDetails.isbn}' , style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal,
                                ),),
                                Text('Price: {bookDetails.price}'.toString()),
                                Text('Stock: ${bookDetails.currentStock}'.toString()),
                     ],
                   ),
                 )
              );
             }else{
              return const Center(child: Text("Details not found!"));
             }

          }})
    );
  }
}      
         