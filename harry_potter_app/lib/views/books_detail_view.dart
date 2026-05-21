import 'package:flutter/material.dart';

class BooksDetailView extends StatelessWidget {

  final dynamic data;

  const BooksDetailView({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(

        backgroundColor: Colors.white,

        elevation: 0,

        iconTheme: const IconThemeData(
          color: Colors.black,
        ),

        title: Text(

          data['title'] ?? "-",

          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Center(

              child: ClipRRect(

                borderRadius:
                    BorderRadius.circular(10),

                child: Image.network(

                  data['cover'] ?? "",

                  height: 350,

                  fit: BoxFit.cover,

                  errorBuilder:
                      (context, error, stackTrace) {

                    return const Icon(
                      Icons.book,
                      size: 100,
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(

              data['title'] ?? "-",

              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              "Original title : ${data['originalTitle'] ?? "-"}",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 8),

            Text(
              "Release date : ${data['releaseDate'] ?? "-"}",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 8),

            Text(
              "Total pages : ${data['pages']?.toString() ?? "-"}",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            Text(

              data['description'] ?? "-",

              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}