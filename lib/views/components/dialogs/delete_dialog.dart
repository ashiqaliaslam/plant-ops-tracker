import 'package:flutter/foundation.dart' show immutable;
import 'package:plant_ops_tracker/views/components/dialogs/alert_dialog_model.dart';
import 'package:plant_ops_tracker/views/constants/strings.dart';

@immutable
class DeleteDialog extends AlertDialogModel<bool> {
  DeleteDialog({required String titleOfObjectToDelete})
      : super(
          title: '${Strings.delete} $titleOfObjectToDelete',
          message:
              '${Strings.areYouSureYouWantToDeleteThis} $titleOfObjectToDelete?',
          buttons: {
            Strings.cancel: false,
            Strings.delete: true,
          },
        );
}
