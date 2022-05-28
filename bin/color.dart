import 'package:image/image.dart' as img;
import 'package:quiver/core.dart';

class Color {

  final int green;
  final int blue;
  final int red;

  Color(this.red, this.green, this.blue)
    : assert(0 <= green && green <= 255),
      assert(0 <= blue && blue <= 255),
      assert(0 <= red && red <= 255);

  Color.black() : this(0, 0, 0);
  Color.red() : this(255, 0, 0);
  Color.green() : this(0, 255, 0);
  Color.blue() : this(0, 0, 255);
  Color.yellow() : this(255, 255, 0);
  Color.cyan() : this(0, 255, 255);
  Color.magenta() : this(255, 0, 255);
  Color.white() : this(255, 255, 255);

  int toInt() =>
    img.getColor(red, green, blue);

  Color operator*(double other) => Color(
    other * red as int,
    other * green as int,
    other * blue as int,
  );

  Color operator+(Color other) => Color(
    other.red + red,
    other.green + green,
    other.blue + blue,
  );

  @override
  bool operator==(other) => other is Color
    && other.red == red
    && other.green == green
    && other.blue == blue;

  @override
  int get hashCode => hash3(
    red.hashCode,
    green.hashCode,
    blue.hashCode,
  );
}
