import '../objects/scene_object.dart';
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

  @override
  num getPointIntensity(SceneObject? object, Vector3 intersection) {

    if (object == null) {
      return 0;
    }

    var normal = object.getNormal(intersection);
    var direction = position - object.position;

    return getDiffusionIntensity(normal, direction)
      + getSpecularIntensity(object.shader, normal, direction, direction * -1);
  }
}
