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
      viewportWidth: 1,
      viewportHeight: 1,
    ),
    objects: [
      Sphere(
        position: Vector3.forward() * 4,
        rotation: Quaternion.identity(),
        color: Color.red(),
        radius: 0.5,
      ),
      Sphere(
        position: Vector3.forward() * 5 + Vector3.left() + Vector3.down(),
        rotation: Quaternion.identity(),
        color: Color.green(),
        radius: 0.5,
      ),
      Sphere(
        position: Vector3.forward() * 6 + Vector3.right() * 2 + Vector3.up() * 0.5,
        rotation: Quaternion.identity(),
        color: Color.blue(),
        radius: 0.5,
      ),
    ],
  );

  raytracer.render();
  canvas.export('/mnt/c/Users/icorbrey/Pictures/render.png');
}
