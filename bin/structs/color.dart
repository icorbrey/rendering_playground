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

  factory Color.fromHex(String? hex) {
    if (hex == null) {
      return Color.black();
    }
    int parseHex(String hex) {
      final buffer = StringBuffer();
      buffer.write(hex);
      return int.parse(buffer.toString(), radix: 16);
    }
    var nums = hex
      .replaceFirst('#', '')
      .split('')
      .map(parseHex)
      .toList();
    return Color(
      nums[0] * 16 + nums[1],
      nums[2] * 16 + nums[3],
      nums[4] * 16 + nums[5],
    );
  }

  int toInt() =>
    img.getColor(red, green, blue);

  Color operator*(num other) => Color(
    (other * red).round(),
    (other * green).round(),
    (other * blue).round(),
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
