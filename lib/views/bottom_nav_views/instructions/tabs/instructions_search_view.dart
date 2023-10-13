import 'package:flutter/material.dart';

class InstructionsSearchView extends StatelessWidget {
  const InstructionsSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Item num $index'),
            ),
          );
        },
      ),
      // ),
    );
  }
}


/// [GroupListView]
// class CustomSearchAuditsView extends StatefulWidget {
//   const CustomSearchAuditsView({super.key});

//   @override
//   State<CustomSearchAuditsView> createState() => _CustomSearchAuditsViewState();
// }

// class _CustomSearchAuditsViewState extends State<CustomSearchAuditsView> {
//   final elements = [
//     {'group': 'Team A', 'name': 'teamA'},
//     {'group': 'Team B', 'name': 'teamB'},
//     {'group': 'Team C', 'name': 'teamC'},
//     {'group': 'Team D', 'name': 'teamD'},
//     {'group': 'Team G', 'name': 'teamG'},
//     {'group': 'Team A', 'name': '1'},
//     {'group': 'Team B', 'name': '2'},
//     {'group': 'Team C', 'name': 'tea3mC'},
//     {'group': 'Team D', 'name': 'tea4mD'},
//     {'group': 'Team G', 'name': 'tea5mG'},
//     {'group': 'Team A', 'name': 'team6A'},
//     {'group': 'Team B', 'name': 'tea7mB'},
//     {'group': 'Team C', 'name': 'te8amC'},
//     {'group': 'Team D', 'name': 'tea9mD'},
//     {'group': 'Team G', 'name': 'tea0mG'},
//     {'group': 'Team A', 'name': 'tea-mA'},
//     {'group': 'Team B', 'name': 'te=amB'},
//     {'group': 'Team C', 'name': 'tea7mC'},
//     {'group': 'Team D', 'name': 'tea5mD'},
//     {'group': 'Team G', 'name': 'teaemG'},
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: GroupedListView<dynamic, String>(
//       useStickyGroupSeparators: true,
//       itemComparator: (element1, element2) =>
//           element1['name'].compareTo(element2['name']),
//       groupComparator: (value1, value2) => value2.compareTo(value1),
//       elements: elements,
//       groupBy: (element) => element['group'],
//       groupSeparatorBuilder: (value) => Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(16),
//         color: Colors.orangeAccent,
//         child: Text(
//           value,
//           style: const TextStyle(color: Colors.black),
//         ),
//       ),
//       itemBuilder: (context, element) => Card(
//         elevation: 4,
//         child: ListTile(
//           // contentPadding: const EdgeInsets.all(4),
//           title: Text(element['name']),
//         ),
//       ),
//     ));
//   }
// }

/// [StickyHeader() ]
// class CustomSearchAuditsView extends StatelessWidget {
//   const CustomSearchAuditsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 50,
//       itemBuilder: (context, index) => StickyHeader(
//         header: Container(
//           width: double.infinity,
//           color: Colors.orangeAccent,
//           padding: const EdgeInsets.all(16),
//           child: Text('Stickey Header $index'),
//         ),
//         content: Image.network(
//           'https://source.unsplash.com/random?sig=$index',
//           fit: BoxFit.cover,
//           width: double.infinity,
//           height: 200,
//         ),
//       ),
//     );
//   }
// }
