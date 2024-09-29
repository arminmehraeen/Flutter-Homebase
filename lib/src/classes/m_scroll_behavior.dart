import 'dart:ui';

import 'package:flutter/material.dart';

class MScrollBehavior extends MaterialScrollBehavior {
  // Override the dragDevices property to specify which pointer devices can initiate dragging
  @override
  Set<PointerDeviceKind> get dragDevices => {
        // Define the allowed pointer devices for dragging
        PointerDeviceKind.touch, // Touchscreen devices
        PointerDeviceKind.mouse, // Mouse devices
      };
}
