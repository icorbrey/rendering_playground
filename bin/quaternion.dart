import 'dart:math';

import 'package:quiver/core.dart';

import 'vector_3.dart';

class Quaternion {
  
  final double w;
  final double x;
  final double y;
  final double z;

  const Quaternion({
    required this.w,
    required this.x,
    required this.y,
    required this.z,
  });

  factory Quaternion.fromEulerAngles(Vector3 eulerAngles) {

    var cr = cos(eulerAngles.x * 0.5);
    var sr = sin(eulerAngles.x * 0.5);
    var cp = cos(eulerAngles.y * 0.5);
    var sp = sin(eulerAngles.y * 0.5);
    var cy = cos(eulerAngles.z * 0.5);
    var sy = sin(eulerAngles.z * 0.5);

    return Quaternion(
      w: cr * cp * cy + sr * sp * sy,
      x: sr * cp * cy - cr * sp * sy,
      y: cr * sp * cy + sr * cp * sy,
      z: cr * cp * sy - sr * sp * cy,
    );
  }

  const Quaternion.identity() : this(
    w: 1,
    x: 0,
    y: 0,
    z: 0,
  );

  Vector3 get eulerAngles => Vector3(
    x: _roll,
    y: _pitch,
    z: _yaw,
  );

  double get _roll => atan2(
    2 * (w * x + y * z),
    1 - 2 * (pow(x, 2) + pow(y, 2)),
  );

  double get _pitch {
    var sinp = 2 * (w * y + x * z);
    return 1 <= sinp.abs()
      ? pi / 2 * (sinp / sinp.abs())
      : asin(sinp);
  }

  double get _yaw => atan2(
    2 * (w * z + x * y),
    1 - 2 * (pow(y, 2) + pow(z, 2)),
  );

  Quaternion operator+(Quaternion other) => Quaternion(
    w: other.w + w, 
    x: other.x + x, 
    y: other.y + y, 
    z: other.z + z,
  );

  @override
  bool operator==(other) => other is Quaternion
    && other.w == w
    && other.x == x
    && other.y == y
    && other.z == z;

  @override
  int get hashCode => hash4(
    w.hashCode,
    x.hashCode,
    y.hashCode,
    z.hashCode,
  );
}
