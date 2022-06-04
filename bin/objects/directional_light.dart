import '../structs/vector_3.dart';
import 'scene_light.dart';

class DirectionalLight extends SceneLight {

  @override final num intensity;
  
  final Vector3 direction;

  DirectionalLight({
    required this.intensity,
    required this.direction,
  });
}
