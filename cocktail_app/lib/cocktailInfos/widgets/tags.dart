//liste de tags
//1 tag

import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String tag;

  const Tag(this.tag, {super.key});

  @override
  Widget build(BuildContext context) { //https://dyclassroom.com/image-processing-project/how-to-convert-a-color-image-into-negative
   
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Theme.of(context).colorScheme.surface, //TODO: get color from db
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        tag,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Tags extends StatelessWidget {
  final List<String> tags;

  const Tags(this.tags, {super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 5,
      runSpacing: 5,
      runAlignment: WrapAlignment.start,
      children: tags.map((tag) => Tag(tag, key: key)).toList(),
    );
  }
}
