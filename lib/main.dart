import 'package:flutter/material.dart';
import 'package:flutter_task/app.dart';
import 'package:flutter_task/providers/my_provider.dart';
import 'package:flutter_task/utils/screen-config/screen_config.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      LayoutBuilder(
        builder: (context, constraints) => OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => MyProvider()),
              ],
              child: const App(),
            );
          },
        ),
      ),
    );
