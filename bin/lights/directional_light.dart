import '../objects/scene_object.dart';
import '../structs/vector_3.dart';
import 'scene_light.dart';

class DirectionalLight extends SceneLight {

  @override final num intensity;
  
  final Vector3 direction;

  DirectionalLight({
    required this.intensity,
    required this.direction,
  });

  factory DirectionalLight.fromMap(Map light) => DirectionalLight(
    direction: Vector3.fromMap(light['position']),
    intensity: light['intensity'],
  );

  @override
  num getPointIntensity(SceneObject? object, Vector3 intersection) {

    if (object == null) {
      return 0;
    }

    var normal = object.getNormal(intersection);

    if (0 < normal ^ direction) {
      return intensity * (normal ^ direction) / (normal.magnitude * direction.magnitude);
    } 

    return 0;
  }
}
