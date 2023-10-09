import 'package:flutter/material.dart';
import 'package:plant_ops_tracker/state/audits/models/audit.dart';

class AuditView extends StatelessWidget {
  final Iterable<Audit> audits;

  const AuditView({
    super.key,
    required this.audits,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: audits.length,
      itemBuilder: (context, index) {
        final audit = audits.elementAt(index);
        return Text(audit.auditTitle);
      },
    );
  }
}
