import 'package:flutter/material.dart';

import 'core/di/di.dart';
import 'core/utils/app_router.dart';

void main() async {
  configureDependencies();
  runApp(RickAndMorty(
    appRouter: AppRouter(),
  ));
}

class RickAndMorty extends StatelessWidget {
  const RickAndMorty({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
