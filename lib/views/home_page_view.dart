import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'package:flutter/material.dart';
import 'package:plant_ops_tracker/widgets/header.dart';
import 'package:plant_ops_tracker/widgets/icon_and_detail.dart';
import 'package:plant_ops_tracker/widgets/paragraph.dart';
import 'package:plant_ops_tracker/widgets/styled_button.dart';
import 'package:plant_ops_tracker/widgets/time_notifier.dart';

import '../authentication/app_state.dart';
import 'guest_book_view.dart';
import '../authentication/authentication.dart';
import '../models/yes_no_selection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePageView extends ConsumerWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/fpcl_logo_white_bg.jpg',
          fit: BoxFit.fill,
          // height: 100,
          // width: 80,
        ),
        title: const Text('Plant Ops Tracker'),
        // backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: <Widget>[
          Image.asset(
            'assets/fpcl_logo_white_bg.jpg',
            height: 110,
            // width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Consumer(
            builder: (context, ref, child) {
              final dateTime = ref.watch(dateTimeProvider.notifier);

              return Column(
                children: [
                  Row(
                    children: [
                      TitleAndValue(
                          text: 'Time', child: Text(dateTime.nowTime)),
                      const SizedBox(width: 50),
                      TitleAndValue(
                          text: 'Date', child: Text(dateTime.nowDate)),
                      const SizedBox(width: 20),
                    ],
                  ),
                  Row(
                    children: [
                      TitleAndValue(
                          text: 'Day Name', child: Text(dateTime.nowDayName)),
                      const SizedBox(width: 50),
                      TitleAndValue(
                          text: 'Month', child: Text(dateTime.nowMonth)),
                      const SizedBox(width: 20),
                    ],
                  ),
                  Row(
                    children: [
                      TitleAndValue(
                          text: 'Day Count',
                          child: Text(dateTime.nowDayCount.toString())),
                      const SizedBox(width: 50),
                      TitleAndValue(
                          text: 'Week No.',
                          child: Text(dateTime.weekNumber.toString())),
                      const SizedBox(width: 20),
                    ],
                  ),
                ],
              );
            },
          ),

          const IconAndDetail(Icons.factory, 'FPCL'),
          Consumer(
            builder: (context, ref, child) {
              final appState = ref.watch(appStateProvider);
              return AuthFunc(
                loggedIn: appState.loggedIn,
                signOut: () {
                  FirebaseAuth.instance.signOut();
                },
              );
            },
          ),

          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          // const Header("What we'll be doing"),

          Paragraph(appState.callToAction),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              switch (appState.attendees) {
                1 => const Paragraph('1 person going'),
                >= 2 => Paragraph('${appState.attendees} people going'),
                _ => const Paragraph('No one going'),
              },
              if (appState.loggedIn) ...[
                YesNoSelection(
                  state: appState.attending,
                  onSelection: (attending) => appState.attending = attending,
                ),
                const Header('Discussion'),
                GuestBookView(
                  addMessage: (message) =>
                      appState.addMessageToGuestBook(message),
                  messages: appState.guestBookMessages,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
