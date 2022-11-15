import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class DetailsNewsScreen extends StatefulWidget {
  final image;
  final title;
  final content;
  final description;
  final author;
  final url;

  const DetailsNewsScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.content,
      required this.description,
      required this.author,
      required this.url});
  @override
  State<DetailsNewsScreen> createState() => _DetailsNewsScreenState();
}

class _DetailsNewsScreenState extends State<DetailsNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        iconTheme: IconThemeData(color: Colors.grey),
        actions: [
          IconButton(
            onPressed: () {
              Share.share(widget.url);
            },
            icon: Icon(Icons.share, color: Colors.grey),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.star, color: Colors.grey),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.image ??
                  "https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg",
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.title ?? 'No Title',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.author ?? "No Author",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.description ?? 'No Description',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
