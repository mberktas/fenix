// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [EmptyRouterPage]
class EmptyRouter extends PageRouteInfo<void> {
  const EmptyRouter({List<PageRouteInfo>? children})
    : super(EmptyRouter.name, initialChildren: children);

  static const String name = 'EmptyRouter';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EmptyRouterPage();
    },
  );
}

/// generated route for
/// [MoviesView]
class MoviesRoute extends PageRouteInfo<void> {
  const MoviesRoute({List<PageRouteInfo>? children})
    : super(MoviesRoute.name, initialChildren: children);

  static const String name = 'MoviesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MoviesView();
    },
  );
}
