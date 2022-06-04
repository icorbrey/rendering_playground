import 'objects/camera.dart';
import 'objects/sphere.dart';
import 'rendering/image_canvas.dart';
import 'rendering/raytracer.dart';
import 'structs/color.dart';
import 'structs/quaternion.dart';
import 'structs/vector_3.dart';

void main(List<String> arguments) {
  
  var canvas = ImageCanvas(
    width: 1920,
    height: 1080,
  );

  var raytracer = Raytracer(
    canvas: canvas,
    camera: Camera(
      position: Vector3.zero(),
      rotation: Quaternion.identity(),
      viewportDepth: 1,
      viewportWidth: 1.920,
      viewportHeight: 1.080,
    ),
    objects: [
      Sphere(
        position: Vector3(0, -1, 3),
        rotation: Quaternion.identity(),
        color: Color.red(),
        radius: 1,
      ),
      Sphere(
        position: Vector3(2, 0, 4),
        rotation: Quaternion.identity(),
        color: Color.green(),
        radius: 1,
      ),
      Sphere(
        position: Vector3(-2, 0, 4),
        rotation: Quaternion.identity(),
        color: Color.blue(),
        radius: 1,
      ),
    ],
  );

  raytracer.render();
  canvas.export('/mnt/c/Users/icorbrey/Pictures/render.png');
}
