import 'package:flutter/material.dart';

class ColumnScroll extends StatefulWidget {
  const ColumnScroll({super.key});

  @override
  State<ColumnScroll> createState() => _ColumnScrollState();
}

class _ColumnScrollState extends State<ColumnScroll> {

  final List<String> images = [
    'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    'https://th.bing.com/th/id/OIG1.wQ7nqzXG6LLji1s3MrOP',
    'https://i0.wp.com/picjumbo.com/wp-content/uploads/mysterious-fantasy-forest-with-old-bridges-free-image.jpg?w=600&quality=80',
    'https://media.istockphoto.com/id/1403500817/photo/the-craggies-in-the-blue-ridge-mountains.jpg?s=612x612&w=0&k=20&c=N-pGA8OClRVDzRfj_9AqANnOaDS3devZWwrQNwZuDSk=',
    'https://media.istockphoto.com/id/1317323736/photo/a-view-up-into-the-trees-direction-sky.jpg?s=612x612&w=0&k=20&c=i4HYO7xhao7CkGy7Zc_8XSNX_iqG0vAwNsrH1ERmw2Q=',
    'https://gratisography.com/wp-content/uploads/2024/10/gratisography-cool-cat-800x525.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Image.network(images[0]),
          Image.network(images[1]),
          Image.network(images[2]),
          Image.network(images[3]),
          Image.network(images[4]),
          Image.network(images[5])
        ],
      ),
    );
  }
}
