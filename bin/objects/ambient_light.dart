import 'scene_light.dart';

class AmbientLight extends SceneLight {

  @override final num intensity;

  AmbientLight({
    required this.intensity,
  });
}
