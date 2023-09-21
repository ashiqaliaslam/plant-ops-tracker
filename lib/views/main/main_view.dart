import 'package:flutter/material.dart';

// final GlobalKey<NavigatorState> _rootNavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'root');
// final GlobalKey<NavigatorState> _shellNavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'shell');

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Placeholder(),
      ),
    );
  }
}

/// [MainView]
// class MainView extends StatefulWidget {
//   const MainView({super.key});

//   @override
//   State<MainView> createState() => _MainViewState();
// }

// class _MainViewState extends State<MainView>
//     with TickerProviderStateMixin<MainView> {
//   int selectedPageIndex = 0;
//   List<Destination> destinations = DestinationList.allDestinations;

//   late final List<GlobalKey<NavigatorState>> navigatorKeys;
//   late final List<GlobalKey> destinationKeys;
//   late final List<AnimationController> destinationFaders;
//   late final List<Widget> destinationViews;

//   AnimationController buildFaderController() {
//     final AnimationController controller = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 200));
//     controller.addStatusListener((AnimationStatus status) {
//       if (status == AnimationStatus.dismissed) {
//         setState(() {}); // Rebuild unselected destinations offstage.
//       }
//     });
//     return controller;
//   }

//   @override
//   void initState() {
//     super.initState();
//     navigatorKeys = List<GlobalKey<NavigatorState>>.generate(
//         destinations.length, (int index) => GlobalKey()).toList();

//     destinationFaders = List<AnimationController>.generate(
//         destinations.length, (int index) => buildFaderController()).toList();

//     destinationFaders[selectedPageIndex].value = 1.0;

//     destinationViews = destinations.map((Destination destination) {
//       return FadeTransition(
//         opacity: destinationFaders[destination.index]
//             .drive(CurveTween(curve: Curves.fastOutSlowIn)),
//         child: DestinationView(
//           destination: destination,
//           navigatorKey: navigatorKeys[destination.index],
//         ),
//       );
//     }).toList();
//   }

//   @override
//   void dispose() {
//     for (final AnimationController controller in destinationFaders) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         final NavigatorState navigator =
//             navigatorKeys[selectedPageIndex].currentState!;
//         if (!navigator.canPop()) {
//           return true;
//         }
//         navigator.pop();
//         return false;
//       },
//       child: Scaffold(
//         appBar: AppBar(title: const Text(Strings.appName)),
//         body: const Text('Hello World!'),
//         bottomNavigationBar: NavigationBar(
//           selectedIndex: selectedPageIndex,
//           onDestinationSelected: (int index) {
//             setState(() {
//               selectedPageIndex = index;
//             });
//           },
//           destinations: destinations.map((Destination destination) {
//             return NavigationDestination(
//                 icon: Icon(destination.icon), label: destination.title);
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }

/// [OldMainView]
// class OldMainView extends StatefulWidget {
//   const OldMainView({super.key});

//   @override
//   State<OldMainView> createState() => _OldMainViewState();
// }

// class _OldMainViewState extends State<OldMainView>
//     with TickerProviderStateMixin<OldMainView> {
//   @override
//   Widget build(BuildContext context) {
//     AnimationController buildFaderController() {
//       final AnimationController controller = AnimationController(
//           vsync: this, duration: const Duration(milliseconds: 200));
//       controller.addStatusListener((AnimationStatus status) {
//         if (status == AnimationStatus.dismissed) {
//           setState(() {}); // Rebuild unselected destinations offstage.
//         }
//       });
//       return controller;
//     }

//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plant Ops Tracker'),
//           // actions: [
//           //   IconButton(onPressed: () {}, icon: const Icon(Icons.abc)),
//           //   IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit)),
//           // ],
//           // bottom: const TabBar(
//           //   tabs: [
//           //     Tab(icon: Icon(Icons.task)),
//           //     Tab(icon: Icon(Icons.list)),
//           //     Tab(icon: Icon(Icons.home)),
//           //   ],
//           // ),
//         ),
//         bottomNavigationBar: NavigationBar(
//           selectedIndex: currentPageIndex,
//           onDestinationSelected: (int index) {
//             setState(() {
//               currentPageIndex = index;
//             });
//           },
//           destinations: const [
//             NavigationDestination(
//               selectedIcon: Icon(Icons.task),
//               icon: Icon(Icons.task_outlined),
//               label: 'Tasks',
//             ),
//             NavigationDestination(
//               selectedIcon: Icon(Icons.health_and_safety),
//               icon: Icon(Icons.health_and_safety_outlined),
//               label: 'HSE',
//             ),
//             NavigationDestination(
//               selectedIcon: Icon(Icons.power),
//               icon: Icon(Icons.power_outlined),
//               label: 'Power',
//             ),
//           ],
//         ),
//         // body: [
//         //   const AuditListView(),
//         //   const TalkListView(),
//         //   const ChangeOverListView(),
//         // ][currentPageIndex],
//       ),
//     );
//     // );
//   }
// }

/// [DestinationView]
// class DestinationView extends StatefulWidget {
//   const DestinationView({
//     super.key,
//     required this.destination,
//     required this.navigatorKey,
//   });

//   final Destination destination;
//   final Key navigatorKey;

//   @override
//   State<DestinationView> createState() => _DestinationViewState();
// }

// class _DestinationViewState extends State<DestinationView> {
//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: widget.navigatorKey,
//       onGenerateRoute: (settings) {
//         return MaterialPageRoute(
//           settings: settings,
//           builder: (context) {
//             switch (settings.name) {
//               case '/audits':
//                 return AuditListView(destination: widget.destination);
//               case '/talks':
//                 return TalkListView(destination: widget.destination);
//               case '/changeovers':
//                 return ChangeOverListView(destination: widget.destination);
//             }
//             assert(false);
//             return const SizedBox();
//           },
//         );
//       },
//     );
//   }
// }
