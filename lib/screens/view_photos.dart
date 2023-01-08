import 'dart:io';

import 'package:flutter/material.dart';

class ViewPhotos extends StatelessWidget {
  final String document;
  const ViewPhotos({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            return Navigator.pop(context);
          },
        ),
        title: const Text(
          'View Document',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(child: Image.file(File(document)))),
    );
  }
}
