
import 'dart:ui';

import 'package:choice_x_admin/core/constants/palette.dart';

Color getAvatarColor(String name) =>
    palette[name.hashCode.abs() % palette.length];
