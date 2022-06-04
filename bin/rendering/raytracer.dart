import '../scenes/scene.dart';
import '../objects/scene_object.dart';
import '../structs/color.dart';
import '../structs/vector_2.dart';
import '../structs/vector_3.dart';

class Raytracer {

  final Scene scene;

  final backgroundColor = Color.white();

  Raytracer(this.scene);

  void render() {
    for (var x = scene.canvas.minX; x < scene.canvas.maxX; x++) {
      for (var y = scene.canvas.minY; y < scene.canvas.maxY; y++) {
        var viewportCoord = _toViewportCoord(Vector2(x, y));
        var object = _getClosestObject(viewportCoord);
        scene.canvas.paintPixel(x, y, object?.color ?? backgroundColor);
      }
    }
  }

  SceneObject? _getClosestObject(Vector3 viewportIntersection) {

    num closestIntersection = double.infinity;
    SceneObject? closestObject;

    for (var object in scene.objects) {

      var intersections = object.intersect(scene.camera.position, viewportIntersection);
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
    canvasCoord.x * (scene.camera.viewportWidth / scene.canvas.width),
    canvasCoord.y * (scene.camera.viewportHeight / scene.canvas.height),
    scene.camera.viewportDepth
  );

  bool _isInRange(num distance) =>
    scene.camera.viewportDepth <= distance && distance < double.infinity;
}
