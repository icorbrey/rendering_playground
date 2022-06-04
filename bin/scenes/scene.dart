import '../lights/scene_light.dart';
import '../objects/camera.dart';
import '../objects/scene_object.dart';
import '../rendering/canvas.dart';

class Scene {

  final Canvas canvas;
  final Camera camera;
  final List<SceneLight> lights;
  final List<SceneObject> objects;

  Scene({
    required this.canvas,
    required this.camera,
    required this.objects,
    required this.lights,
  });
}
