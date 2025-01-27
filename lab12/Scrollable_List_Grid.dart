import 'package:flutter/material.dart';

class ScrollableListGrid extends StatefulWidget {
  const ScrollableListGrid({super.key});

  @override
  State<ScrollableListGrid> createState() => _ScrollableListGridState();
}

class _ScrollableListGridState extends State<ScrollableListGrid> {
  final List<String> images = [
    'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    'https://th.bing.com/th/id/OIG1.wQ7nqzXG6LLji1s3MrOP',
    'https://i0.wp.com/picjumbo.com/wp-content/uploads/mysterious-fantasy-forest-with-old-bridges-free-image.jpg?w=600&quality=80',
    'https://media.istockphoto.com/id/1403500817/photo/the-craggies-in-the-blue-ridge-mountains.jpg?s=612x612&w=0&k=20&c=N-pGA8OClRVDzRfj_9AqANnOaDS3devZWwrQNwZuDSk=',
    'https://media.istockphoto.com/id/1317323736/photo/a-view-up-into-the-trees-direction-sky.jpg?s=612x612&w=0&k=20&c=i4HYO7xhao7CkGy7Zc_8XSNX_iqG0vAwNsrH1ERmw2Q=',
    'https://gratisography.com/wp-content/uploads/2024/10/gratisography-cool-cat-800x525.jpg',
  ];

  bool isToggle = true; // True for Grid layout, false for List layout

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toggle Between Grid & List'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isToggle = !isToggle;
              });
            },
            icon: Icon(isToggle ? Icons.grid_view : Icons.list),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: isToggle
            ? Wrap(
          spacing: 8,
          runSpacing: 8,
          children: images
              .map(
                (image) => Container(
              width: MediaQuery.of(context).size.width / 2 - 12, // Half the width minus padding
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
              .toList(),
        )
            : Column(
          children: images
              .map(
                (image) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
              .toList(),
        ),
      ),
    );
  }
}
