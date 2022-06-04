import 'color.dart';

class Shader {

  final Color color;
  final num specular;

  Shader({
    required this.color,
    required this.specular,
  });

  Shader.none() : this(
    color: Color.black(),
    specular: 0,
  );

  factory Shader.fromMap(Map shader) => Shader(
    color: Color.fromHex(shader['color']),
    specular: shader['specular'] ?? -1,
  );
}
