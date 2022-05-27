import 'color.dart';

abstract class Canvas {

  int get width;
  int get height;

  void paintPixel(int x, int y, Color color);
}
