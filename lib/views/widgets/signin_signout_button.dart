// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:plant_ops_tracker/state/auth/providers/auth_state_provider.dart';
// import 'package:plant_ops_tracker/views/widgets/styled_button.dart';

// class LoginLogoutButton extends ConsumerWidget {
//   const LoginLogoutButton({
//     super.key,
//     required this.loggedIn,
//     // required this.signOut,
//   });

//   final bool loggedIn;
//   // final void Function() signOut;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final logOut = ref.read(authStateProvider.notifier).logOut();
//     return Padding(
//       padding: const EdgeInsets.only(left: 24, bottom: 8),
//       child: StyledButton(
//           onPressed: () {
//             !loggedIn ? context.push('/sign-in') : logOut;
//           },
//           child: !loggedIn
//               ? const Text('Sign In to Create')
//               : const Text('Logout')),
//     );
//   }
// }
