import 'dart:math';

import 'quaternion.dart';
import 'vector_3.dart';

class EulerAngles extends Vector3 {

  double get roll => x;
  double get pitch => y;
  double get yaw => z;

  EulerAngles(double roll, double pitch, double yaw)
    : super(roll, pitch, yaw);

  factory EulerAngles.fromQuaternion(Quaternion q) {

    var _roll = atan2(
      2 * (q.w * q.x + q.y * q.z),
      1 - 2 * (pow(q.x, 2) + pow(q.y, 2)),
    );

    var sinP = 2 * (q.w * q.y + q.x * q.z);
    var _pitch = 1 <= sinP.abs()
        ? pi / 2 * (sinP / sinP.abs())
        : asin(sinP);

    var _yaw = atan2(
      2 * (q.w * q.z + q.x * q.y),
      1 - 2 * (pow(q.y, 2) + pow(q.z, 2)),
    );

    return EulerAngles(_roll, _pitch, _yaw);
  }

  Quaternion get quaternion =>
    Quaternion.fromEulerAngles(this);
}
