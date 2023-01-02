import 'package:flutter/material.dart';

class ChennalCard extends StatelessWidget {
  ChennalCard({Key? key, this.onClick, this.img}) : super(key: key);
  final String? img;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                img ??
                    "https://images.unsplash.com/photo-1623411997327-61103d3a763a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NHw5OTYxNzc5fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                width: double.maxFinite,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
