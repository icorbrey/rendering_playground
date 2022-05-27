import 'color.dart';

abstract class Canvas {

  int get width;
  int get height;

  int get minX;
  int get maxX;
  int get minY;
  int get maxY;

  void paintPixel(int x, int y, Color color);
}
