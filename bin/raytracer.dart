import 'camera.dart';
import 'canvas.dart';
import 'scene_object.dart';
import 'vector_2.dart';
import 'vector_3.dart';

class Raytracer {

  final Canvas canvas;
  final Camera camera;
  final List<SceneObject> objects;

  Raytracer({
    required this.canvas,
    required this.camera,
    required this.objects,
  });

  Vector2 toCanvasCoord(Vector3 viewportCoord) => Vector2(
    viewportCoord.x * (canvas.width / camera.viewport.width),
    viewportCoord.y * (canvas.height / camera.viewport.height),
  );

  Vector3 toViewportCoord(Vector2 canvasCoord) => Vector3(
    canvasCoord.x * (camera.viewport.width / canvas.width),
    canvasCoord.y * (camera.viewport.height / canvas.height),
    camera.viewportDepth
  );

  void render() {
    
  }
}
