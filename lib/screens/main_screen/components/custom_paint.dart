import 'package:flutter/material.dart';

// class CustomShapePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Color(0xFF18BC7A) // Couleur de remplissage verte
//       ..style = PaintingStyle.fill;

//     final path = Path()
//       ..moveTo(0, 18)
//       ..lineTo(0, size.height - 18)
//       ..quadraticBezierTo(0, size.height, 18, size.height)
//       ..lineTo(size.width - 18, size.height)
//       ..quadraticBezierTo(size.width, size.height, size.width, size.height - 18)
//       ..lineTo(size.width, 100) //44.0375
//       ..quadraticBezierTo(size.width, 62.0375, size.width - 18, 62.0375)
//       ..lineTo(310.5, 62.0375)
//       ..quadraticBezierTo(292.5, 62.0375, 292.5, 44.0375)
//       ..lineTo(292.5, 18)
//       ..quadraticBezierTo(292.5, 0, 310.5, 0)
//       ..lineTo(size.width - 18, 0)
//       ..quadraticBezierTo(0, 0, 0, 18);

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF18BC7A) // Couleur de remplissage verte
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 18)
      ..quadraticBezierTo(0, 0, 18, 0)
      ..lineTo(size.width - 18, 0)
      ..quadraticBezierTo(size.width, 0, size.width, 18)
      ..lineTo(size.width, size.height - 18)
      ..quadraticBezierTo(size.width, size.height, size.width - 18, size.height)
      ..lineTo(18, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - 18);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
