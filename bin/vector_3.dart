import 'dart:math';

class Vector3 {

  final double x;
  final double y;
  final double z;

  const Vector3({
    required this.x,
    required this.y,
    required this.z,
  });

  const Vector3.zero() : this(
    x: 0,
    y: 0,
    z: 0,
  );

  const Vector3.right() : this(
    x: 1,
    y: 0,
    z: 0,
  );

  const Vector3.left() : this(
    x: -1,
    y: 0,
    z: 0,
  );

  const Vector3.up() : this(
    x: 0,
    y: 1,
    z: 0,
  );

  const Vector3.down() : this(
    x: 0,
    y: -1,
    z: 0,
  );

  const Vector3.forward() : this(
    x: 0,
    y: 0,
    z: 1,
  );

  const Vector3.back() : this(
    x: 0,
    y: 0,
    z: -1,
  );

  const Vector3.one() : this(
    x: 1,
    y: 1,
    z: 1,
  );

  const Vector3.positiveInfinity() : this(
    x: double.infinity,
    y: double.infinity,
    z: double.infinity,
  );

  const Vector3.negativeInfinity() : this(
    x: double.negativeInfinity,
    y: double.negativeInfinity,
    z: double.negativeInfinity,
  );

  Vector3 operator*(num other) => Vector3(
    x: other * x,
    y: other * y,
    z: other * z,
  );

  Vector3 operator+(Vector3 other) => Vector3(
    x: other.x + x,
    y: other.y + y,
    z: other.z + z,
  );

  double get squareMagnitude =>
    pow(x, 2) + pow(y, 2) + pow(z, 2) as double;

  double get magnitude =>
    sqrt(squareMagnitude);

  double operator[](int other) {

    assert(0 <= other && other <= 2);

    switch (other) {
      case 0: return x;
      case 1: return y;
      case 2: return z;
      default: return -1;
    }
  }

  Vector3 normalize() {

    var _magnitude = magnitude;

    return Vector3(
      x: x / _magnitude,
      y: y / _magnitude,
      z: z / _magnitude,
    );
  }
}
