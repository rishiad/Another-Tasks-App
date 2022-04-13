// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unnecessary_this
// ignore_for_file: unused_import
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';


const String TitleValueKey = 'title';
const String DueDateValueKey = 'dueDate';

mixin $TaskDetailScreen on StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final FocusNode titleFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    titleController.addListener(() => _updateFormData(model));
    dateController.addListener(() => _updateFormData(model));
  }
  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) =>  model.setData(
    
        model.formValueMap
          ..addAll({
            TitleValueKey: titleController.text,
            DueDateValueKey: dateController.text
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    titleController.dispose();
    dateController.dispose();
    titleFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get titleValue => this.formValueMap[TitleValueKey] as String?;
  String? get dueDateValue => this.formValueMap[DueDateValueKey] as String?;

  bool get hasTitle => this.formValueMap.containsKey(TitleValueKey);
  bool get hasDueDate => this.formValueMap.containsKey(DueDateValueKey);

  bool get hasTitleValidationMessage =>
      this.fieldsValidationMessages[TitleValueKey]?.isNotEmpty ?? false;
  bool get hasDueDateValidationMessage =>
      this.fieldsValidationMessages[DueDateValueKey]?.isNotEmpty ?? false;

  String? get titleValidationMessage =>
      this.fieldsValidationMessages[TitleValueKey];
  String? get dueDateValidationMessage =>
      this.fieldsValidationMessages[DueDateValueKey];
}

extension Methods on FormViewModel {
  Future<void> selectDueDate(
      {required BuildContext context,
      required DateTime initialDate,
      required DateTime firstDate,
      required DateTime lastDate}) async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate);
    if (selectedDate != null) {
      this.setData(this.formValueMap..addAll({DueDateValueKey: selectedDate}));
    }
  }

  setTitleValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TitleValueKey] = validationMessage;
  setDueDateValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DueDateValueKey] = validationMessage;
}
