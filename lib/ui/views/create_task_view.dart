import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tagging/flutter_tagging.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:tasks/ui/constants/color_constants.dart';
import '../../core/viewmodels/views/create_task_viewmodel.dart';
import 'create_task_view.form.dart';
List<Language> _selectedLanguages = [];
@FormView(
    fields: [FormTextField(name: 'title'), FormDateField(name: 'dueDate')])
class TaskDetailScreen extends StatelessWidget with $TaskDetailScreen {
  TaskDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TaskDetailViewModel>.reactive(
        onModelReady: (model) => listenToFormUpdated(model),
        viewModelBuilder: () => TaskDetailViewModel(),
        builder: (context, model, child) => Scaffold(
            resizeToAvoidBottomInset: true, // set it to false
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.all(20)),
                    Row(
                      children: [
                        TextButton.icon(
                            onPressed: (() => {Navigator.pop(context)}),
                            icon: const Icon(Icons.arrow_back),
                            label: const Text("To go back")),
                             Spacer(),
                            //  Container(width: 20, height: double.infinity, color: Colors.amber,),
                            TextButton(
                                  onPressed: () async =>
                                      {await model.addTask(), model.move},
                                  child: const Text("Add Task", style: TextStyle(color: Colors.white)),
                                  style: ButtonStyle(
                                    
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              ColorConstants.dodgerblueAppColor.withOpacity(0.6)),
                                      minimumSize: MaterialStateProperty.all(
                                          const Size(100, 40))),
                                ),
                            Padding(padding: EdgeInsets.only(right: 10)),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    Row(
                      children: const [
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Text("New Task",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w900)),
                      ],
                    ),
                    Divider(
                      color: Colors.white.withOpacity(.08),
                      thickness: 2,
                      endIndent: 20,
                      indent: 20,
                    ),
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 300)),
                        const Padding(padding: EdgeInsets.only(left: 20)),
                        Flexible(
                          child: Form(
                            child: Column(
                              children: [
                                const Padding(padding: EdgeInsets.all(15)),
                                // Add Task Name
                                TextFormField(
                                  controller: titleController,
                                  decoration: InputDecoration(
                                    labelText: "Task Name",
                                    labelStyle: TextStyle(
                                        color: ColorConstants.altoTypographyColor
                                            .withOpacity(.5)),
                                    fillColor:
                                        ColorConstants.sharkBackgroundColor,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide: const BorderSide(),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    // model.taskName = value;
                                  },
                                ),
                                const Padding(padding: EdgeInsets.all(15)),
                                // Choose Due Date
                                TextFormField(
                                  controller: dateController,
                                  decoration: InputDecoration(
                                    labelText: "Task Due Date",
                                    suffixIcon: Icon(
                                      Icons.calendar_today,
                                      color: ColorConstants.dodgerblueAppColor,
                                    ),
                                    labelStyle: TextStyle(
                                        color: ColorConstants.altoTypographyColor
                                            .withOpacity(.5)),
                                    fillColor:
                                        ColorConstants.sharkBackgroundColor,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide: const BorderSide(),
                                    ),
                                  ),
                                  onTap: () async {
                                    DateTime? date = DateTime(1900);
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
              
                                    date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100));
                                    if (date != null) {
                                      dateController.text =
                                          DateFormat('yyyy-MM-dd').format(date);
                                    } else {
                                      dateController.text = "";
                                    }
                                  },
                                ),
                                const Padding(padding: EdgeInsets.all(20)),
                                // Build a category dropdown
                                DropdownButtonFormField(
                                  dropdownColor: ColorConstants.darkwoodsmokeAppColor,
                                  decoration: InputDecoration(
                                    labelText: "Priority",
                                    labelStyle: TextStyle(
                                        color: ColorConstants.altoTypographyColor
                                            .withOpacity(.5)),
                                    fillColor:
                                        ColorConstants.sharkBackgroundColor,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide: const BorderSide(),
                                    ),
                                  ),
                                  value: model.selectedCategory.isNotEmpty
                                      ? model.selectedCategory
                                      : null,
                                  items: model.categories.map((category) {
                                    return DropdownMenuItem(
                                      value: category,
                                      child: Text(category, style: TextStyle(color: Colors.white),),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    model.selectedCategory = value.toString();
                                  },
                                ),
                                const Padding(padding: EdgeInsets.all(15)),
              FlutterTagging<Language>(
                  initialItems: _selectedLanguages,
                  textFieldConfiguration: TextFieldConfiguration(
                                  decoration: InputDecoration(
                                    labelText: "Category",
                                    labelStyle: TextStyle(
                                        color: ColorConstants.altoTypographyColor
                                            .withOpacity(.5)),
                                    fillColor:
                                        ColorConstants.sharkBackgroundColor,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide: const BorderSide(),
                                    ),
                                  ),
                  ),
                  findSuggestions: LanguageService.getLanguages,
                  additionCallback: (value) {
                      return Language(
                  name: value,
                  position: 0,
                      );
                  },
                  onAdded: (language){
                    // api calls here, triggered when add to tag button is pressed
                      return  Language(
                  name: language.name,
                  position: 0,
                    
                      );
                  },
                  configureSuggestion: (lang) {
                      return SuggestionConfiguration(
                          title: Text(lang.name, style: TextStyle(color: Colors.black)),
                          splashColor: ColorConstants.sharkBackgroundColor,
                          additionWidget: const Chip(
                  avatar: Icon(
                      Icons.add_circle,
                      color: Colors.white,
                  ),
                  label: Text('Add New Tag'),
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                  ),
                  backgroundColor: Color.fromARGB(255, 18, 148, 242),
                          ),
                      );
                  },
                  configureChip: (lang) {
                      return ChipConfiguration(
                          label: Text(lang.name),
                          backgroundColor: const Color.fromARGB(255, 18, 148, 242),
                          labelStyle: const TextStyle(color: Colors.white),
                          deleteIconColor: Colors.white,
                      );
                  },
                  onChanged: () {
                    if (kDebugMode) {
                      print("");
                    }
                  }
              ),
                                const Padding(padding: EdgeInsets.all(15)),
              
                                TextFormField(
                                  controller: titleController,
                                  minLines:
                                      6, // any number you need (It works as the rows for the textarea)
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    labelText: "Notes",
                                    labelStyle: TextStyle(
                                        color: ColorConstants.altoTypographyColor
                                            .withOpacity(.5)),
                                    fillColor:
                                        ColorConstants.sharkBackgroundColor,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide: const BorderSide(),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    model.notes = value.toString();
                                  },
                                ),
                                const Padding(padding: EdgeInsets.all(20)),
                                
                              ],
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(right: 20)),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}

/// Language Class
class Language extends Taggable {
  ///
  final String name;

  ///
  final int position;

  /// Creates Language
  const Language({
    required this.name,
    required this.position,
  });

  @override
  List<Object> get props => [name];

  /// Converts the class to json string.
  String toJson() => '''  {
    "name": $name,\n
    "position": $position\n
  }''';
}

class LanguageService {
    /// Mocks fetching language from network API with delay of 500ms.
    static Future<List<Language>> getLanguages(String query) async {
          await Future.delayed(const Duration(milliseconds: 500), null);
          return <Language>[
            const Language(name: 'JavaScript', position: 1),
            const Language(name: 'Python', position: 2),
            const Language(name: 'Java', position: 3),
            const Language(name: 'PHP', position: 4),
            const Language(name: 'C#', position: 5),
            const Language(name: 'C++', position: 6),
          ].where((lang) => lang.name!.toLowerCase().contains(query.toLowerCase())).toList();
    }
}
  Widget buildAddButton() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.pinkAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Icon(
            Icons.add,
            color: Colors.white,
            size: 15.0,
          ),
          Text(
            "Add New Tag",
            style: TextStyle(color: Colors.white, fontSize: 14.0),
          ),
        ],
      ),
    );
  }