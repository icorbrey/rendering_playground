import '../structs/vector_3.dart';
import '../objects/scene_object.dart';
import 'scene_light.dart';

class AmbientLight extends SceneLight {

  @override final num intensity;

  AmbientLight({
    required this.intensity,
  });

  factory AmbientLight.fromMap(Map light) => AmbientLight(
    intensity: light['intensity']
  );

  @override
  num getPointIntensity(SceneObject? object, Vector3 intersection) {
    return intensity;
  }
}
