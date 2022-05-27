import 'canvas.dart';
import 'color.dart';

class ConsoleCanvas implements Canvas {

  @override final int width;
  @override final int height;

  ConsoleCanvas({
    required this.width,
    required this.height,
  })
    : assert(0 <= width),
      assert(0 <= height);

  @override
  void paintPixel(int x, int y, Color color) {

    assert(0 <= x && x <= width);
    assert(0 <= y && y <= height);

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
