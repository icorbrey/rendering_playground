import 'dart:math';

import 'package:quiver/core.dart';

import 'euler_angles.dart';

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

  factory Quaternion.fromEulerAngles(EulerAngles eulerAngles) {

    var cr = cos(eulerAngles.roll * 0.5);
    var sr = sin(eulerAngles.roll * 0.5);
    var cp = cos(eulerAngles.pitch * 0.5);
    var sp = sin(eulerAngles.pitch * 0.5);
    var cy = cos(eulerAngles.yaw * 0.5);
    var sy = sin(eulerAngles.yaw * 0.5);

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

  EulerAngles get eulerAngles =>
    EulerAngles.fromQuaternion(this);

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
