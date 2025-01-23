import 'package:auto_route/auto_route.dart';
import 'package:fenix/features/movie/presentation/views/movies_view.dart';

part "router.gr.dart";

@AutoRouterConfig(replaceInRouteName: "View|Screen|Page,Route")
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [];
}

@RoutePage(name: 'EmptyRouter')
class EmptyRouterPage extends AutoRouter {
  const EmptyRouterPage({super.key});
}
