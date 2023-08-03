import 'package:flutter/widgets.dart';
import 'package:loans/src/shared/utils/logger/logger.dart';

class NavigationLogger extends NavigatorObserver {
  @override
  void didPush(Route<Object?> route, Route<Object?>? previousRoute) {
    $Logger.debug('${route.settings.name} is pushed over ${previousRoute?.settings.name}');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<Object?> route, Route<Object?>? previousRoute) {
    $Logger.debug('${route.settings.name} is popped to ${previousRoute?.settings.name}');
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route<Object?> route, Route<Object?>? previousRoute) {
    $Logger.debug('${route.settings.name} is removed');
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route<Object?>? newRoute, Route<Object?>? oldRoute}) {
    $Logger.debug('${oldRoute?.settings.name} is replaced with ${newRoute?.settings.name}');
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
