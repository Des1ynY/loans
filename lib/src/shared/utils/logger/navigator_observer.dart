import 'package:flutter/widgets.dart';
import 'package:loans/src/shared/utils/logger/logger.dart';

class NavigationLogger extends NavigatorObserver {
  @override
  void didPush(Route<Object?> route, Route<Object?>? previousRoute) {
    $Logger.debug('$route is pushed over $previousRoute');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<Object?> route, Route<Object?>? previousRoute) {
    $Logger.debug('$route is popped to $previousRoute');
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route<Object?> route, Route<Object?>? previousRoute) {
    $Logger.debug('$route is removed');
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route<Object?>? newRoute, Route<Object?>? oldRoute}) {
    $Logger.debug('$oldRoute is replaced with $newRoute');
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
