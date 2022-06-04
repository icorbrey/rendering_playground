import 'canvas.dart';
import '../structs/color.dart';

class ConsoleCanvas implements Canvas {

  @override final int width;
  @override final int height;

  @override int get minX => -width / 2 as int;
  @override int get maxX => width / 2 as int;
  @override int get minY => -height / 2 as int;
  @override int get maxY => height / 2 as int;

  ConsoleCanvas({
    required this.width,
    required this.height,
  })
    : assert(0 <= width),
      assert(0 <= height);

  @override
  void paintPixel(int x, int y, Color color) {

    assert(minX <= x && x <= maxX);
    assert(minY <= y && y <= maxY);

    var _x = _toCanvasX(x);
    var _y = _toCanvasY(y);
    var _g = color.green;
    var _b = color.blue;
    var _r = color.red;

    print('X: $_x, Y: $_y, R: $_r, G: $_g, B: $_b');
  }

  int _toCanvasX(int x) =>
    (width / 2 as int) + x;

  int _toCanvasY(int y) =>
    (height / 2 as int) - y;
}
