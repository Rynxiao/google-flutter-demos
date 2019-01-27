import 'package:flutter/material.dart';
import './src/random_words.dart';
import './src/gesture.dart';
import './src/text_input.dart';
import './src/platform.dart';
import './src/fade_animation.dart';
import './src/local_image.dart';
import './src/local_json.dart';
import './src/stepper.dart';
import './src/tabs.dart';
import './src/bottom_navigation_tab.dart';
import './src/font.dart';
import './src/gradient.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    RandomWords.routeName: (BuildContext context) => RandomWords(),
    GestureWidget.routeName: (BuildContext context) => GestureWidget(),
    PlatformWidget.routeName: (BuildContext context) => PlatformWidget(),
    LogoFade.routeName: (BuildContext context) => LogoFade(),
    LocalImageWidget.routeName: (BuildContext context) =>
        LocalImageWidget(),
    LocalJsonWidget.routeName: (BuildContext context) => LocalJsonWidget(),
    StepperWidget.routeName: (BuildContext context) => StepperWidget(),
    TabsWidget.routeName: (BuildContext context) => TabsWidget(),
    BottomNavigationTabWidget.routeName: (BuildContext context) =>
        BottomNavigationTabWidget(),
    FontWidget.routeName: (BuildContext context) => FontWidget(),
    GradientWidget.routeName: (BuildContext context) => GradientWidget(),
    TextInputWidget.routeName: (BuildContext context) => TextInputWidget(),
  };
}

Map<String, String> getRoutesName() {
  return <String, String>{
    RandomWords.routeName: 'Random Words',
    GestureWidget.routeName: 'Gesture',
    PlatformWidget.routeName: 'Platform',
    LogoFade.routeName: 'Logo Fade',
    LocalImageWidget.routeName: 'Local Image',
    LocalJsonWidget.routeName: 'Local Json',
    StepperWidget.routeName: 'Stepper',
    TabsWidget.routeName: 'Tabs',
    BottomNavigationTabWidget.routeName: 'Bottom Navigation Tab',
    FontWidget.routeName: 'Font',
    GradientWidget.routeName: 'Gradient',
    TextInputWidget.routeName: 'Text Input',
  };
}