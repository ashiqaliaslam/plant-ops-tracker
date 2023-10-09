import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/audits/providers/all_audits_provider.dart';
import 'package:plant_ops_tracker/views/components/animations/empty_contents_with_text_animation_view.dart';
import 'package:plant_ops_tracker/views/components/animations/error_animation_view.dart';
import 'package:plant_ops_tracker/views/components/animations/loading_animation_view.dart';
import 'package:plant_ops_tracker/views/components/date_time_header/status_of_week_and_shift.dart';
import 'package:plant_ops_tracker/views/constants/strings.dart';
import 'package:sticky_headers/sticky_headers.dart';

class CurrentAuditsView extends ConsumerWidget {
  const CurrentAuditsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audits = ref.watch(allAuditsProvider);
    return RefreshIndicator(
      onRefresh: () {
        // ignore: unused_result
        ref.refresh(allAuditsProvider);
        return Future.delayed(
          const Duration(seconds: 0),
        );
      },
      child: audits.when(
        data: (audits) {
          if (audits.isEmpty) {
            return const EmptyContentsWithTextAnimationView(
              text: Strings.noAudits,
            );
          } else {
            return Scaffold(
              body: StickyHeader(
                header: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: const StatusOfWeekAndShift(
                      color: Colors.blue,
                    )),
                content: ListView.builder(
                  itemCount: audits.length,
                  itemBuilder: (context, index) {
                    // final auditToString =
                    //     audits.map((audit) => audit.auditTitle).join(',');
                    final title = Text(audits.elementAt(index).auditTitle);
                    return Card(
                      child: ListTile(
                        // The argument type 'Iterable<Audit>' can't be assigned to the parameter type 'String'.
                        // title: Text(audits.elementAt(index).auditTitle),
                        title: title,
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
        error: (error, stackTrace) {
          return const ErrorAnimationView();
        },
        loading: () {
          return const LoadingAnimationView();
        },
      ),
    );
  }
}

class AuditView extends ConsumerWidget {
  const AuditView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}

class CurrentAuditsViewLLL extends StatelessWidget {
  const CurrentAuditsViewLLL({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StickyHeader(
        header: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: const StatusOfWeekAndShift(
              color: Colors.blue,
            )),
        content: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text('Item num $index'),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CurrentAuditsViewZZZZZZ extends ConsumerWidget {
  const CurrentAuditsViewZZZZZZ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final appState = ref.watch(applicationStateProvider);

    // return Scaffold(

    //   body: CustomScrollView(
    //     slivers: [
    //       SliverPersistentHeader(delegate: )
    //     ],
    //   )
    // );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // const SliverAppBar(
          //   titleTextStyle: TextStyle(fontSize: 12),
          //   pinned: true,
          //   title: StatusOfWeekAndShift(color: Colors.blue),
          // ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                StickyHeader(
                    header: Container(
                      width: double.infinity,
                      // color: Colors.orangeAccent,
                      padding: const EdgeInsets.all(16),
                      child: const StatusOfWeekAndShift(color: Colors.blue),
                    ),
                    content: const ListTile(
                      title: Text('ok'),
                    )),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
                // const ListTile(title: Text('text string')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class Section extends MultiSliver {
//   Section({
//     Key? key,
//     required String title,
//     Color headerColor = Colors.white,
//     Color titleColor = Colors.black,
//     required List<Widget> items,
//   }) : super(
//          key: key,
//          pushPinnedChildren: true,
//          children: [
//            SliverPinnedHeader(
//              child: ColoredBox(
//                color: headerColor,
//                child: ListTile(
//                  textColor: titleColor,
//                  title: Text(title),
//                ),
//            ),
//            SliverList(
//              delegate: SliverChildListDelegate.fixed(items),
//            ),
//          ],
//        );
// }
