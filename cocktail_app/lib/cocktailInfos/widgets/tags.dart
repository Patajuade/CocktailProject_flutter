//liste de tags
//1 tag

import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String tag;

  const Tag(this.tag, {super.key});

  @override
  Widget build(BuildContext context) { //https://dyclassroom.com/image-processing-project/how-to-convert-a-color-image-into-negative
    final Color backgroudTagColor = colorFor(tag.replaceFirst("#", "")); //comme ça la string est différente à chaque fois vu que la color est générée via la String
    final R = 255 - backgroudTagColor.red;
    final G = 255 - backgroudTagColor.green;
    final B = 255 - backgroudTagColor.blue;
    final Color textTagColor = Color.fromRGBO(R,G,B,1);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: backgroudTagColor, //TODO: get color from db
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        tag,
        style: TextStyle(
          color: textTagColor,
          fontWeight: FontWeight.bold),
      ),
    );
  }

  Color colorFor(String text) {
    //https://anoop4real.medium.com/flutter-generate-color-hash-uicolor-from-string-names-fb2ac75bde6b
    var hash = 0;
    for (var i = 0; i < text.length; i++) {
      hash = text.codeUnitAt(i) + ((hash << 5) - hash);
    }
    final finalHash = hash.abs() % (256 * 256 * 256);
    print(finalHash);
    final red = ((finalHash & 0xFF0000) >> 16);
    final blue = ((finalHash & 0xFF00) >> 8);
    final green = ((finalHash & 0xFF));
    final color = Color.fromRGBO(red, green, blue, 1);
    return color;
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
