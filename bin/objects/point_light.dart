import '../structs/vector_3.dart';
import 'scene_light.dart';

class PointLight extends SceneLight {

  @override final num intensity;

  final Vector3 position;

  PointLight({
    required this.intensity,
    required this.position,
  });
}
