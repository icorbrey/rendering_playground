import 'dart:math';

import 'package:tuple/tuple.dart';

import '../structs/quaternion.dart';
import '../structs/shader.dart';
import '../structs/vector_3.dart';
import 'scene_object.dart';

class Sphere extends SceneObject {

  @override Shader shader;
  @override Vector3 position;
  @override Quaternion rotation;

  num radius;

  Sphere({
    required this.position,
    required this.rotation,
    required this.radius,
    required this.shader,
  });

  factory Sphere.fromMap(Map sphere) => Sphere(
    rotation: Quaternion.fromMap(sphere['rotation']),
    position: Vector3.fromMap(sphere['position']),
    shader: Shader.fromMap(sphere['shader']),
    radius: sphere['radius'] ?? 1,
  );

  @override
  Tuple2<num, num> intersect(Vector3 origin, Vector3 viewportIntersection) {

    var offset = origin - position;

    var a = viewportIntersection ^ viewportIntersection;
    var b = 2 * (offset ^ viewportIntersection);
    var c = (offset ^ offset) - pow(radius, 2);

    var discriminant = pow(b, 2) - 4 * a * c;

    if (discriminant < 0) {
      return Tuple2(double.infinity, double.infinity); 
    }

    var near = (-b + sqrt(discriminant)) / (2 * a);
    var far = (-b - sqrt(discriminant)) / (2 * a);

    return Tuple2(near, far);
  }

  @override
  Vector3 getNormal(Vector3 intersection) =>
    (intersection - position).normalized;
}
