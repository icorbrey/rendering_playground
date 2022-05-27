import 'camera.dart';
import 'canvas.dart';
import 'scene_object.dart';

class Raytracer {

  final Canvas canvas;
  final Camera camera;
  final List<SceneObject> objects;

  Raytracer({
    required this.canvas,
    required this.camera,
    required this.objects,
  });
}
