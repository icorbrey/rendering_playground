import 'dart:io';

import 'package:image/image.dart' as img;

import 'canvas.dart';
import '../structs/color.dart';

class ImageCanvas implements Canvas {

  @override final int width;
  @override final int height;

  @override int get maxX => width ~/ 2;
  @override int get minX => -width ~/ 2;
  @override int get maxY => height ~/ 2;
  @override int get minY => -height ~/ 2;

  final img.Image _image;

  img.Image get image => _image;

  ImageCanvas({
    required this.width,
    required this.height,
  })
    : assert(0 <= width),
      assert(0 <= height),
      _image = img.Image(width, height);

  @override
  void paintPixel(int x, int y, Color color) {

    assert(minX <= x && x <= maxX);
    assert(minY <= y && y <= maxY);

    var _x = _toCanvasX(x);
    var _y = _toCanvasY(y);
    var _color = color.toInt();

    img.drawPixel(_image, _x, _y, _color);
  }

  void export(String path) async =>
    await File(path).writeAsBytes(img.encodePng(image));

  int _toCanvasX(num x) =>
    ((width / 2) + x).toInt();

  int _toCanvasY(num y) =>
    ((height / 2) - y).toInt();
}
