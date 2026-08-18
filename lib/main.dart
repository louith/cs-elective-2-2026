// pubspec.yaml needs:
//   dependencies:
//     go_router: ^14.0.0

import 'package:cs_elective_2/FlightDetails.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const MyApp());

// ---------------------------------------------------------------
// 1. The router — this ONE object replaces ALL of:
//    AppRoutePath, AppRouteInformationParser, AND AppRouterDelegate
//    from the raw Navigator 2.0 version.
//
//    You just list your routes. go_router handles the room list,
//    the deep-link parsing, and the back-button logic for you.
// ---------------------------------------------------------------
final GoRouter _router = GoRouter(
  initialLocation: '/',
  // refreshListenable: state,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        // Nested under '/', so the full path becomes /details/:id.
        // This also tells go_router "Details lives behind Home",
        // so back-press and deep links both behave correctly.
        GoRoute(
          path: 'details/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return DetailScreen(id: int.parse(id));
          },
        ),
      ],
    ),

    GoRoute(
      path: '/flight-details',
      builder: (context, state) => FlightDetails(),
    ),
  ],
);

// ---------------------------------------------------------------
// 2. MyApp — hand the router to MaterialApp.router. That's it.
// ---------------------------------------------------------------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'go_router Demo', routerConfig: _router);
  }
}

// ---------------------------------------------------------------
// 3. The two screens — notice HomeScreen no longer needs a
//    function passed in. It just navigates by URL, directly.
// ---------------------------------------------------------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          icon: Icon(Icons.chevron_left_outlined, color: Colors.white),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/details/42'),
          child: const Text('View Item 42'),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final int id;
  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Item $id')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/flight-details'),
          child: const Text('Go to Flight Details'),
        ),
      ),
    );
  }
}
