import 'camera.dart';
import 'color.dart';
import 'image_canvas.dart';
import 'quaternion.dart';
import 'raytracer.dart';
import 'sphere.dart';
import 'vector_3.dart';

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
