import 'camera.dart';
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

  var camera = Camera(
    position: Vector3.zero(),
    rotation: Quaternion.identity(),
    viewportDepth: 1,
    viewportWidth: 1,
    viewportHeight: 1,
  );

  var objects = [
    Sphere(
      position: Vector3.forward() * 4,
      rotation: Quaternion.identity(),
      radius: 0.5,
    ),
  ];

  var raytracer = Raytracer(
    canvas: canvas,
    camera: camera,
    objects: objects,
  );
}
