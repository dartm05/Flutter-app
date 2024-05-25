import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:project1/injectable.dart';

import 'presentation/core/app_widget.dart';

void main() {
  configInjector(getIt, env: Environment.prod);
  runApp(const AppWidget());
}
