import 'dart:math';

import 'package:quiver/core.dart';

import 'euler_angles.dart';

class Quaternion {
  
  final num w;
  final num x;
  final num y;
  final num z;

  const Quaternion(this.w, this.x, this.y, this.z);

  factory Quaternion.fromEulerAngles(EulerAngles eulerAngles) {

    var cr = cos(eulerAngles.roll * 0.5);
    var sr = sin(eulerAngles.roll * 0.5);
    var cp = cos(eulerAngles.pitch * 0.5);
    var sp = sin(eulerAngles.pitch * 0.5);
    var cy = cos(eulerAngles.yaw * 0.5);
    var sy = sin(eulerAngles.yaw * 0.5);

    return Quaternion(
      cr * cp * cy + sr * sp * sy,
      sr * cp * cy - cr * sp * sy,
      cr * sp * cy + sr * cp * sy,
      cr * cp * sy - sr * sp * cy,
    );
  }

  const Quaternion.identity() : this(1, 0, 0, 0);

  EulerAngles get eulerAngles =>
    EulerAngles.fromQuaternion(this);

  Quaternion operator*(Quaternion other) => Quaternion(
    other.w * w,
    other.x + x,
    other.y + y,
    other.z + z,
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
