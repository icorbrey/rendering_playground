import 'package:quiver/core.dart';

class Color {

  final int green;
  final int blue;
  final int red;

  Color({
    required this.red,
    required this.green,
    required this.blue,
  })
    : assert(0 <= green && green <= 255),
      assert(0 <= blue && blue <= 255),
      assert(0 <= red && red <= 255);

  Color operator*(double other) => Color(
    green: other * green as int,
    blue: other * blue as int,
    red: other * red as int,
  );

  Color operator+(Color other) => Color(
    green: other.green + green,
    blue: other.blue + blue,
    red: other.red + red,
  );

  @override
  bool operator==(other) => other is Color
    && other.green == green
    && other.blue == blue
    && other.red == red;

  @override
  int get hashCode => hash3(
    green.hashCode,
    blue.hashCode,
    red.hashCode,
  );
}
