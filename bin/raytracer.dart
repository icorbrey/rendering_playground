import 'camera.dart';
import 'canvas.dart';
import 'color.dart';
import 'scene_object.dart';
import 'vector_2.dart';
import 'vector_3.dart';

class Raytracer {

  final Canvas canvas;
  final Camera camera;
  final List<SceneObject> objects;

  final backgroundColor = Color.white();

  Raytracer({
    required this.canvas,
    required this.camera,
    required this.objects,
  });

  void render() {
    for (var x = canvas.minX; x < canvas.maxX; x++) {
      for (var y = canvas.minY; y < canvas.maxY; y++) {
        var viewportCoord = _toViewportCoord(Vector2(x, y));
        var object = _getClosestObject(viewportCoord);
        canvas.paintPixel(x, y, object?.color ?? backgroundColor);
      }
    }
  }

  SceneObject? _getClosestObject(Vector3 viewportIntersection) {

    num closestIntersection = double.infinity;
    SceneObject? closestObject;

    for (var object in objects) {

      var intersections = object.intersect(camera.position, viewportIntersection);
      var near = intersections.item1;
      var far = intersections.item2;

      if (_isInRange(near) && near < closestIntersection) {
        closestIntersection = near;
        closestObject = object;
      }
      
      if (_isInRange(far) && far < closestIntersection) {
        closestIntersection = far;
        closestObject = object;
      }
    }

    return closestObject;
  }

  Vector3 _toViewportCoord(Vector2 canvasCoord) => Vector3(
    canvasCoord.x * (camera.viewportWidth / canvas.width),
    canvasCoord.y * (camera.viewportHeight / canvas.height),
    camera.viewportDepth
  );

  bool _isInRange(num distance) =>
    camera.viewportDepth <= distance && distance < double.infinity;
}
