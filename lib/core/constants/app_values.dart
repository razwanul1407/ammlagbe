import 'package:flutter/material.dart';

abstract class AppValues {
  static const double zero = 0;
  static const double infinity = double.infinity;
  static double fullWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double fullHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // Paddings
  static const double padding_16 = 16;
  static const double paddingSmall_10 = 10;
  static const double paddingXSmall_8 = 8;
  static const double paddingLarge_24 = 24;
  static const double paddingXLarge_32 = 32;
  static const double padding_6 = 6;
  static const double padding_4 = 4;
  static const double padding_2 = 2;
  static const double padding_3 = 3;

  // Margins
  static const double margin = 16;
  static const double marginSmall = 8;
  static const double marginXSmall = 6;
  static const double marginLarge = 24;
  static const double marginXLarge = 36;
  static const double margin_40 = 40;
  static const double margin_32 = 32;
  static const double margin_18 = 18;
  static const double margin_2 = 2;
  static const double margin_4 = 4;
  static const double margin_6 = 6;
  static const double margin_12 = 12;
  static const double margin_10 = 10;
  static const double margin_30 = 30;
  static const double margin_20 = 20;

  // Container constraints
  static const double container_60 = 60;
  static const double container_72 = 72;
  static const double container_50 = 50;
  static const double container_40 = 40;
  static const double container_80 = 80;
  static const double container_100 = 100;
  static const double container_120 = 120;
  static const double container_150 = 150;
  static const double container_220 = 220;
  static const double container_180 = 180;
  static const double container_250 = 250;

  // Spaces
  static const double space = 96;
  static const double space_4 = 4;
  static const double space_6 = 6;
  static const double space_8 = 8;
  static const double space_10 = 10;
  static const double space_16 = 16;

  // Radius
  static const double radius_16 = 16;
  static const double radiusSmall_8 = 8;
  static const double radiusLarge_24 = 24;
  static const double radiusXLarge_42 = 42;
  static const double radius_6 = 6;
  static const double radius_12 = 12;
  static const double radiusRounded_60 = 60;

  // Elevations
  static const double elevationLvl0 = 0;
  static const double elevationLvl1 = 1;
  static const double elevationLvl2 = 3;
  static const double elevationLvl3 = 6;
  static const double elevationLvl4 = 10;
  static const double elevationLvl5 = 16;

  static const double circularImageDefaultSize = 90;
  static const double circularImageSize_30 = 30;
  static const int defaultAnimationDuration = 300;
  static const double listBottomEmptySpace = 200;
  static const double maxButtonWidth = 496;

  // Icons
  static const double icon_24 = 24;
  static const double iconSmall_16 = 16;
  static const double iconXSmall_12 = 12;
  static const double iconLarge_36 = 36;
  static const double iconXLarge_96 = 96;
  static const double icon_20 = 20;
  static const double icon_22 = 22;
  static const double icon_18 = 18;
  static const double icon_14 = 14;
  static const double icon_12 = 12;
  static const double icon_10 = 10;
  static const double icon_28 = 28;
  static const double icon_38 = 38;
  static const double icon_42 = 42;
  static const double icon_76 = 76;

  static const double customAppBarSize = 144.0;
  static const double collapsedAppBarSize = 70.0;

  static const int loggerLineLength = 120;
  static const int loggerErrorMethodCount = 8;
  static const int loggerMethodCount = 2;

  static const double appBarActionRippleRadius = 50;
  static const double barrierColorOpacity = 0.4;

  static const int defaultDebounceTimeInMilliSeconds = 1000;
  static const int defaultThrottleTimeInMilliSeconds = 500;

  // NavigationBar
  static const double navBarHeight = 56.0;
  static const double navDrawerItemContainer = 56.0;
  static const double bottomNavBarItemWidth = 60.0;

  // Height
  static const double height_28 = 2.8;
  static const double height_24 = 2.4;
  static const double height_20 = 2.0;
  static const double height_16 = 1.6;

  // Font sizes
  static const double fontSize_86 = 86;
  static const double fontSize_72 = 72;
  static const double fontSize_64 = 64;
  static const double fontSize_56 = 56;
  static const double fontSize_38 = 38;
  static const double fontSize_36 = 36;
  static const double fontSize_32 = 32;
  static const double fontSize_28 = 28;
  static const double fontSize_24 = 24;
  static const double fontSize_22 = 22;
  static const double fontSize_20 = 20;
  static const double fontSize_16 = 16;
  static const double fontSize_14 = 14;
  static const double fontSize_12 = 12;

  // Gridview
  static const int gridChildCount_2 = 2;
  static const int gridChildCount_3 = 3;
  static const double gridChildAspectRatio_1_25 = 1.25;
  static const double gridChildAspectRatio_1_15 = 1.15;
  static const double gridChildAspectRatio_1_35 = 1.35;
  static const double axisSpacing_1 = 1;
  static const double axisSpacing_2 = 2;
  static const double axisSpacing_3 = 3;
  static const double axisSpacing_5 = 5;
  static const double axisSpacing_10 = 10;
  static const double axisSpacing_15 = 15;
  static const double axisSpacing_20 = 20;
  static const double axisSpacing_25 = 25;
  static const double axisSpacing_30 = 30;
  static const double axisSpacing_35 = 35;

  // DateTime Format pattern
  static const yyyyMMddHHmm = "yyyy-MM-dd HH:mm";

  // Duration 1 Day
  static const duration1D = Duration(days: 1);
  static const duration2S = Duration(seconds: 2);
  static const duration1M = Duration(seconds: 60);

  // Divider
  static const double dividerThickness = .5;
  static const double dividerThickness_1 = 1;
  static const double dividerThickness_2 = 2;
  static const double dividerIndent_5 = 5;
  static const double dividerIndent_10 = 10;
}
