import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class RecipePicture extends StatefulWidget {
  // TODO: replace images with loaded images
  final List<Image> images = [
    Image(image: AssetImage("assets/vegane_detox_bowl.jpg")),
    Image(image: AssetImage("assets/vegane-restaurants-symbolbild.jpg"))
  ];

  @override
  State<StatefulWidget> createState() => _RecipePictureState();
}

class _RecipePictureState extends State<RecipePicture> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        options: CarouselOptions(
          onPageChanged: (index, _) {
            setState(() {
              _current = index;
            });
          },
        ),
        items: widget.images,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.images.map((url) {
          int index = widget.images.indexOf(url);
          return Container(
            width: 8,
            height: 8,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4)),
          );
        }).toList(),
      )
    ]);
  }
}
