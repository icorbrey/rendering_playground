import '../structs/vector_3.dart';
import 'scene_light.dart';

class PointLight extends SceneLight {

  @override final num intensity;

  final Vector3 position;

  PointLight({
    required this.intensity,
    required this.position,
  });

  factory PointLight.fromMap(Map light) => PointLight(
    position: Vector3.fromMap(light['position']),
    intensity: light['intensity'],
  );
}
